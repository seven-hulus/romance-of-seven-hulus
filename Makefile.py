#! /usr/bin/env python
# -*-- coding: utf-8 -*-

import  os
import  re

os.system('pdflatex ./seven-hulus-main.tex')
os.system('pdflatex ./seven-hulus-main.tex')
os.system('pdflatex ./seven-hulus-main.tex')

fin     =   open("seven-hulus-main.toc")
fou     =   file("README.md", "w+")

fou.write("# 七葫拍案惊奇\n\n")

line    =   fin.readline()
while   line:
    line    =   line.replace("\\contentsline {chapter}{", "", 1)
    if  (line.find("\\numberline {") >= 0):
        if  (line.find("appendix") >= 0):
            line    =   line.replace("\\numberline {", "附录 ", 1)
            line    =   line.replace("}", "  ", 1)
        else:
            line    =   line.replace("\\numberline {", "第 ", 1)
            line    =   line.replace("}", " 回  ", 1)
    indx    =   line.index("}") 
    line    =   line[0 : indx]
    line    =   "- " + line + "\n"
    fou.write(line)
    line    =   fin.readline()

fin.close()
fou.close()

os.system('rm *.aux')
os.system('rm */*.aux')
os.system('rm *.log')
os.system('rm *.out')
os.system('rm *.toc')
