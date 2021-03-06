import http.client
import hashlib
import urllib
import random
import json
import re
import requests
import pymysql
import sys
from threading import Thread
import socket
import sys
import copy
import json
import time
import random
from urllib.parse import urlencode
from urllib.parse import quote_plus as url_quote
from urllib.parse import urlparse
from urllib.request import urlopen
from urllib.request import Request
from urllib.error import URLError
from urllib.error import HTTPError
import sys

api_id = 2  #  使用了爱词霸的单词和百度的短语,句子
eng = ""
#  sid = 0, 1  sid =0 , 输出翻译和字符串, sid = 1, 只输出 翻译

api = ["baidu", "youdao", "ciba", "youdao1"]  # api_id = 0 是开发者百度, api_id=1 是单个单词的有道(增加cookie之后是有道1, 有道得出的是一个意思,有道1得出的是多个意思,有道翻译得出的结果很差), 2 是爱词霸(爱词霸的翻译结果很好) ,3 是有道1(多个意思),                  那个插件中bing的不能用,google的翻译不是很好

def baidu_api():
    global eng, sid
    appid = '20191213000365697'  # 填写你的appid
    secretKey = '2yQac1v_J8zeXWFGdXQd'  # 填写你的密钥

    httpClient = None
    myurl = '/api/trans/vip/translate'

    fromLang = 'auto'   #原文语种
    toLang = 'zh'   #译文语种
    salt = random.randint(32768, 65536)
    q= eng
    sign = appid + q + str(salt) + secretKey
    sign = hashlib.md5(sign.encode()).hexdigest()
    myurl = myurl + '?appid=' + appid + '&q=' + urllib.parse.quote(q) + '&from=' + fromLang + '&to=' + toLang + '&salt=' + str(
    salt) + '&sign=' + sign

    try:
        httpClient = http.client.HTTPConnection('api.fanyi.baidu.com')
        httpClient.request('GET', myurl)

        # response是HTTPResponse对象
        response = httpClient.getresponse()
        result_all = response.read().decode("utf-8")
        result = json.loads(result_all)

        eng = result["trans_result"][0]["src"]
        translated = result["trans_result"][0]["dst"]
        if sid == 1:
            print(translated)
            return 
        print(eng + "   " + translated)
        return translated
    except Exception as e:
        print (e)
    finally:
        if httpClient:
            httpClient.close()



def translate():
    global api_id, api
    if api[api_id] == "baidu":
        return baidu_api()

    elif api[api_id] == "youdao":
        def youdao():
            try:
                global eng
                #  eng_treated = re.sub(r'\s', '%20', eng)
                request = "http://fanyi.youdao.com/translate?doctype=json&i={}&type=EN2ZH_CN".format(eng)
                response = requests.get(request)
                translated = response.json()["translateResult"][0][0]["tgt"]
                if sid == 1:
                    print(translated)
                    return 
                print(eng + "   " + translated)
                return translated
            except Exception as e:
                print (e)
        return youdao()
    elif api[api_id] == "ciba":
        global eng
        t = CibaTranslator()
        r = t.translate('', '', eng)
        if r['explain']:
            translated = ''.join(r['explain'])
        elif r['paraphrase']:
        #    translated = ''.join(r['paraphrase'])
            return baidu_api()

        if sid == 1:
            print(translated)
            return 
        print(eng + " : " + translated)
        return translated
    elif api[api_id] == "youdao1":
    #   global eng
        t = YoudaoTranslator()
        r = t.translate('auto', 'zh', eng)

        if r["explain"]:
            translated = ''.join(r['explain'])
        elif r['paraphrase']:
        #translated = ''.join(r['paraphrase'])
            return baidu_api()

        if sid == 1:
            print(translated)
            return 
        print(eng + ' : '+translated)
        return translated





def insert_data(translated):
    global eng
    conn = pymysql.connect(host='127.0.0.1', user='mydb', passwd="1234", db='eng')
    cur = conn.cursor()
    cur.execute("SELECT word,translation FROM enwords where word=%s",(eng,))
    result = cur.fetchone()   # 得到的单词及含义
    if result != None:   # 字典中存在单词
        return
    else:    # 字典中不存在单词
        if translated != None:
            cur.execute('INSERT INTO `enwords` (`word`, `translation`) VALUES (%s, %s)', (eng, translated))
            conn.commit()
            cur.close()
            conn.close()
            return
        else:
            return

def async_call(fn):
    def wrapper(*args, **kwargs):
        Thread(target=fn, args=args, kwargs=kwargs).start()
    return wrapper

    # 如果使用nvim把下面的注释掉
    #@async_call
def translateAndIn():
    translated = translate()
    return translated
    ## insert_data(translated)





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

        charset = r.headers.get_param('charset') or 'utf-8'

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


class YoudaoTranslator (BasicTranslator):

    def __init__(self, name='youdao'):
        super(YoudaoTranslator, self).__init__(name)
        self.url = 'https://fanyi.youdao.com/translate_o?smartresult=dict&smartresult=rule'
        self.D = "97_3(jkMYg@T[KZQmqjTK"

    def get_md5(self, value):
        import hashlib
        m = hashlib.md5()
        m.update(value.encode('utf-8'))
        return m.hexdigest()

    def sign(self, text, salt):
        s = "fanyideskweb" + text + salt + self.D
        return self.get_md5(s)

    def translate(self, sl, tl, text):
        self.text = text
        salt = str(int(time.time() * 1000) + random.randint(0, 10))
        sign = self.sign(text, salt)
        header = {
            'Cookie': 'OUTFOX_SEARCH_USER_ID=-2022895048@10.168.8.76;',
            'Referer': 'http://fanyi.youdao.com/',
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.2; rv:51.0) Gecko/20100101 Firefox/51.0',
        }
        data = {
            'i': text,
            'from': sl,
            'to': tl,
            'smartresult': 'dict',
            'client': 'fanyideskweb',
            'salt': salt,
            'sign': sign,
            'doctype': 'json',
            'version': '2.1',
            'keyfrom': 'fanyi.web',
            'action': 'FY_BY_CL1CKBUTTON',
            'typoResult': 'true'
        }
        r = self.http_post(self.url, data, header)
        if not r:
            return
        obj = json.loads(r)
        self._trans['paraphrase'] = self.get_paraphrase(obj)
        self._trans['explain'] = self.get_explain(obj)
        return self._trans

    def get_paraphrase(self, obj):
        translation = ''
        t = obj.get('translateResult')
        if t:
            for n in t:
                part = []
                for m in n:
                    x = m.get('tgt')
                    if x:
                        part.append(x)
                if part:
                    translation += ', '.join(part)
        return translation

    def get_explain(self, obj):
        explain = []
        if 'smartResult' in obj:
            smarts = obj['smartResult']['entries']
            for entry in smarts:
                if entry:
                    entry = entry.replace('\r', '')
                    entry = entry.replace('\n', '')
                    explain.append(entry)
        return explain


eng = sys.argv[1]
sid = int(sys.argv[2])


translateAndIn()

