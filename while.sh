#!/bin/bash
# while command test

var1=10
while [ $var1 -gt 0 ]  # 两边要有空格
do
    echo $var1
    var1=$[ $var1 - 1 ]  # $[]进行算数运算
done