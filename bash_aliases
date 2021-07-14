# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Ansible command aliases
alias a='ansible'
alias ap='ansible-playbook'
alias av='ansible-vault'
alias ag='ansible-galaxy'

# scripts aliases
alias tms='tmux-sessions.sh; tmux a'

# ShiftLeft Scan aliases
alias scan='docker run --rm -e "WORKSPACE=${PWD}" -v $PWD:/app shiftleft/scan scan --build'
alias reports='nohup firefox `find ./reports -type f -name "*.html" | xargs -n1 -I {} echo "-url {}"` > /dev/null &'

# Use neovim 0.5.0 appimage
alias nvim='~/nvim.appimage'
