cd ~/dotfiles
git add -A
git diff --cached
$in = Read-Host "Input commit message"
git commit -m "$in"
git push origin master
