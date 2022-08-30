#!/bin/bash
# --------------------------------------------------------------
# sample1: 将命令行参数和函数参数相结合
# --------------------------------------------------------------
function func1 {
    echo $[ $1 * $2 ]  # 使用echo返回值
}
if [ $# -eq 2 ]
then
    value=$(func1 $1 $2)  # 函数的参数为脚本的第一、第二个参数$1 $2
    echo "The result is $value"
else
    echo "Usage: badtest1 a b"
fi

# --------------------------------------------------------------
# sample2: 使用数组作为参数和返回值
# --------------------------------------------------------------
echo
echo "sample2: 使用数组作为参数和返回值"
function arraydblr {
    local origarray
    local newarray
    local elements
    local i
    origarray=($(echo "$@"))  # 注意外面的括号不能少
    newarray=($(echo "$@"))
    elements=$[ $# - 1 ]
    for (( i = 0; i <= $elements; i++ ))
    {
        newarray[$i]=$[ ${origarray[$i]} * 2 ]
    }
    echo ${newarray[*]}
}
myarray=(1 2 3 4 5)
echo "The original array is: ${myarray[*]}"
arg1=$(echo ${myarray[*]})
result=($(arraydblr $arg1))  # 也可以将$arg1替换为${myarray[*]}
echo "The new array is: ${result[*]}"

# --------------------------------------------------------------
# sample3: 递归函数
# --------------------------------------------------------------
echo
echo "sample3: 递归函数"
function factorial {
    if [ $1 -eq 1 ]
    then
        echo 1
    else
        local temp=$[ $1 - 1 ]
        local result=`factorial $temp`
        echo $[ $result * $1 ]
    fi
}
read -p "Enter value: " value
result=$(factorial $value)
echo "The factorial of $value is: $result"