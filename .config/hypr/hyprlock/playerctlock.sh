#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Cách sử dụng: $0 --title | --arturl | --artist | --length | --album | --source"
    exit 1
fi

# Hàm lấy metadata sử dụng playerctl
get_metadata() {
    key=$1
    playerctl metadata --format "{{ $key }}" 2>/dev/null
}

# Hàm xác định nguồn và trả về icon và thông tin
get_source_info() {
    trackid=$(get_metadata "mpris:trackid")
    if [[ "$trackid" == *"firefox"* ]]; then
        echo -e "Firefox 󰈹"
    elif [[ "$trackid" == *"spotify"* ]]; then
        echo -e "Spotify "
    elif [[ "$trackid" == *"chromium"* ]]; then
        echo -e "Chrome "
    else
        echo ""
    fi
}

song_info=$(playerctl metadata --format '{{title}}')
# Xử lý các tham số đầu vào
case "$1" in
--title)
    title=$(get_metadata "xesam:title")
    if [ -z "$title" ]; then
        echo "$song_info"
    else
        echo "${title:0:28}" # Giới hạn output là 28 ký tự
    fi
    ;;
--arturl)
    url=$(get_metadata "mpris:artUrl")
    if [ -z "$url" ]; then
      url=$("/home/Haoireal/Pictures/wallpapers/tokyogirl.png")
    else
        if [[ "$url" == file://* ]]; then
            url=${url#file://}

        fi
        echo "/home/Haoireal/Pictures/wallpapers/tokyogirl.png"
    fi
    ;;
--artist)
    artist=$(get_metadata "xesam:artist")
    if [ -z "$artist" ]; then
        echo "No artist info!"
    else
        echo "${artist:0:30}" # Giới hạn output là 30 ký tự
    fi
    ;;
--length)
    length=$(get_metadata "mpris:length")
    if [ -z "$length" ]; then
        echo "No timer infor!"
    else
        # Chuyển độ dài từ microseconds sang phút
        length_in_minutes=$(echo "scale=2; $length / 1000000 / 60" | bc)
        echo "$length_in_minutes phút"
    fi
    ;;
--status)
    status=$(playerctl status 2>/dev/null)
    if [[ $status == "Playing" ]]; then
        echo "󰎆"
    elif [[ $status == "Paused" ]]; then
        echo "󱑽"
    else
        echo "No status!"
    fi
    ;;
--album)
    album=$(get_metadata "xesam:album")
    if [ -z "$album" ]; then
        echo "No album infor!"
    else
        echo "$album"
    fi
    ;;
--source)
    get_source_info
    ;;
*)
    echo "Tùy chọn không hợp lệ: $1"
    echo "Cách sử dụng: $0 --title | --url | --artist | --length | --album | --source"
    exit 1
    ;;
esac

