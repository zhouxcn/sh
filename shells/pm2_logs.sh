#!/bin/bash

# 根据第一个参数获取服务名称
# 根据第二个参数获取文件类型
service_name=''
file_type=''
function parse_service_name() {
    case $1 in
        app) service_name='AppServer'
        ;;
        pb) service_name='PartyBuilding'
        ;;
        cyys) service_name='ChunyuYisheng'
        ;;
        fs) service_name='FileServer'
        ;;
        *) service_name='Error'
    esac
}

function parse_file_type() {
    case $1 in
        o) file_type='out'
        ;;
        e) file_type='error'
        ;;
        *) file_type='Error'
    esac
}

# 参数个数必须为2
if [ $# == 2 ]
then
    parse_service_name $1

    if [ $service_name == 'Error' ]
    then
        echo 'Error: 服务名称参数有误...'
    else
        parse_file_type $2

        if [ $file_type == 'Error' ]
        then
            echo 'Error: 文件类型参数有误...'
        else
            file="/home/zhou/.pm2/logs/${service_name}-${file_type}.log"
            echo "log文件地址:${file}"
            tail -f $file
        fi
    fi
else
    echo 'Error: 应有两个参数...'
fi