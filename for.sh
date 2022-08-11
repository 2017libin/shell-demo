#!/bin/bash
# --------------------------------------------------------------
# sample1: 介绍了如何使用for和修改分隔符IFS
# --------------------------------------------------------------

file="states"
IFS_OLD=$IFS

# 以换行符为分隔符
echo "以\\n为分隔符"
IFS=$'\n'
for state in $(cat $file)
do
echo "Visit beautiful $state"
done

# 以空白字符为分隔符
echo "以空白字符为分隔符"
IFS=$IFS_OLD
for state in $(cat $file)
do
echo "Visit beautiful $state"
done

# 将换行符、冒号、分号和双引号作为字段分隔符
# IFS=$'\n':;"

# --------------------------------------------------------------
# sample2: 如何通过通配符遍历文件
# --------------------------------------------------------------
# iterate through all the files in a directory
# for file in *  # 使用相对路径
for file in /home/chase/shell_test/*  /home/chase/* # 使用绝对路径，遍历多个目录
do
    if [ -d "$file" ]  # 文件名中可能有空格，因此需要用双引号括起来
    then
        echo "$file is a directory"
    elif [ -f "$file" ]
    then
    echo "$file is a file"
    fi
done

# --------------------------------------------------------------
# sample3: c语言风格的迭代方式
# --------------------------------------------------------------
# testing the C-style for loop
# 变量赋值可以有空格
# 条件中的变量不以美元符开头
# 迭代过程的算式未用 expr 命令格式
for (( i = 1; i <= 3; i++ ))
do
    echo "The next number is $i"
done