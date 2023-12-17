#!/bin/bash

container_exists() {
    local container_name="$1"
    docker ps -a --format '{{.Names}}' | grep -q "$container_name"
}
directory_exists() {
    local directory="$1"
    [ -d "$directory" ]
}

echo "Welcome to localshark!"
echo "This script helps you create and run a Docker container for CSAPP local development with a specified volume mount."
echo "To quit the interactive interface and remove the container, hit Ctrl+D."
echo -e "\n"

read -p "Enter a container name you want to use: " container_name

# Check if the container name already exists
while container_exists "$container_name"; do
    echo "Error: Container with name '$container_name' already exists."
    read -p "Please enter a different container name: " container_name
done

# Host path mounting
read -p "Enter the absolute path to your CSAPP workspace on your host machine: " host_path

# Check if the specified directory exists
while ! directory_exists "$host_path"; do
    echo "Error: Directory '$host_path' does not exist."
    read -p "Please enter a valid host machine path: " host_path
done

docker run -it --rm -v "$host_path":/root/csapp --name "$container_name" unw9527/localshark:1.0 /bin/bash
