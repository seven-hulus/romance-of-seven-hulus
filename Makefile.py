# -*-- coding: utf-8 -*-

import  os
import  re

os.system('pdflatex main.tex')
os.system('pdflatex main.tex')
os.system('pdflatex main.tex')

fin     =   open("main.toc")
fou     =   file("README.md", "w+")

fou.write("# 七葫拍案惊奇\n\n")

line    =   fin.readline()
while   line:
    line    =   line.replace("\\contentsline {chapter}{", "", 1)
    if  (line.find("\\numberline {") >= 0):
        line    =   line.replace("\\numberline {", "第 ", 1)
        line    =   line.replace("}", " 回  ", 1)
    indx    =   line.index("}") 
    line    =   line[0 : indx]
    line    =   "- " + line + "\n"
    fou.write(line)
    line    =   fin.readline()

fin.close()
fou.close()
