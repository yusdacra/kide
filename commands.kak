def ide %{
    rename-client main
    set global jumpclient main

    new rename-client tools
    set global toolsclient tools

    new rename-client docs
    set global docsclient docs
} -docstring 'Creates an IDE-like environment.'

def write-all-kill %{
    write-all
    kill
} -docstring 'Writes all changed buffers associated to a file, kills all clients and the server.'

def install-once %{
    plug-install
    quit!
} -hidden

def update-kide %{
    suspend-and-resume "sh %val{config}/update.sh"
    plug-update
    plug-install
} -docstring 'Updates kide.'

def suspend-and-resume \
    -params 1..2 \
    -docstring 'suspend-and-resume <cli command> [<kak command after resume>]: backgrounds current kakoune client and runs specified cli command.  Upon exit of command the optional kak command is executed.' \
    %{ evaluate-commands %sh{

    # Note we are adding '&& fg' which resumes the kakoune client process after the cli command exits
    cli_cmd="$1 && fg"
    post_resume_cmd="$2"

    # automation is different platform to platform
    platform=$(uname -s)
    case $platform in
        Darwin)
            automate_cmd="sleep 0.01; osascript -e 'tell application \"System Events\" to keystroke \"$cli_cmd\\n\" '"
            kill_cmd="/bin/kill"
            break
            ;;
        Linux)
            automate_cmd="sleep 0.2; xdotool type '$cli_cmd'; xdotool key Return"
            kill_cmd="/usr/bin/kill"
            break
            ;;
    esac

    # Uses platforms automation to schedule the typing of our cli command
    nohup sh -c "$automate_cmd"  > /dev/null 2>&1 &
    # Send kakoune client to the background
    $kill_cmd -SIGTSTP $kak_client_pid

    # ...At this point the kakoune client is paused until the " && fg " gets run in the $automate_cmd

    # Upon resume, run the kak command is specified
    if [ ! -z "$post_resume_cmd" ]; then
        echo "$post_resume_cmd"
    fi
}}
