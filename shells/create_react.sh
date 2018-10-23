#!/bin/bash
# 快速创建react项目
# 使用方式 './create_react.sh ${project_name} ${js_or_ts}'
# 默认创建ts版本

if [ $# == 1 ]
then
    create-react-app $1 --scripts-version=react-scripts-ts
elif [ $# == 2 ]
then
    if [ $2 == 'js' ]
    then
        create-react-app $1
    elif [ $2 == 'ts' ]
    then
        create-react-app $1 --scripts-version=react-scripts-ts
    else
        echo '参数错误...'
        echo '第二个参数应为: ts 或者 js'
    fi
else
    echo '最少需要一个参数...'
    echo '使用方式: ./create_react.sh my-app'
fi