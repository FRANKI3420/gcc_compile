#!/usr/bin/env fish

input="input.txt"
answer="output.txt"
result="result.txt"


# 拡張子が .c のファイルを検索
for file in *.c
do
echo $file

    # echo $desired_string

    filepath_after_compile=$(echo "$file" | sed 's/\.c$//')
    echo $filepath_after_compile
        
    # compile_command=$(echo gcc -Wall "$file" list1test.c -lm)
    # compile_command=$(echo gcc -Wall "$file" list2test.c -lm)
    compile_command=$(echo gcc "$file" myrand.c list.c-3/$file -lm)
    eval $compile_command;
    echo "\nresult of executing $filepath_after_compile"

    compile_command=$(echo "./a.out")

    echo "run $compile_command"

    if eval $compile_command; then
            #コンパル成功時の処理
            echo "\n compilation success"
    else
            #コンパイル失敗時の処理
            echo "$compile_command failed" >> $result 
            echo "====================================" >>$result
    fi

    echo "===================================="
done