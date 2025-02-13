#!/bin/bash

# Lấy thông tin vị trí
location=$( curl -s https://ifconfig.co/json | jq -r '.city, .region_name, .country')

# Lấy thông tin thành phố, khu vực và quốc gia
city=$(echo "$location" | sed -n '1p')
region=$(echo "$location" | sed -n '2p')
country=$(echo "$location" | sed -n '3p')

# In tất cả thông tin trên cùng một hàng
printf "%s, %s\n" "$region" "$country"
