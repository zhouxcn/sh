#!/bin/bash
# 自动获取Bing每日图片,下载到本地,设置为壁纸

# 获取当前日期,用做下载壁纸的文件名
time=$(date "+%Y-%m-%d")

echo ${time}
echo "开始获取图片地址..."

# 获取壁纸Api返回json数据
url="https://cn.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1"
result=`curl ${url} -s`

# 解析json数据
parse_json(){ 
    value=`echo $1 | sed 's/.*"url":\([^,}]*\).*/\1/'`
    echo $value | sed 's/\"//g'
}

# 获取图片地址
value=$(parse_json $result "images")

echo "今日图片地址: ${value}"

# 下载文件
echo "开始下载文件..."

curl -o /home/zhou/Pictures/${time}.jpg https://www.bing.com/${value}

echo "下载文件成功!!!"

# 设置壁纸
downloadPath=/home/zhou/Pictures/${time}.jpg
gsettings set org.gnome.desktop.background picture-uri "file:${downloadPath}"

echo "设置壁纸成功!!!"