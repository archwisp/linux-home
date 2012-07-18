# Author :: Bryan Geraghty
# Date :: 2009-10-28
# Notes :: ACL management functions

##
# Resets permissions on all files and directories in the specified path and removes
# and ACL entries
#
# @param string $2 Base path Path in which all operations will take place
#
function resetAll
{
   echo "Resetting permissions on all files in directory $1";

   echo "Removing ACLs...";
   setfacl -Rb $1;

   echo "Resetting directories...";
   find $1 -type d -exec chmod 770 {} \;

   echo "Resetting files...";
   find $1 -type f -exec chmod 660 {} \;
}

## 
# Grants read permissions to all files/folders with names matching $3, which reside
# inside of directory $2, to user $1.
#
# @param string $1 Username The user to whom read permissions will be granted
# @param string $2 Base path Path in which all operations will take place
# @param string $3 Target Name of the file/directory on which to set the permissions
#
function grantUserRead
{
   echo "Granting read permission to user $1 on files/folders named $3 in directory $2";

   ## Set the default permissions for new files on the specified directory
   echo "Setting defaults...";
   find $2 -name "$3" -type d -exec setfacl -d -m u:$1:rx {} \;

   ## Recusively set the permissions on all existing directories and files within the
   ## specified directory
   echo "Setting directory permissions...";
   find $2 -name "$3" -type d -exec setfacl -R -m u:$1:rx {} \;

   ## Grant permissions to any files with the specified name
   echo "Setting file permissions...";
   find $2 -name "$3" -type f -exec setfacl -m u:$1:r {} \;
}

## 
# Grants write permissions to all files/folders with names matching $3, which reside
# inside of directory $2, to user $1.
#
# @param string $1 Username The user to whom read permissions will be granted
# @param string $2 Base path Path in which all operations will take place
# @param string $3 Target Name of the file/directory on which to set the permissions
#
function grantUserWrite
{
   echo "Granting write permission to user $1 on files/folders named $3 in directory $2";

   ## Set the default permissions for new files on the specified directory
   echo "Setting defaults...";
   find $2 -name "$3" -type d -exec setfacl -d -m u:$1:rwx {} \;

   ## Recusively set the permissions on all existing directories and files within the
   ## specified directory
   echo "Setting directory permissions...";
   find $2 -name "$3" -type d -exec setfacl -R -m u:$1:rwx {} \;

   ## Grant permissions to any files with the specified name
   echo "Setting file permissions...";
   find $2 -name "$3" -type f -exec setfacl -m u:$1:rw {} \;
}

## 
# Grants read permissions to all files/folders with names matching $3, which reside
# inside of directory $2, to group $1.
#
# @param string $1 Group The user to whom read permissions will be granted
# @param string $2 Base path Path in which all operations will take place
# @param string $3 Target Name of the file/directory on which to set the permissions
#
function grantGroupRead
{
   echo "Granting read permission to group $1 on files/folders named $3 in directory $2";

   ## Set the default permissions for new files on the specified directory
   echo "Setting defaults...";
   find $2 -name "$3" -type d -exec setfacl -d -m g:$1:rx {} \;

   ## Recusively set the permissions on all existing directories and files within the
   ## specified directory
   echo "Setting directory permissions...";
   find $2 -name "$3" -type d -exec setfacl -R -m g:$1:rx {} \;

   ## Grant permissions to any files with the specified name
   echo "Setting file permissions...";
   find $2  -name "$3" -type f -exec setfacl -m g:$1:r {} \;
}

## 
# Grants write permissions to all files/folders with names matching $3, which reside
# inside of directory $2, to group $1.
#
# @param string $1 Group The user to whom read permissions will be granted
# @param string $2 Base path Path in which all operations will take place
# @param string $3 Target Name of the file/directory on which to set the permissions
#
function grantGroupWrite 
{
   echo "Granting write permission to group $1 on files/folders named $3 in directory $2";

   ## Set the default permissions for new files on the specified directory
   echo "Setting defaults...";
   find $2 -name "$3" -type d -exec setfacl -d -m g:$1:rwx {} \;

   ## Recusively set the permissions on all existing directories and files within the
   ## specified directory
   echo "Setting directory permissions...";
   find $2 -name "$3" -type d -exec setfacl -R -m g:$1:rwx {} \;

   ## Grant permissions to any files with the specified name
   echo "Setting file permissions...";
   find $2 -name "$3" -type f -exec setfacl -m g:$1:rw {} \; 
}

## 
# Grants execute permissions to all files/folders with names matching $3, which reside
# inside of directory $2, to user $1.
#
# @param string $1 Username The user to whom read permissions will be granted
# @param string $2 Base path Path in which all operations will take place
# @param string $3 Target Name of the file/directory on which to set the permissions
#
function grantUserExec
{
   echo "Granting execute permission to user $1 on files/folders named $3 in directory $2";

   ## Set the default permissions for new files on the specified directory
   echo "Setting defaults...";
   find $2 -name "$3" -type d -exec setfacl -d -m u:$1:rwx {} \;

   ## Recusively set the permissions on all existing directories and files within the
   ## specified directory. One command will siffice for files and directories when
   ## setting execute permissions 
   echo "Setting directory and file permissions...";
   find $2 -name "$3" -exec setfacl -R -m u:$1:rwx {} \;
}

## 
# Grants execute permissions to all files/folders with names matching $3, which reside
# inside of directory $2, to group $1.
#
# @param string $1 Group The user to whom read permissions will be granted
# @param string $2 Base path Path in which all operations will take place
# @param string $3 Target Name of the file/directory on which to set the permissions
#
function grantGroupExec
{
   echo "Granting execute permission to group $1 on files/folders named $3 in directory $2";

   ## Set the default permissions for new files on the specified directory
   echo "Setting defaults...";
   find $2 -name "$3" -type d -exec setfacl -d -m g:$1:rwx {} \;

   ## Recusively set the permissions on all existing directories and files within the
   ## specified directory. One command will siffice for files and directories when
   ## setting execute permissions 
   echo "Setting directory and file permissions...";
   find $2 -name "$3" -exec setfacl -R -m g:$1:rwx {} \;
}
