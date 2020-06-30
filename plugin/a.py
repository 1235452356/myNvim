import requests 
import json

url = "http://fanyi.baidu.com/#en/zh/%s"
headers = {
    "user-agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36"
}
data = "my code"

txt_json = requests.post(url = url, headers = headers, data=data)



