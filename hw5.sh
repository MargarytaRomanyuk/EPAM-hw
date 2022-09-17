
# Tasks:
# create homework folder in your user's home folder
# create SURNAME environment variable equal to your surname
# verify that SURNAME variable is present in the environment using env command
# verify that you are able to run your script by typing only its name into the terminal

#----------------------------------------------------------------------------
# create a script in homework folder that prints the value of SURNAME variable

# export SURNAME=Surname
# vi script.sh 
# in opened script.sh  add "#! /bin/bash 
#				echo $SURNAME"I

# ./script.sh
# output: Surname


# add homework folder to PATH
# vi ~/.barshrc 
# in opened ~/.barshrc add string "export PATH=$PATH:/home/User/homework"

# verify that you are able to run your script by typing only its name into the terminal
#_script.sh command gives the following output: Surname
