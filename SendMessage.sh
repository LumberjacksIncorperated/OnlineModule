#!/bin/bash

#------------------------------------------------------------------------------------------
#*
#* PURPOSE
#* -------
#* For use by the 'Haystack Application Online Module' to send the encrypted message
#*
#* AUTHOR
#* ------
#* Lumberjacks Incorperated (2018)
#*
#------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------
# MAIN
#------------------------------------------------------------------------------------------
main()
{
   echo "Sending the encrypted message...."
   sendEncryptedMessage
   echo "... Done"
}

#------------------------------------------------------------------------------------------
# INTERNAL FUNCTIONS
#------------------------------------------------------------------------------------------
function  sendEncryptedMessage()
{
    prepareMessageIntoSendFormat
    sendMessageToServer
}

function prepareMessageIntoSendFormat()
{
    openssl base64 -in encodedMessage -out toSend
    cat toSend | tr -d '\n' | perl -MHTML::Entities -pe 'encode_entities($_);' | tr '+' '.' > ReadyToSend
}

function sendMessageToServer()
{
    value=$(<ReadyToSend)
    echo "$value"
    curl -d "message=$value" -X POST "http://207.246.114.85/write.php"
}

#------------------------------------------------------------------------------------------
# SCRIPT
#------------------------------------------------------------------------------------------
    main
