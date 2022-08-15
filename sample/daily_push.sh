#!/bin/bash
# 此脚本用于将md-file仓库进行更新提交
# 并推送到github进行数据备份

function push {
    cd $resp_path
    git add . && git commit -m "update: $date"
    git push origin master 
}

resp_path="/mnt/d/OneDrive - 华南师范大学/md-files"
push  # 调用函数进行将本地仓库提交并推送到远程