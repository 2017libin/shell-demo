#!/bin/bash
# --------------------------------------------------------------
# sample1: 介绍了如何使用位置参数
# --------------------------------------------------------------
echo "--sample1: 介绍了如何使用位置参数"
factorial=1
if [ -n "$1" ]  # 判断第一个参数是否存在
then
    for (( number = 1; number <= $1 ; number++ ))  # $1表示第一个参数
    do
        factorial=$[ $factorial * $number ]
    done
    echo The factorial of $1 is $factorial
else
    echo "please input a number!"
    exit 1
fi

# 测试不同参数使用空白字符隔开 bash input.sh 5   abc
echo "第一个参数为 $1"
echo "第二个参数为 $2"

# --------------------------------------------------------------
# sample2: 获取脚本名
# --------------------------------------------------------------
echo
echo "--sample2: 获取脚本名"

name=$(basename $0)  # bashname只返回脚本名字而不返回路径
echo  # 相当于输出换行
echo The script name is: $name

# --------------------------------------------------------------
# sample3: 获取最后一个参数
# --------------------------------------------------------------
echo
echo "--sample3: 获取最后一个参数"
params=$#
echo
echo "The parameter number is $params"
echo "The last parameter is ${!#}"  # ${!#} 获取最后一个参数
echo

# --------------------------------------------------------------
# sample4: 获取所有参数
# --------------------------------------------------------------
# testing $* and $@
#
echo
echo "--sample4: 获取所有参数"
count=1
#
for param in "$*"  # 把所有参数合成一个整体
do
    echo "\$* Parameter #$count = $param"
    count=$[ $count + 1 ]
done


# --------------------------------------------------------------
# sample5: 处理选项和参数
# --------------------------------------------------------------
# testing $* and $@
#
echo
echo "sample5: 处理选项和参数"
count=1
#
for param in "$@"  # 把所有参数合成一个列表
do
    echo "\$@ Parameter #$count = $param"
    count=$[ $count + 1 ]
done

# --------------------------------------------------------------
# sample6: 处理合并选项
# --------------------------------------------------------------
echo
echo "sample6: 处理合并选项"

# 用set --命令替换命令行参数：set -- "替换后的命令行参数"
set -- $(getopt -q ab:cd "$@")
#
echo
while [ -n "$1" ]
do
    case "$1" in
    -a) echo "Found the -a option" ;;
    -b) param="$2"  # 参数b需要指定相应的值
        echo "Found the -b option, with parameter value $param"
        shift ;;
    -c) echo "Found the -c option" ;;
    --) shift
        break ;;
    *) echo "$1 is not an option";;
    esac
    shift
done
#
count=1
for param in "$@"
do
    echo "Parameter #$count: $param"
    count=$[ $count + 1 ]
done
#

# --------------------------------------------------------------
# sample7: 从键盘输入
# --------------------------------------------------------------
#
if read -t 5 -p "Please enter your name: " name  # -t指定输入超时时间，-p输入提示信息
then
    echo "Hello $name, welcome to my script"
else
    echo
    echo "Sorry, too slow! "
fi

# --------------------------------------------------------------
# sample7: 从文本输入
# --------------------------------------------------------------
# 依次读取log文件的每一行
echo
echo "sample7: 从文本输入"
cat log | while read line; do
    echo $line
done

# --------------------------------------------------------------
# sample8: 使用重定向来指定文本输入
# --------------------------------------------------------------
# 依次读取log文件的每一行
echo
echo "sample8: 使用重定向来指定文本输入"
exec 0< log
count=1
while read line
do
    echo "Line #$count: $line"
    count=$[ $count + 1 ]
done