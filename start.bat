@echo off
git fetch upstream main
git merge --no-ff upstream/main
pause
"C:\Program Files\LOVE/lovec" .