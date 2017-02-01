#!/bin/bash
mysep="======================================================================================"
mysmallsep="--------------------------------------------------------------------------------------"
if [ -n "$1" ];then
    mypath="$1"
else
    mypath="$(pwd)"
fi
declare -a my_path_array
get_duration(){
    /usr/bin/avprobe "$1" 2>&1 | grep Duration | awk -F[:,] '{print int($2*3600+$3*60+$4)}'
}
print_duration(){
    awk -v var="$1" 'BEGIN {print int(var/3600)"Hr "int((var%3600)/60)"Min "int(var%60)"Sec "}'
}
execute_it_now(){
    echo -e "Video File\t\tVideo Duration"
    echo $mysep
    echo "$1"
    echo $mysmallsep
    j=0
    for i in "$1"/{*.mp4,*.mkv,*.avi,*.flv} ## Put the existing video file extension you have
    do
        if [[ "$(get_duration "$i")" -ne "0" ]];then
            echo -e "$(basename "$i")\t$(tput setaf 2)$(print_duration $(get_duration "$i"))$(tput sgr0)"
        fi
        let j=j+$(get_duration "$i") 2>/dev/null
    done
    echo $mysep
    echo "Total Duration $(tput setaf 1)$(print_duration $j)$(tput sgr0)"
}
execute_these_now(){
    for i in "$1"/{*.mp4,*.mkv,*.avi,*.flv} ## Put the existing video file extension you have
    do
        if [[ "$(get_duration "$i")" -ne "0" ]];then
            echo -e "$(basename "$i")\t$(tput setaf 2)$(print_duration $(get_duration "$i"))$(tput sgr0)"
        fi
    done
}
add_these_now(){
    j=0;
    for i in "$1"/{*.mp4,*.mkv,*.avi,*.flv} ## Put the existing video file extension you have
    do
        let j=j+$(get_duration "$i") 2>/dev/null
    done
    echo $j
}
case "$2" in
        -R|-r|-recursive|--recursive) 
        tmp=$(find $mypath -type d | xargs)
        my_path_array=( $tmp )
        echo -e "Video File\t\tVideo Duration"
        echo $mysep
        k=0;
        for indx in $(seq ${#my_path_array[@]})
    do
            echo ${my_path_array[$(($indx-1))]}
            echo $mysmallsep
            execute_these_now ${my_path_array[$(($indx-1))]}
            let k=k+$(add_these_now ${my_path_array[$(($indx-1))]})
    done
        echo $mysep
        echo "Total Duration $(tput setaf 1)$(print_duration $k)$(tput sgr0)"
           ;;
        *) 
            execute_it_now $mypath
           ;;
esac