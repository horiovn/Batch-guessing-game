:start
@echo off
setlocal enabledelayedexpansion


set /a "target_number=!RANDOM! %% 100 + 1"

echo Welcome to the Guessing Game!
echo.
echo I've picked a random number between 1 and 100.
echo.
echo Try to guess it!
echo.
Pause
cls

:guess
set /p user_guess="Your guess: "

for /f %%A in ("%user_guess%") do set "user_guess=%%A"
if not defined user_guess (
    echo Please enter a valid number.
    goto guess
)


if %user_guess% lss %target_number% (
    echo Higher!
    goto guess
) else if %user_guess% gtr %target_number% (
    echo Lower!
    goto :guess
) else (
    echo Congratulations! You guessed it: %target_number%.
	Pause
	goto :playagain
)

:playagain
	echo Would you like to play again (y/n)
	set /p result="> "
	if %result% EQU y (
	cls
	goto :start
	)
else (
cls
exit
)