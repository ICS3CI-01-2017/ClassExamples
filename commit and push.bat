@echo off
git add *
set /p message=Enter the commit message for this git commit
git commit -m "%message"
pause