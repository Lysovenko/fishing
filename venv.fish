# Defined in /tmp/fish.BquLRU/venv.fish @ line 2
function venv
    if ! set -q argv[1]
        echo -n "Available venvs:"
        find $HOME/usr/venvs -maxdepth 1 -type d -printf '%P\n'
        return
    end
    set -l vpath $HOME/usr/venvs/$argv[1]
    set -l afile $vpath/bin/activate.fish
    if [ -f $afile ]
        source $afile
    else
        echo "it is no venv" $argv[1]
        read -P "Create a new one (y/n)? " ans
        if [ (string upper (string sub -s1 -l1 -- $ans)) = "Y" ]
            python3 -m venv $vpath
            find $HOME/usr/venvs -maxdepth 1 -type d -printf '%P\n'
        end
    end
end
