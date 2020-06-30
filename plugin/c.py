import re
import socket
import sys
import time
import os
import random
import copy
import json
import argparse
import socket
import codecs

class Translation:
    translation = {
        'engine': '',
        'phonetic': '',
        'paraphrase': '',
        'explain': []
    }
    def __init__(self, engine):
        pass

    def __new__(self, engine):
        translation = copy.deepcopy(self.translation)
        translation['engine'] = engine
        return translation

    def __setitem__(self, k, v):
        self.translation.update({k: v})

    def __str__(self):
        return str(self.translation)

class CibaTranslator (BasicTranslator):

    def __init__(self, name='ciba'):
        self._name = name
        self._agent = None
        self._trans = Translation(name)

    def translate(self, sl, tl, text):
        url = 'https://fy.iciba.com/ajax.php'
        req = {}
        req['a'] = 'fy'
        req['f'] = sl
        req['t'] = tl
        req['w'] = text
        r = self.http_get(url, req, None)
        if r:
            resp = json.loads(r)
            if not resp:
                return

            self._trans['paraphrase'] = ''
            if 'content' in resp:
                if 'ph_en' in resp['content']:
                    self._trans['phonetic'] = resp['content']['ph_en'] or ''  # sometimes it responses `None`
                if 'out' in resp['content']:
                    self._trans['paraphrase'] = resp['content']['out'] or ''
                if 'word_mean' in resp['content']:
                    self._trans['explain'] = resp['content']['word_mean'] or ''
        return self._trans

class BasicTranslator(object):

    def __init__(self, name):
        self._name = name
        self._agent = None
        self._trans = Translation(name)

    def request(self, url, data=None, post=False, header=None):
        if header:
            header = copy.deepcopy(header)
        else:
            header = {}
            header['User-Agent'] = 'Mozilla/5.0 (X11; Linux x86_64) \
                    AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36'

        if post:
            if data:
                data = urlencode(data).encode('utf-8')
        else:
            if data:
                query_string = urlencode(data)
                url = url + '?' + query_string
                data = None

        req = Request(url, data, header)

        try:
            r = urlopen(req, timeout=5)
        except (URLError, HTTPError, socket.timeout):
            sys.stderr.write(
                "Engine %s timed out, please check your network\n" % self._name)
            return None

        if is_py3:
            charset = r.headers.get_param('charset') or 'utf-8'
        else:
            charset = r.headers.getparam('charset') or 'utf-8'

        r = r.read().decode(charset)
        return r

    def http_get(self, url, data=None, header=None):
        return self.request(url, data, False, header)

    def http_post(self, url, data=None, header=None):
        return self.request(url, data, True, header)

    def set_proxy(self, proxy_url=None):
        try:
            import socks
        except ImportError:
            sys.stderr.write("pySocks module should be installed")
            return None

        proxy_types = {
            'http': socks.PROXY_TYPE_HTTP,
            'socks': socks.PROXY_TYPE_SOCKS4,
            'socks4': socks.PROXY_TYPE_SOCKS4,
            'socks5': socks.PROXY_TYPE_SOCKS5
        }

        url_component = urlparse(proxy_url)

        proxy_args = {
            'proxy_type': proxy_types[url_component.scheme],
            'addr': url_component.hostname,
            'port': url_component.port,
            'username': url_component.username,
            'password': url_component.password
        }

        socks.set_default_proxy(**proxy_args)
        socket.socket = socks.socksocket

    def test_request(self, test_url):
        print("test url: %s" % test_url)
        print(self.request(test_url))

    def translate(self, sl, tl, text):
        self._trans['paraphrase'] = None    # 简单翻译
        self._trans['phonetic'] = None      # 读音
        self._trans['explain'] = None       # 详细翻译
        return self._trans


t = CibaTranslator()
r = t.translate('', '', 'good')
print(r)
