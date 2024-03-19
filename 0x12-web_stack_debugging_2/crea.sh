#!/bin/bash

# Get username from user input (improve security for real use)
read -p "Enter username for new user: " username

# Check if username is empty
if [[ -z "$username" ]]; then
  echo "Error: Username cannot be empty."
  exit 1
fi

# Check if user already exists
if id "$username" >/dev/null 2>&1; then
  echo "Error: User '$username' already exists."
  exit 1
fi

# Create the new user (use adduser for a more user-friendly experience)
sudo adduser --quiet "$username" 2>/dev/null

# Check for errors during user creation
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to create user '$username'."
  exit 1
fi

# Set a random password (improve security for real use)
password=$(openssl rand -base64 12 | tr -dc 'a-zA-Z0-9')
echo "$password" | sudo passwd --stdin "$username" >/dev/null 2>&1

# Print the randomly generated password (improve security for real use)
echo "New user '$username' created with password: $password"

# Log in to the new user (consider sudo for root access if needed)
su - "$username"

