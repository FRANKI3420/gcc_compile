#!/bin/bash

# カレントディレクトリ内のすべてのZIPファイルに対してループ
for zip_file in *.zip
do
   
    unzip "$zip_file"
    # 展開後のZIPファイルを削除する場合（任意）
    rm "$zip_file"
    
done
