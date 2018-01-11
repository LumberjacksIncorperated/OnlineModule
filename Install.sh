#!/bin/bash

#------------------------------------------------------------------------------------------
#*
#* PURPOSE
#* -------
#* To install the 'Haystack Application Online Module'
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
    echo "Installing Haystack Online Module..."
    installModule
    echo "... Done"
}

#------------------------------------------------------------------------------------------
# INTERNAL FUNCTIONS
#------------------------------------------------------------------------------------------
function installModule()
{
    fixScriptPermissions
    installOpenSSL
    compileApplicationSourceCode
}

function fixScriptPermissions()
{
    chmod u+x SendMessage.sh
    chmod u+x getFiles.sh
}

function installOpenSSL()
{
    brew install openssl > removeThis
    rm removeThis
}

function compileApplicationSourceCode()
{
    gcc online.c -o HaystackOnline
}

#------------------------------------------------------------------------------------------
# SCRIPT
#------------------------------------------------------------------------------------------
    main
