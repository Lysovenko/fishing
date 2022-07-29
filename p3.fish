function p3 --wraps=python3 --description 'python3 or ipython3'
    if ! set -q argv[1]
        ipython3
    else
        python3 $argv
    end
end
