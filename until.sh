#!/bin/bash
# using the until command
var1=100
until [ $var1 -eq 0 ]  # 和for循环相反，条件不满足时do，条件满足时exit
do
    echo $var1
    var1=$[ $var1 - 25 ]
done

exit 0