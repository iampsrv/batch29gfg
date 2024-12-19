#! /bin/bash
echo "+-------------------------------------+"
echo "| Manupulate Users and Groups         |"
echo "+-------------------------------------+"

list_users(){
    echo "List of Users:"
    echo "----------------------"
    sudo cat /etc/passwd | awk --F: '{print $1}' 2>>error.log | sort -u
}

add_user(){
    echo "Adding new user..."
    read -p "Enter username: " username
    sudo useradd $username >> access.log 2>> error.log 
    echo "User added successfully."
    read -p "Enter password: " password
    sudo chpasswd $username <<< $password >> access.log 2>> error.log
    echo "Password set successfully."
}

delete_user(){
    echo "Deleting user..."
    read -p "Enter username: " username
    sudo deluser -r $username >> access.log 2>> error.log
    echo "User deleted successfully."
}

list_groups(){
    echo "List of Groups:"
    echo "----------------------"
    sudo awk -F: '{print $1}' /etc/group | sort -u
}

add_group(){
    echo "Adding new group..."
    read -p "Enter group name: " groupname
    sudo addgroup $groupname >> access.log 2>> error.log
    echo "Group added successfully."
}

delete_group(){
    echo "Deleting group..."
    read -p "Enter group name: " groupname
    sudo delgroup $groupname >> access.log 2>> error.log
    echo "Group deleted successfully."
}

add_user_to_group(){
    echo "Adding user to group..."
    read -p "Enter username: " username
    read -p "Enter group name: " groupname
    sudo usermod -aG $groupname $username >> access.log 2>> error.log
    echo "User added to group successfully."
}

delete_user_from_group(){
    echo "Deleting user from group..."
    read -p "Enter username: " username
    read -p "Enter group name: " groupname
    sudo usermod -rG $groupname $username >> access.log 2>> error.log
    echo "User deleted from group successfully."
}

while true; do
    echo "+-----------------------------+"
    echo "| Menu Options:               |"
    echo "+-----------------------------+"
    echo "| 0. List Users               |" 
    echo "| 1. Add User                 |"
    echo "| 2. Delete User              |"
    echo "| 3. Add Group                |"
    echo "| 4. Delete Group             |"
    echo "| 5. Add User to Group        |"
    echo "| 6. Delete User from Group   |"
    echo "| 7. List Groups              |"
    echo "| 8. Exit                     |"
    echo "+-----------------------------+"
    read -p "Enter your choice: " choice
    case $choice in
    0) list_users ;;
    1) add_user ;;
    2) delete_user ;;
    3) add_group ;;
    4) delete_group ;;
    5) add_user_to_group ;;
    6) delete_user_from_group ;;
    7) list_groups ;;
    8) 
        echo "Bye.." 
        exit 0
        ;;
    *) echo "Invalid choice. Please try again." ;;
    esac
done