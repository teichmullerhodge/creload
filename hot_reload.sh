
# TODO capture the args[2] for linkers usage, example -lcurl

COMMAND="gcc $1 -o $2"
EXEC_COMMAND="./$2"

function check_file_existence() {

    if [ ! -e "$1" ]; then
        echo "File $1 does not exist"
        exit 2
    fi 
}


function reload(){

    last_date="$(date -r $1)"
    while true; do 
        current_date="$(date -r $1)"
        if [ "$current_date" != "$last_date" ] ; then
            $COMMAND
            echo $COMMAND
            last_date=$current_date
            if [ $? -eq 0 ]; then
                $EXEC_COMMAND
            fi
        fi
    done 


}

function main(){

    if [ ! "$1" ]; then    

        echo "Usage: hot_reload <source-file> <output-file>"
        exit 1

    fi

    check_file_existence $2
    echo "Hot reload is running...Checking for file changes in $1"
    reload $2
}

args=("$@")
if [ "${args[2]}" ]; then
    COMMAND="gcc $1 -o $2 -l$3"
fi

main $args ${args[0]} ${args[1]} 

