#!/bin/bash

read -p 'Please enter a username: ' username
read -p 'Now enter a group: ' group




if id -nGz "$username" 2>/dev/null | grep -qzxF "$group"
then
    echo  "Membership valid!"
elif getent passwd "$username"  > /dev/null && grep -q "$group" /etc/group
then 
    echo  "Membership invalid but available to join"
elif getent passwd "$username"  > /dev/null || grep -q "$group" /etc/group
then 
    echo  "One exists, one does not. You figure out which."
else 
echo "Both are not found - why are you even asking me this?"
fi
