echo "Loading..."
sed 's/<[^>]*>//g' <(curl -s http://www.textfiles.com/etext/FICTION/) | sort -n -r -k 2| head -1 | cut -d ' ' -f1,5- | awk '{printf("\n"); printf("Name:"); out="";for(i=2;i<=NF;++i){out=out" "$i}; print out; print "Link: http://www.textfiles.com/etext/FICTION/" $1}'
