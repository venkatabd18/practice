#!/bin/bash
USERID=$(id -u)
CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Run the script with root access"
        exit 1
    fi
}
VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is FAILED. Pls check"
        exit 1
    else
        echo "$2 is Success"
    fi
}

CHECK_ROOT

echo "Sricpt executed on: $(date)"

dnf list installed ansible
if [ $? -ne 0 ]
then  
    echo "Ansible not installed. installing now"
    dnf install ansible -y
    VALIDATE $? "Install ansible"
else
    echo "Ansible alredy installed. nothig to do"
fi