#!/bin/bash
# 输出重定向到文件
for (( a = 10; a > 0; a-- ))
do
    echo "The number is $a"
done > log

# 使用管道符将循环的输出作为grep的输入
for (( a = 10; a > 0; a-- ))
do
    echo "The number is $a"
done | grep 10