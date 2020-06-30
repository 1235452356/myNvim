texMathZones = ['texMathZone'+x for x in ['A', 'AS', 'B', 'BS', 'C', 'CS', 'D', 'DS', 'E', 'ES', 'F', 'FS', 'G', 'GS', 'H', 'HS', 'I', 'IS', 'J', 'JS', 'K', 'KS', 'L', 'LS', 'DS', 'V', 'W', 'X', 'Y', 'Z']]
# 列表生成式
texIgnoreMathZones = ['texMathText']
#一个列表
texMathZoneIds = vim.eval('map('+str(texMathZones)+", 'hlID(v:val)')")  # 输出的是30个0的列表, hlID 有问题, hlID 里没有 上面的30个字段
# str(列表生成式是一个列表)
# hlID  The result is a Number, which is the ID of the highlight group  with name {name}.
# v:val      Value of the current item of a List or Dictionary
texIgnoreMathZoneIds = vim.eval('map('+str(texIgnoreMathZones)+", 'hlID(v:val)')") # 输出的是 一个0 的列表
ignore = texIgnoreMathZoneIds[0]   #0
# math 函数
def math():
#line 行 col 列   后面的 判断列数是否大于等于2,是返回1,否0
# synstack
# Return a List, which is the stack of syntax items at the position {lnum} and {col} in the current window.
# 行是当前行, 列>= 2 列数-1 , 列数为1 的时候 列数 不减
    synstackids = vim.eval("synstack(line('.'), col('.') - (col('.')>=2 ? 1 : 0))")
    try:
# reversed 逆序生成
        first = next(i for i in reversed(synstackids) if i in texIgnoreMathZoneIds or i in texMathZoneIds)
        return first != ignore
    except StopIteration:
        return False
