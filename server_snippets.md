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
