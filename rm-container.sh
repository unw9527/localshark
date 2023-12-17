#!/bin/bash

read -p "Enter the container name to remove: " container_name

# Check if the container exists
if docker ps -a --format '{{.Names}}' | grep -q "$container_name"; then
    # Stop and remove the specified container
    docker stop "$container_name" && docker rm "$container_name"
    echo "Container '$container_name' removed successfully."
else
    echo "Container '$container_name' not found."
fi
