::Head Declarations
@echo off
color A
title Tic-Tac-Toe

set /a p1Wins=0
set /a p2Wins=0


:variable
::Variables to hold spaces
set one=-
set two=-
set three=-
set four=-
set five=-
set six=-
set seven=-
set eight=-
set nine=-

set /a turn=0
set /a numberOfTurns=0


::Draw board to screen
:loop
cls

if %p1Wins% LSS 2 (
	if %p1Wins% GTR 0 (
		echo X player has %p1Wins% win
	) else (
		echo X player has %p1Wins% wins
	)
) else (
	echo X player has %p1Wins% wins
)

if %p2Wins% LSS 2 (
	if %p2Wins% GTR 0 (
		echo O player has %p2Wins% win
	) else (
		echo O player has %p2Wins% wins
	)
) else (
	echo O player has %p2Wins% wins
)
echo.


::turn
if %turn%==0 (
	echo It is the X player's turn
) else (
	echo It is the O player's turn
)
echo.


::board
echo 	%one% ^| %two% ^| %three%
echo 	---------
echo 	%four% ^| %five% ^| %six%
echo 	---------
echo 	%seven% ^| %eight% ^| %nine%
echo.


::--------------------------
::determine win
::--------------------------

::rows

if %one% NEQ - (
    if %one% EQU %two% (
        if %two% EQU %three% (
            goto endGame
        )
    )
)
if %four% NEQ - (
    if %four% EQU %five% (
        if %five% EQU %six% (
            goto endGame
        )
    )
)
if %seven% NEQ - (
    if %seven% EQU %eight% (
        if %eight% EQU %nine% (
            goto endGame
        )
    )
)

::columns

if %one% NEQ - (
    if %one% EQU %four% (
        if %four% EQU %seven% (
            goto endGame
        )
    )
)
if %two% NEQ - (
    if %two% EQU %five% (
        if %five% EQU %eight% (
            goto endGame
        )
    )
)
if %three% NEQ - (
    if %three% EQU %six% (
        if %six% EQU %nine% (
            goto endGame
        )
    )
)

::diagonals

if %one% NEQ - (
    if %one% EQU %five% (
        if %five% EQU %nine% (
            goto endGame
        )
    )
)
if %three% NEQ - (
    if %three% EQU %five% (
        if %five% EQU %seven% (
            goto endGame
        )
    )
)

::determine tie game

if %numberOfTurns% EQU 9 (
    echo Cats Game.
    timeout 6
    goto prompt

)
::-------------------------------------
::take turn
::-------------------------------------

:turn
::set the turn symbol to either x or o

if %turn% EQU 0 (
    set turnSymb=X
) else (
    set turnSymb=O
)

::Accept user input

set /p input=:
if "%input%" EQU "help" (
    goto helpScreen
) else if "%input%" EQU "exit" (
    cls
    color C
    echo Sad to see you go.
    echo Be back soon.
    timeout 12
    exit
)

::Process user input

set /a userInput=%input%

::change variable value to reflect input from player

if %userInput% EQU 1 (
    if %one% EQU - (
        set one=%turnSymb%
    ) else (
        echo Space is already taken.
        goto turn
    )
) else if %userInput% EQU 2 (
    if %two% EQU - (
        set two=%turnSymb% 
    ) else (
        echo Space is already taken.
        goto turn
    )
)  else if %userInput% EQU 3 (
    if %three% EQU - (
        set three=%turnSymb%
    ) else (
        echo Space is already taken.
        goto turn
    )
)  else if %userInput% EQU 4 (
    if %four% EQU - (
        set four=%turnSymb%
    ) else (
        echo Space is already taken.
        goto turn
    )
)   else if %userInput% EQU 5 (
    if %five% EQU - (
        set five=%turnSymb%
    ) else (
        echo Space is already taken.
        goto turn
    )
) else if %userInput% EQU 6 (
    if %six% EQU - (
        set six=%turnSymb%
    ) else (
        echo Space is already taken.
        goto turn
    )
)   else if %userInput% EQU 7 (
    if %seven% EQU - (
        set seven=%turnSymb%
    ) else (
        echo Space is already taken.
        goto turn
    )
)   else if %userInput% EQU 8 (
    if %eight% EQU - (
        set eight=%turnSymb%
    ) else (
        echo Space is already taken.
        goto turn
    )
)   else if %userInput% EQU 9 (
    if %nine% EQU - (
        set nine=%turnSymb%
    ) else (
        echo Space is already taken.
        goto turn
    )
) else (
    echo Invalid Input.
    echo Try entering "help" to go to the help page
    echo Try entering "exit" to close the program
    timeout 12
    goto loop
)


::change whose turn it is

if %turn% EQU 0 (
    set /a turn=1
) else (
    set /a turn=0
)
set /a numberOfTurns=%numberOfTurns% +1
goto loop


::endGame
:endGame
if %turn%==0 (
	echo The O player has won the game!
	set /a p2Wins = %p2Wins% + 1
) else (
	echo The X player has won the game!
	set /a p1Wins = %p1Wins% + 1
)




::use prompt to loop
:prompt
set userPrompt=y
echo would you like to play again? [y/n]
set /p userPrompt=:

if "%userPrompt%" EQU "y" (
	goto variable
) else if "%userPrompt%" EQU "Y" (
	goto variable
) else if "%userPrompt%" EQU "n" (
	echo goodbye
) else if "%userPrompt%" EQU "N" (
	echo goodbye
) else (
	echo invalid option!
	goto prompt
)
pause
endlocal
exit 0



::helpScreen
:helpScreen
cls
echo The standard rules of tic-tac-toe apply
echo.
echo To choose a space you need to hit the corresponding
echo number on the number pad. For example 7 would represent
echo the space in the top left of the board
echo.
echo For reference this is what each number corresponds to...
echo.
echo		1 ^| 2 ^| 3
echo 	---------
echo		4 ^| 5 ^| 6
echo 	---------
echo		4 ^| 5 ^| 6
echo.
echo When prompted to play a new game, you can just hit enter
echo instead of entering y.
echo.
echo you may also type "exit" to quit the game at anytime.
pause
goto loop
