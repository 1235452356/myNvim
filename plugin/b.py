import re
import pymysql
import sys
def QueryWorld():
    global eng
    conn = pymysql.connect(host='127.0.0.1', user='mydb', passwd="1234", db='eng')
    cur = conn.cursor()
    cur.execute("SELECT word,translation FROM enwords where word='{}'".format(eng))
    result = cur.fetchone()   # 得到的单词及含义
    if result != None:   # 字典中存在单词
        print(result)      ## 如果字典里存在单词则直接输出单词和含义
        return
    else:      # 字典中不存在单词,则对单词进行处理,处理之后再次查询
        #if len(eng) == 5:

        for i in range(-1,-5,-1):
            eng_end_treated = eng[0:i]           ## 获取处理后的单词
            cur.execute("SELECT word,translation FROM enwords where word='{}'".format(eng_end_treated))  ## 对处理后的单词进行查询
            result1 = cur.fetchone()         # 查询得到的单词及含义
            if result1 != None:
                print("你要找的单词可能是{}".format(result1))
                return 
            elif result1 == None and len(eng_end_treated) != 0 and eng_end_treated[-1] == "i" :
                
                print(len(eng_end_treated))
                eng_end_treated = eng[0:i-1] + "y"          ##  进行i变y处理
                cur.execute("SELECT word,translation FROM enwords where word='{}'".format(eng_end_treated))  ## 对处理后的单词进行查询
                result1 = cur.fetchone()         # 查询得到的单词及含义
                if result1 != None:
                    print("你要找的单词可能是{}".format(result1))
                    return 
                else:
                    pass
            else:                           ## 对后缀处理得不到理想的单词
                pass

        for i in range(1,3,1):
            eng_start_treated = eng[i:]           ## 获取处理后的单词
            cur.execute("SELECT word,translation FROM enwords where word='{}'".format(eng_start_treated))  ## 对处理后的单词进行查询
            result2 = cur.fetchone()         # 查询得到的单词及含义
            if result2 != None:
                print("你要找的单词可能是{}".format(result2))
                return
            else:
                pass

                
    if result2 == None:
        print("{} is not found !!!".format(eng))
        cur.close()
        conn.close()
    else:
        cur.close()
        conn.close()





eng = "so that our "
QueryWorld()
