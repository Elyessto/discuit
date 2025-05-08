#!/bin/bash

admin_user=${admin_user}

echo "Waiting for user '$USERNAME' to appear in database..."

while true; do
  EXISTS=$(mysql -u root -p 'NewStrongPassword!' discuit  -e  "SELECT * FROM users WHERE username = '${admin_user}';")
  if [ $? ==  0 ]; then
    echo "User '$admin_user'  found in database."
    break
  else 
     pkill discuit
     /app/discuit serve & 
     sleep 20
  fi

done
