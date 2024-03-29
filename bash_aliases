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

# NVim alias to nightly build
alias nvim='/usr/local/bin/nvim'

# ShiftLeft Scan aliases
alias scan='docker run --rm -e "WORKSPACE=${PWD}" -v $PWD:/app shiftleft/scan scan --build'
alias reports='nohup firefox `find ./reports -type f -name "*.html" | xargs -n1 -I {} echo "-url {}"` > /dev/null &'

