//-----------------------------------------------------------------------------------------
//*
//*  DESCRIPTION
//*  -----------
//*  Haystack Online Module Application Source Code
//*
//*  AUTHOR
//*  ------
//*  Lumbjeracks Incorperated
//*
//*  TIME
//*  ----
//*  2018
//*
//-----------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------
//  INCLUDES
//-----------------------------------------------------------------------------------------
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

//-----------------------------------------------------------------------------------------
//  PRIVATE FUNCTION FORWARD DECLARATIONS
//-------------------------------------------------------------------------------------
void runInterface(void);
void sendMail(void);
void checkMail(void);
void printUserOptions(void);
char* findRecipientAddress(char* name);

//----------------------------------------------------------------------------------------
//  MAIN
//----------------------------------------------------------------------------------------
int main(int argc, char **argv)
{
    runInterface();
    return EXIT_SUCCESS;
}

//-----------------------------------------------------------------------------------------
//  INTERNAL FUNCTIONS
//-----------------------------------------------------------------------------------------
void runInterface(void)
{
    int userOption = -1;
    
    while(userOption != 3)
    {
        printUserOptions();
        
        scanf("%d", &userOption);
        if(userOption == 1)
        {
            sendMail();
        }
        else if(userOption == 2)
        {
            checkMail();
        }
        else
        {
            break;
        }
    }
}

void printUserOptions(void)
{
    printf("\n1 - Send Mail\n2 - Check Mail\n3 - Quit\n");
}

void sendMail(void)
{
    system("./SendMessage.sh");
}

void checkMail(void)
{
    system("./getFiles.sh");
}
