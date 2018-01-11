#!/bin/bash

#------------------------------------------------------------------------------------------
#*
#* PURPOSE
#* -------
#* For use by the 'Haystack Application Online Module' to receive a encrypted messages
#* bundle
#*
#* AUTHOR
#* ------
#* Lumberjacks Incorperated (2018)
#*
#------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------
# GLOBAL VARIABLES
#------------------------------------------------------------------------------------------
DATA="NONE"

#------------------------------------------------------------------------------------------
# MAIN
#------------------------------------------------------------------------------------------
main()
{
   echo "Retrieving the encrypted message bundle…"
   recieveEncryptedMessagesBundle
   echo "... Done"
}

#------------------------------------------------------------------------------------------
# INTERNAL FUNCTIONS
#------------------------------------------------------------------------------------------
function recieveEncryptedMessagesBundle()
{
    pullMessagesFromServer
    parseMessages
}

function pullMessagesFromServer()
{
    DATA=$(wget -O - http://207.246.114.85/read.php)
}

function parseMessages()
{
    IFS=$'\n'
    read -rd '' -a array <<<"$DATA"
    
    messageCounter=1
    for element in "${array[@]}"
    do
        writeMessageOutToFile $element $messageCounter
        messageCounter=$((messageCounter+1))
    done
}

function writeMessageOutToFile()
{
    echo $1 | tr '.' '+' > anotherUselessFile
    value=$(<anotherUselessFile)
    openssl base64 -A -d <<< $value > "msg_$2"
    mv "msg_$2" ./Recieved/
}

#------------------------------------------------------------------------------------------
# SCRIPT
#------------------------------------------------------------------------------------------
    main
