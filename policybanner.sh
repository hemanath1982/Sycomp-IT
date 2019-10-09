#!/bin/bash

# Program Name
echo "**************************************"
echo "*   Executing Banner Program for mac *"
echo "**************************************"

sleep 2

#OS Check
echo "**************************"
echo "*  Performing OS check!! *"
echo "**************************"


OS="`uname`"
if [ $OS == "Darwin" ] ;  then
echo "**************"
echo "It is a Mac OS"
echo "**************"
else
echo "It is not a Mac OS"
exit 1
fi

sleep 2

#change the path.
echo "*****************************"
echo "* Change the Directory path *"
echo "*****************************"

cd /Library/Security

sleep 2

#check a policy banner file is existing
Content="      This system is for the use of authorized users only. 
      Individuals using this computer system without
      authority, or in excess of their authority, are subject
      to having all of their activities on this system
      monitored and recorded by system personnel.  In the
      course of monitoring individuals improperly using this
      system, or in the course of system maintenance, the
      activities of authorized users may also be monitored. 
      Anyone using this system expressly consents to such
      monitoring and is advised that if such monitoring
      reveals possible evidence of criminal activity, system
      personnel may provide the evidence of such monitoring
      to law enforcement officials."
FILE="PolicyBanner.txt"
if [ ! -f "$FILE" ]
then
   echo  "Banner  File does not exist!!!"
   echo  "Creating Banner File......."
   echo  "$Content" | tee PolicyBanner.txt
   cat $FILE
   chmod o+r $FILE
  else
   echo "***********************"
   echo "*Banner File Exists!!!*"
   echo "***********************"
   cat PolicyBanner.txt
 fi
