#!/bin/bash
#this will kick off the script by checking the cellular version
check_version() {
version_output=$(echo 'AT!IMAGE?' | socat - /dev/ttyUSB2,crnl | awk '/01.14.02.00_ATT/ {print $NF}')
specific_version="01.14.22.00_ATT"

if [ "$version_output" == "$specific_version" ]; then
    echo "The desired output matches the specific version number."
else
    echo "The desired output does not match the specific version number."
    check_directory
fi
}

check_directory() {
directory_path="/mnt/nvram/cellfw"

if [ -d "$directory_path" ]; then
    echo "The directory already exists."
    if [ -z "$(ls -A $directory_path)" ]; then
            echo "The folder is empty. Running download_firmware function."
            download_firmware
        else
            echo "The folder is not empty. Running install_firmware function."
            install_firmware
        fi
else
    mkdir -p "$directory_path"
    echo "Directory created successfully."
    download_firmware
fi
}
download_firmware() {
src_IP="54.208.34.191"
user="root"
pass="~GoGear1!"
path="/mnt/nvram/cellfw/"
echo "running firmware download"
}

install_firmware() {
echo "running firmware install"
}
#call check_version
check_version
