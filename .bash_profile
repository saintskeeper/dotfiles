# Add `~/bin` to the `$PATH`

export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.

unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# HISTORY 
# Append to the Bash history file, rather than overwriting it
export HISTSIZE=10000
export HISTFILESIZE=2000000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T '
export HISTIGNORE='ls:ll:ls -alh:pwd:clear:history'

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Multiple commands on one line show up as a single line
shopt -s cmdhist

shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

#Auto CD 
shopt -s autocd

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

#Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

##############
#Shell Config#
##############
set -o vi

export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/usr/local/opt/libxslt/bin:$PATH"
export PATH="/usr/local/opt/libxslt/bin:$PATH"
source <(kubectl completion bash)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wday/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/wday/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wday/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/wday/Downloads/google-cloud-sdk/completion.bash.inc'; fi

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/walter/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)# bash completion for tkn                                  -*- shell-script -*-
unset PROMPT_COMMAND
