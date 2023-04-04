

#WHILE LOOP - READ THROUGH A FILE LINE BY LINE
 LINE=1
 USERS_EXIST=$(ls /home)
 while read -r CURRENT_LINE
     do
                if [ "${USERS_EXIST[*]}" == "${CURRENT_LINE}" ]
                then
                        echo "$LINE:$CURRENT_LINE: You are already a user"
                else
                        echo "$LINE:$CURRENT_LINE: You are not a user yet"
                        sudo useradd -m -G developers $CURRENT_LINE
                        mkdir /home/$CURRENT_LINE/.ssh
                        touch /home/$CURRENT_LINE/.ssh/authorized_keys
                        echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzKZyicHxIkklSrNlxsJyyTrcIdBIt84Z0cQb3R4k0jH53kxkaT5hP8tfWTe62LXi7vV86fY+SX7TBNM76XGCbw/6vrMGegm6J1x2i1AiLNwq5nqTjOGn0AIwku4IlCCLAB7tdfRyVuCarmBlwny3lzRyybIUAWXR/D6vpN09MsDILbKdhay+Q/p9OUBMSLPqXdY/QIh/Oe3rVv1lwY3AohNfq7V3tO88zKswfA5iiexNiSYX1myT0OrX8cBE771j9quoNZhQgaLI1mIMtAvnHQChrn9k2nUaO/BMBCQGol5XzGv1ado7hgoVPoluIUD+FGNo/pH4zcmDLICH6drXY/C9MESnkMUPLFxBXKO/OitApY71vRao9nAhAwpVMsy6FqiOb5uawhvhoHYIHTV/f4EtagVagRMP2PxYMYR6jykIV4MPJTkCm+lGhTyMlRu+qRQjdLn8AAtHf4aEV8dIkoGh088DI7eA/4o0wz4OV4upH5ewSFS+5IHmRECEW5Nc=" >> /home/$CURRENT_LINE/.ssh/authorized_keys
                fi
         ((LINE++))
 done < "Shell/names.csv"
