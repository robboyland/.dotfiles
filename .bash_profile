
export PATH="~/.composer/vendor/bin:vendor/bin:/usr/local/git/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

HISTIGNORE="ll:history:pwd:cd ..:gs:gaa:..:phpunit:t"

for file in ~/.dotfiles/.{aliases,functions}; do
        [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file


# [command prompt for git repos]

function parse_git {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git)]/"
}

   NO_COLOUR="\[\033[0m\]"
   CYAN="\[\033[0;36m\]"

   PS1="\u:\w$CYAN\$(parse_git_branch)$NO_COLOUR\$ "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

