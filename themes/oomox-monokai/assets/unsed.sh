#!/bin/sh
sed -i \
         -e 's/rgb(0%,0%,0%)/#262626/g' \
         -e 's/rgb(100%,100%,100%)/#ffffff/g' \
    -e 's/rgb(50%,0%,0%)/#262626/g' \
     -e 's/rgb(0%,50%,0%)/#ffffff/g' \
 -e 's/rgb(0%,50.196078%,0%)/#ffffff/g' \
     -e 's/rgb(50%,0%,50%)/#262626/g' \
 -e 's/rgb(50.196078%,0%,50.196078%)/#262626/g' \
     -e 's/rgb(0%,0%,50%)/#ffffff/g' \
	"$@"
