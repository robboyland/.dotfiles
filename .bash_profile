
export PATH="~/.composer/vendor/bin:vendor/bin:/usr/local/git/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

HISTIGNORE="ll:history:pwd:cd ..:gs:gaa:..:phpunit:t"


# [ Aliases ]

# general
alias ll="ls -lA"
alias ..="cd .."

# git
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gl="git log --oneline"
alias gc="git commit -m"
alias gd="git diff"

# laravel
alias art="php artisan"

alias mmig="php artisan make:migration"
alias mmod="php artisan make:model"
alias mcon="php artisan make:controller"
alias mreq="php artisan make:request"

# vagrant
alias vgs="vagrant global-status"
alias vm="ssh vagrant@127.0.0.1 -p 2222"
alias vssh="vagrant ssh"


# [command prompt for git repos]

function parse_git {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git)]/"
}

   NO_COLOUR="\[\033[0m\]"
   CYAN="\[\033[0;36m\]"

   PS1="\u:\w$CYAN\$(parse_git_branch)$NO_COLOUR\$ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

