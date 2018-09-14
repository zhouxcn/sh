#!/bin/bash
# 自动获取Bing每日图片,下载到本地,设置为壁纸

# 获取当前日期,用做下载壁纸的文件名
time=$(date "+%Y-%m-%d")

echo "今天,又是元气满满的一天,做点什么呢?"
echo "好看的壁纸才会有好的心情!先获取一张美美的壁纸!"
echo ""

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

# 下载文件
curl -o /home/zhou/Pictures/${time}.jpg https://www.bing.com/${value}
# 设置壁纸
downloadPath=/home/zhou/Pictures/${time}.jpg
gsettings set org.gnome.desktop.background picture-uri "file:${downloadPath}"

echo ""
echo "有了美美的壁纸,接下来开始发呆吧..."
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "呆"
echo "."
echo "."
echo "."