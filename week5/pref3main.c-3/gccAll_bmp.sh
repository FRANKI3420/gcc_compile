#!/usr/bin/env fish

input="input.txt"
answer="output.txt"
result="result.txt"

mkdir -p "result"

# 拡張子が .c のファイルを検索
for file in *.c
do
echo $file

    # echo $desired_string

    filepath_after_compile=$(echo "$file" | sed 's/\.c$//')
    echo $filepath_after_compile
    echo $filepath_after_compile".h"
    echo "pref.c-3/"$file

        
        
    compile_command=$(echo gcc -Wall "$file" "pref.c-3/"$file $filepath_after_compile".h"  -lm)
    eval $compile_command;
    echo "\nresult of executing $filepath_after_compile"

    output="result/"$filepath_after_compile"_out.txt"
    # output_bmp="result/"$filepath_after_compile"_out.bmp"

    # echo $output

    compile_command=$(echo "./a.out < $input >$output")

    # eval mv out.bmp $output_bmp
    
    echo "run $compile_command" 

    if eval $compile_command; then
            #コンパル成功時の処理
            echo "\n compilation success"
    else
            #コンパイル失敗時の処理
            echo "$compile_command failed" >> $result 
            echo "====================================" >>$result
    fi

        # 2つのファイルを比較
    if diff -Bw  "$answer" "$output" >>$result ; then
        ok="ok"
        # echo "ファイルの内容は同じです。"
    else
        write=$answer"と"$output"は異なる"
        echo $write >>$result
        echo "====================================" >>$result


    fi
    echo "===================================="
done