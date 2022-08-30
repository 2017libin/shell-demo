#!/bin/bash
# 此脚本用于将md-file仓库进行更新提交
# 并推送到github进行数据备份
debug="nodebug"
function push {
    date=$(date "+%Y-%m-%d")
    if [ $debug=="nodebug" ]
        then
            log="/home/chase/log/daiy_push_$date"
            cd "$resp_path" &>/dev/null &&\
            git add . &>/dev/null &&\
            git commit -m "update: $date" &>/dev/null &&\
            open-proxy &>/dev/null
            git push origin master &>/dev/null
        else
            echo $date
            log="/home/chase/log/daiy_push_$date"
            touch $log
            cd "$resp_path"
            echo $?
            git add .
            echo $?
            git commit -m "update: $date"
            echo $?
            open-proxy 
            git push origin master
    fi

}

resp_path="/mnt/d/OneDrive - 华南师范大学/md-files"  # 仓库的绝对路径
push  # 调用函数进行将本地仓库提交并推送到远程