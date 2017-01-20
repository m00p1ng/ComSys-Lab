cat /dev/null > allbooks.txt
sed 's/<[^>]*>//g' <(curl -s http://www.textfiles.com/etext/FICTION) | cut -d ' ' -f1 | grep -E '*.txt' | head -2| while read line; do echo "Loading... $line"; curl -s http://www.textfiles.com/etext/FICTION/$line >> allbooks.txt; done; echo "All books was concatenated."
