# zshparam{{{1
stty 115200
export WORDCHARS=
export EDITOR=vim
export LANG=en_US.UTF-8
export LC_COLLATE=C
export TERM=xterm-256color
# export TERM=screen-256color
chpwd(){ ls -F --color=auto }
export LESS='-FX'
export LESSCHARSET=utf-8
export PAGER='/usr/bin/less'
export GNUTERM=x11
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
HISTFILE=$HOME/repos/zsh-history/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
autoload -Uz add-zsh-hook
fpath+=~/.zfunc
autoload -Uz compinit; compinit -u
autoload -Uz colors; colors
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
autoload -Uz vcs_info
limit coredumpsize 100000

# zshzle{{{1
bindkey -e
bindkey -r "^['"
bindkey -r "^o"

# Changing Directories{{{1
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# Completion{{{1
setopt complete_in_word
setopt no_list_beep
setopt list_packed

# Expansion and Globbing{{{1
setopt brace_ccl
setopt glob_dots
setopt magic_equal_subst
setopt mark_dirs

# History{{{1
setopt extended_history
setopt no_hist_beep
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify

# Input/Output{{{1
setopt correct
setopt no_flow_control
setopt ignore_eof
setopt interactive_comments
setopt print_eight_bit
setopt rm_star_silent

# Job Control{{{1
setopt auto_resume
setopt long_list_jobs
setopt no_hup

# Prompting{{{1
setopt prompt_subst
setopt transient_rprompt

# Zle{{{1
setopt no_beep

# zshcompsys{{{1
zstyle ':completion:*' menu select=2
zstyle ':completion:*' completer _complete _expand _list _match _prefix
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' unstagedstr '-'
zstyle ':vcs_info:*' formats '[%u%c%b]'
zstyle ':vcs_info:*' actionformats '[%u%c%b|%a]'
precmd() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT="%B%K{blue}%F{green}@%m%k%b%f%B%K{blue}%F{green}[%39<...<%~]%*%f%k%f%1(v|%F{green}%1v%f|)%K{red}%F{green}%(?..[%?])%f%k${NEWLINE}%B%K{blue}%F{green}( l_l )%f%k%b "
PROMPT2="%B%K{red}%F{green}@%m%k%b%f%B%K{red}%F{green}[%39<...<%~]%*%f%k%f%1(v|%F{green}%1v%f|)%K{red}%F{green}%(?..[%?])%f%k${NEWLINE}%B%K{red}%F{green}( l_l )%f%k%b "
SPROMPT='Correct> '''%r''' [Yes No Abort Edit]?'
TMOUT=1
TRAPALRM() {
  ! [[ "$WIDGET" =~ ^(complete-word|expand-or-complete|.*beginning-search)$ ]] && zle reset-prompt
}

# other settings{{{1
source $HOME/.zsh/.zsh_alias
source $HOME/.zsh/.zsh_func
source $HOME/.zsh/.zsh_path
