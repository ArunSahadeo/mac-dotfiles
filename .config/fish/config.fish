# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
 
function fish_prompt
        set last_status $status
        set_color $fish_color_cwd
        printf '%s' (prompt_pwd)
        set_color normal
        printf '%s ' (__fish_git_prompt)
       set_color normal
end


set PHP_VERSION (ls /Applications/MAMP/bin/php/ | sort -n | tail -1)
set -x PATH /Applications/MAMP/bin/php/php7.0.8/bin /Applications/MAMP/bin/php/php5.5.26/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /Applications/MAMP/Library/bin /usr/local/sbin set -g fish_user_paths "/usr/local/opt/qt/bin" $fish_user_paths
set -g CPPFLAGS -I/usr/local/opt/qt/include
set -g LDFLAGS -L/usr/local/opt/qt5/lib
set -g LC_CTYPE C
set -g LANG C
set fish_key_bindings fish_default_key_bindings
rvm use default
