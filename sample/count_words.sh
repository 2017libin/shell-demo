#!/bin/bash
# 执行命令：bash count_words.sh text
# 对word里面的单词计数，其中单词是以空格隔开
# *注意*：文本文件必须以空白行结尾，不知道为什么用重定向输入的方法获取不到最后一行
count=0
while read line
do
    for word in $line
    do
        echo "word-$count: $word"
        count=$[ $count + 1 ]
    done
done < ${1}  # 使用第一个参数指定的文件内容作为输入
echo "totle number of words is $count"
