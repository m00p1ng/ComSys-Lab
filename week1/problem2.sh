cat /dev/null > allbooks.txt

URL="http://www.textfiles.com/etext/FICTION/"

sed 's/<[^>]*>//g' <(curl -s $URL) |
cut -d ' ' -f1 |
grep -E '*.txt'|
while read book
do
    echo "Loading... $book"
    curl -s $URL$book >> allbooks.txt
    echo "$book was downloaded"
    echo
done
echo "All books was concatenated."
