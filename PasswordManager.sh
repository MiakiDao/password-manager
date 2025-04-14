#!/bin/bash

FILE="passwords.txt"

echo "Welcome To PasswordManager!"

while true; do
	echo "Please enter the options in the following table(Add Password/Get Password/Exit):"
	read -r choice

	case "$choice" in
		"Add Password")
			echo "Please enter a service name:"
			read -r service
			echo "Please enter your username:"
			read -r username
			echo "Please enter your password:"
			read -r password

			echo "${service}:${username}:${password}" >> "$FILE"
			echo "The password was successfully added."
			;;

		"Get Password")
			echo "Please enter a service name:"
			read -r search_service
			found=false

			while IFS=":" read -r service username password; do
				if [ "$service" = "$search_service" ]; then
					echo "Service Name:$service"
					echo "Username:$username"
					echo "Password:$password"
					found=true
					break
				fi
			done < "$FILE"
			
			if [ "$found" = false ]; then
				echo "The service is not registered"
			fi
			;;

		"Exit")
			echo "Thank you!"
			break
			;;

		*)
			echo "Please enter the correct password from Add Password/ Get Password/ Exit."
			;;
	esac
done


