if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Alias for ranger
alias rr='ranger'

# Alias for sudo ranger
alias sr='sudo ranger'

function ttt
	    read -P "masukkan input: " input; eval "tgpt \"$input\""
    end

set -x PATH /usr/bin/mongod $PATH
set -x PATH /usr/bin/node $PATH
set -x PATH /usr/bin/python $PATH
