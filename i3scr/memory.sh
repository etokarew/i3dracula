#!/bin/sh

free -m | awk 'NR == 2 {
    pr = 100*($3/$2);
    if(pr < 12.5) foo = "▁";
    else if(pr < 25) foo = "▂";
    else if(pr < 37.5) foo = "▃";
    else if(pr < 50) foo = "▄";
    else if(pr < 62.5) foo = "▅";
    else if(pr < 75) foo = "▆";
    else if(pr < 87.5) foo = "▇";
    else foo = "█";
    printf "%s %.2f/%.2f", foo, $3/1024, $2/1024
}'
