# Defined in /tmp/fish.E9VGGs/gp.fish @ line 2
function gp --wraps=gnuplot --description 'alias gp=gnuplot'
  if set -q argv[1]; and [ $argv[1] = "-p" ]
    sed -e '/^set\ \(term\|out\)/d;/^replot/d' "$argv[2]" | gnuplot -persist
  else
    gnuplot  $argv;
  end
end
