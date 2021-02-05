#!/bin/zsh

# Load necessary ZSH functions
autoload colors zsh/terminfo

# Script initially found at https://pthree.org/2009/12/18/add-colors-to-your-zsh-scripts/
if [[ "$terminfo[colors]" -gt 8 ]]; then
    colors
fi

for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='$fg_no_bold[${(L)COLOR}]'
    eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
done
eval RESET='$reset_color'

# Now use it like following example: 
# echo "${RED}das ist rot ${RESET}Das ist normal ${BOLD_YELLOW} das ist gelb bold${RESET}"