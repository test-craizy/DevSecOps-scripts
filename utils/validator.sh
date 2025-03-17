empty_validator(){
    params=$1
    message=$2
    jq -cr '.[]' <<< ''$params'' | while IFS= read -r item; do 
        key=$( jq -r '.key' <<< "$item" )
        value=$( jq -r '.value' <<< "$item" )
        if [[ "$value" = "" || "$value" = "null" || "$value" = *"$key"* ]]; then
            message="${message/\%/$key}"
            err_msg ''"$message"''
        fi
    done
}

one_empty_validator(){
    key=$1
    value=$2
    message=$3
    if [[ "$value" = "" || "$value" = "null" || "$value" = *"$key"* ]]; then
        message="${message/\%/$key}"
        err_msg ''"$message"''
    fi
}

is_empty_validator(){
    value=$1
    response=false
    if [[ "$value" = "" || "$value" = "null" || "$value" = *'$('* ]]; then
        response=true
    fi
    echo $response
}