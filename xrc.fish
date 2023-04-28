function xrc
    set -lx PYTHONPATH (dirname (go say xrc))
    if [ -n "$PYTHONPATH" ]
	p3 -m xrcea $argv
    end
end
