### CREATE A GROUP TO CHANGE FOLDER'S PERMISSIONS
1. create a group and add users to the group
```
# groupadd shared
# usermod -aG shared bob
# usermod -aG shared alice
 ```
2. Recursively change group folder ownership:
 ```
 # chgrp -R shared /data
 ```
3. Adding reading, writing and executing (only for files already executables) permissions for the group shared:
 ```
 # chmod -R g+rwX /data
 ```

sudo chown -R <username>: <folderName>
### ADD A USER
```
sudo useradd user_name
sudo passwd user_name
```
## how to kill the GPU based on the PID from nvidia-smi output 
`sudo kill -9 PID`  
i.e.: `sudo kill -9 2425494`
![image](https://github.com/Ch-rode/snippets/assets/61243245/4f05fe6b-bae9-4247-869e-41f6f0dcb977)
