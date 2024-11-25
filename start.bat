@echo off
git fetch upstream main
git merge --no-ff upstream/main
pause
git pull
"C:\Program Files\LOVE/lovec" .