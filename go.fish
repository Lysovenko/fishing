# Defined in /tmp/fish.RO2YUo/go.fish @ line 2
function go
    set -l PYSCRIPT $HOME/work/Programming/Python/gotree.py
    if ! set -q argv[1]
        python3 $PYSCRIPT tree ~/work/bmks.txt ~/usr/bmks.txt | less -r
        return
    end
    if [ d$argv[1] = "d-h" -o d$argv[1] = "d--help" ]
        echo "Usage: go [add, del] <alias> [user, usr]"
        return
    end
    if [ $argv[1] = "add" ]
        set curd (string replace $HOME "~" $PWD)
        if set -q argv[3]; and [ $argv[3] = "usr" -o $argv[3] = "user" ]
             set file $HOME/usr/bmks.txt
        else
             set file $HOME/work/bmks.txt
        end
        python3 $PYSCRIPT add $argv[2] $curd $file
        echo $curd
        set -e file
        set -e curd
    else if [ $argv[1] = "del" ]
        python3 $PYSCRIPT del $argv[2] ~/work/bmks.txt ~/usr/bmks.txt
    else if [ $argv[1] = "say" ]
        python3 $PYSCRIPT dirname "$argv[2]" ~/work/bmks.txt ~/usr/bmks.txt
	return
    else
        set GOTO (python3 $PYSCRIPT dirname $argv[1] ~/work/bmks.txt ~/usr/bmks.txt)
    end
    if [ $GOTO ]
        cd $GOTO
        ls
    else
        python3 $PYSCRIPT tree ~/work/bmks.txt ~/usr/bmks.txt | less -r
    end
end
