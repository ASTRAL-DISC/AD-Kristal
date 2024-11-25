@echo off
git remote add upstream https://github.com/KristalTeam/Kristal.git
git fetch upstream main
git merge --no-ff upstream/main
pause
"C:\Program Files\LOVE/lovec" .