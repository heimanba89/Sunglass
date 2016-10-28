# -*- coding: utf-8 -*-
import re
import sys

# suppose all capitalized alphabet
def generateCompactEn(enStr):
    split_en = enStr.split("**")
    enn = ''.join(split_en)
    star=u"**"
    enn = [star,enn,star]
    enn = ''.join(enn)
    return enn


# make sure all english words have same spelling pinyin formart
def replace(py):
    regRule = u'([a-zA-Z0-9*]+)'
    p = re.compile(regRule)
    enList = p.findall(py)
    for en in enList:
        if(len(en)>6):
            enn = generateCompactEn(en)
            #print en,enn
            py = py.replace(en,enn)
    return py

#print replace(new_uu)

input_file = sys.argv[1]
output_file = sys.argv[2]

f_cn = open(input_file,'r')
seg_text = open(output_file,'w')

for line in f_cn:
    line = unicode(line.strip(), 'utf-8')
    line = list(line)
  #  print line
    new_line='**'.join(line)
  #  print new_line
    seg_text.write((replace(new_line)+u'\n').encode('utf-8'))


f_cn.close()
seg_text.close()
