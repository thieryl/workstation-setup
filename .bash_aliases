#! /bin/bash
#################################################################################
#     File Name           :     .bash_aliases
#     Created By          :     thieryl
#     Email               :
#     Creation Date       :     [Tue 08 Aug 2017 03:46:21 PM +04]
#     Last Modified       :     [Tue 04 Sep 2018 01:40:55 PM +04]
#     Description         :
#     Usage               :
#                         :
#################################################################################
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias conn='ssh -A proxy'
alias myip="curl http://ipecho.net/plain; echo"
alias scp="scp -C"
alias lstpo="lsof -P -i -n"
alias busy='cat /dev/urandom | hexdump -C | grep "ca fe"'
alias aawfe='ssh -A root@aaw-febe-stag'
alias aawdb='ssh -A root@aaw-db-stag'
alias bat='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'
alias remove_host='ssh-keygen -R'
alias vi='vim'
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gcam='git commit -am'
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short --abbrev-commit'
alias gsd='git svn dcommit'
alias gsfr='git svn fetch && git svn rebase'
# Personal alais
alias pass='gpg -d ~/Projects/RBD/1Password.txt.gpg'
alias myaws='ssh -i "~/.ssh/tlo-aws.pem" ec2-user@ec2-34-240-15-26.eu-west-1.compute.amazonaws.com'
alias mypaws='ssh -A thieryl@ec2-34-240-15-26.eu-west-1.compute.amazonaws.com'
#alias pgen='date +%s | sha256sum | base64 | head -c 10 ; echo'
alias pgen='alpha'
alias whitelist='aws allow-my-ip 'Proxy-Cerebro' tcp 22 rbd_sys'
alias safe='safe && sleep 10; clear'
alias dc='docker-compose'
alias dm='docker-machine'
# VS Code
# Redbox magento Cloud
alias mgc=magento-cloud
alias asq_int='ssh til5mhodtb3kk-integration-5ojmyuq--mymagento@ssh.ap-3.magento.cloud'
alias asq_stg='ssh ent-til5mhodtb3kk-staging-5em2ouy@ssh.ap-3.magento.cloud'
alias asq_prd='ssh ent-til5mhodtb3kk-production-vohbr3y@ssh.ap-3.magento.cloud'
alias alj-prod='ssh tnm37afzcydqq@tnm37afzcydqq.ent.magento.cloud'
alias alj-pre='ssh tnm37afzcydqq_stg@tnm37afzcydqq.ent.magento.cloud'
alias alj-dev='ssh tnm37afzcydqq-master-7rqtwti@ssh.eu.magentosite.cloud'
alias oli-prod='ssh 6b22nws7ukwag@6b22nws7ukwag.ent.magento.cloud'
alias oli-pre='ssh 6b22nws7ukwag_stg@6b22nws7ukwag.ent.magento.cloud'
alias mad_prod='ssh pmmfmmcp4ge7k@pmmfmmcp4ge7k.ent.magento.cloud'
alias mad_pre='ssh pmmfmmcp4ge7k_stg@pmmfmmcp4ge7k.ent.magento.cloud'
alias nesp_prod='ssh pintofab@146.177.32.68'
alias nest_prod='ssh nestle-new.stag.redboxcloud.com'
alias axa_pre='ssh ent-m6rw4nocyvqu6-staging-5em2ouy@ssh.eu-3.magento.cloud'
