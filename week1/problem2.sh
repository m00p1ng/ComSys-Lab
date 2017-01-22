cat /dev/null > allbooks.txt

sed 's/<[^>]*>//g' <(curl -s http://www.textfiles.com/etext/FICTION/) |
cut -d ' ' -f1 |
grep -E '*.txt' |
while read line
do
    echo "Loading... $line"
    curl -s http://www.textfiles.com/etext/FICTION/$line >> allbooks.txt
    echo "$line was downloaded"
    echo
done
echo "All books was concatenated."
