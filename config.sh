
#!/bin/bash

echo -n "github user.email : "
read email
echo -n "github user.name : "
read name 
echo -n "github personal token : "
read token 

git config --global user.email $email
git config --global user.name $name
git config --global credential.helper store $token
git config --local core.hooksPath .githooks/

