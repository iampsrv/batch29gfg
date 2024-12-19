#! /bin/bash
echo "+-----------------------------+"
echo "| File Management System      |"
echo "+-----------------------------+"


while true; do

    echo "+-----------------------------+"
    echo "| Menu Option                 |"
    echo "+-----------------------------+"
    echo "| 1. Create a new file        |"
    echo "| 2. Delete a file            |"
    echo "| 3. List all files           |"
    echo "| 4. Exit                     |"
    echo "+-----------------------------+"

    read -p "Enter your choice: " choice
    case $choice in
    1)
        echo "Creating a new file: "
        read -p "Enter the name of the file: " filename
        touch $filename
        echo "File created successfully."
        ;;
    2)
        echo "Deleting a file: "
        read -p "Enter the name of the file: " filename
        if [ -f $filename ]; then
        rm $filename
        echo "File deleted successfully."
        else
        echo "File not found."
        fi
        ;;
    3)
        echo "Listing all files in the current directory:"
        echo "--------------------------------------------"
        find . -maxdepth 1 -type f
        echo "+---------------------+"
        echo "| Total files: $(find . -maxdepth 1 -type f | wc -l)"
        echo "+---------------------+"
        ;;
    4)
        echo "Exiting..."
        exit 0
        ;;
    *) echo "Invalid choice. Please try again."
    esac
done