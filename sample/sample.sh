#!/bin/bash
# read file and create INSERT statements for MySQL
outfile='members.sql'
IFS=','  # 输入参数是以逗号作为分隔的列表
while read lname fname address city state zip
do
    # >> 是追加输出重定向，将cat命令的输出追加到$outfile
    # << 表示的是输入重定向，此时cat不是从STDIN获取输入，而是将EFO包含的内容作为输入
    cat >> $outfile << EOF
        INSERT INTO members (lname,fname,address,city,state,zip) VALUES
        ('$lname', '$fname', '$address', '$city', '$state', '$zip');
EOF
done < ${1}  # 输入是命令行的第一个参数