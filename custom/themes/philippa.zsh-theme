# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
PROMPT="%F{240}%d %{$reset_color%}% "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[red]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"

PROMPT+='$(git_prompt_info)'

# Sucess / failure
# PROMPT+='%(?.>.!%?>) '
PROMPT+='%(?.%F{240}>%{$reset_color%}.%{$fg_bold[red]%}!%?>%{$reset_color%}) '
