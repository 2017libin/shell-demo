#!/bin/bash
# --------------------------------------------------------------
# sample1: 创建自己的文件描述符
# --------------------------------------------------------------
echo
echo "sample1: 创建自己的文件描述符"
exec 3>>log  # 定义文件描述符3：添加内容到log文件末尾
exec 4>log_out  # 定义文件描述符3：添加内容到log_out文件，清空原有文件内容
echo "This should display on the monitor"
echo "and this should be stored in the file" >&3
echo "Then this should be back on the monitor" >&4

# --------------------------------------------------------------
# sample2: 存储并恢复文件描述符
# --------------------------------------------------------------
echo 
echo "sample2: 存储并恢复文件描述符"
exec 3>&1  # 存储文件描述符1到3中
exec 1>test14out
echo "This should store in the output file"
echo "along with this line."
exec 1>&3  # 从3来恢复文件描述符1
echo "Now things should be back to normal"

# --------------------------------------------------------------
# sample3: 创建读写文件描述符
# --------------------------------------------------------------
echo 
echo "sample3: 创建读写文件描述符"
exec 3<> testfile
read line <&3
echo "Read: $line"
echo "This is a test line" >&3

# --------------------------------------------------------------
# sample4: 创建临时文件
# --------------------------------------------------------------
echo 
echo "sample4: 创建临时文件"
tempfile=$(mktemp test19.XXXXXX)  # 后面的XXXXXX会被替换成其他字符，保证文件名的唯一性
exec 3>$tempfile
echo "This script writes to temp file $tempfile"
echo "This is the first line" >&3
echo "This is the second line." >&3
echo "This is the last line." >&3
exec 3>&-
echo "Done creating temp file. The contents are:"
cat $tempfile  
rm -f $tempfile 2> /dev/null  # 删除临时文件

# --------------------------------------------------------------
# sample5: 记录输出信息
# --------------------------------------------------------------
echo 
echo "sample5: 记录输出信息"
tempfile=log
echo "This is the start of the test" | tee $tempfile  # 利用tee重定向内容到文件和STDOUT
echo "This is the second line of the test" | tee -a $tempfile  # -a表示追加内容
echo "This is the end of the test" | tee -a $tempfile