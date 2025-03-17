encrypt(){
    current_path=$(pwd)
    value=$1
    key=$2
    path_file=$3
    filename=$4
    encryptPass=$5
    encrypted=$(echo "$value" | openssl enc -aes-256-cbc -md sha512 -a -pbkdf2 -iter 100000 -salt -pass pass:"$encryptPass")
    encrypted=$(echo $encrypted | tr -d '[:space:]')
    cd $path_file
    echo "$key:$encrypted" >> $filename
    cd $current_path
}

decrypt(){
    value=$1
    encryptPass=$2
    decrypt=$(echo "$value" | openssl enc -aes-256-cbc -md sha512 -a -pbkdf2 -iter 100000 -salt -pass pass:"$encryptPass" -d)
    echo $decrypt
}

filter_files_by_env(){
    current_path=$(pwd)
    basepath=$1
    filter=$2
    env=$3
    file_ini=$4
    file_final=$5
    cd $basepath
    if [ -f $file_ini ]; then
        mv $file_ini $file_final
    fi
    ls -l
    cd $current_path
}

filter_files_by_env_(){
    current_path=$(pwd)
    basepath=$1
    filter=$2
    env=$3
    file_ini=$4
    file_final=$5
    cd $basepath
    rm $(ls |grep -P "$filter(?!$env)")    
    mv $file_ini $file_final
    ls -l
    cd $current_path
}

generate_keystore(){
    current_path=$(pwd)
    pathbase=$1
    alias=$2
    filename=$3
    keystore=$4
    password=$5
    cd $pathbase
    if [ -f "$keystore" ]; then
        rm $keystore
    fi
    keytool -import -alias $alias -file $filename -keystore $keystore -storepass $password -noprompt
    cd $current_path
}

tool_clear_xml(){
    RES_XML=$1
    RES_XML=$(echo $RES_XML | tr '\r\n' ' ')
    RES_XML="${RES_XML//\"/\\\"}"
    RES_XML="${RES_XML//\﻿/}"
    RES_XML="${RES_XML//\&/\&amp\;}"
    RES_XML="${RES_XML//\<string\>/\&lt\;string\&gt\;}"
    RES_XML="${RES_XML//\\\r/\\\\\r}"
    RES_XML="${RES_XML//\\\n/\\\\\n}"
    echo $RES_XML
}

msg(){
    msg=$1
    echo -e "##[section] $msg"
}

err_msg() {
    local msg="$1"
    echo "::error::$msg"
    exit 1  # Termina la ejecución con código de error
}

wrn_msg() {
    local msg="$1"
    echo "::warning::$msg"
}

tar_compress(){
    filename=$1
    foldername=$2
    tar -cvzf $filename.tar.gz $foldername
}

tar_uncompress(){
    filename=$1
    foldername=$2
    tar -zxvf $filename.tar.gz $foldername
}

delete_keystore(){
    current_path=$(pwd)
    pathbase=$1
    alias=$2    
    keystore=$3
    password=$4
    cd $pathbase
    if [ -f "$keystore" ]; then
        rm $keystore
    fi
    if [ -f "$keystore" ]; then
        keytool  -delete -alias $alias -keystore $keystore -storepass $password
    fi
    cd $current_path
}
