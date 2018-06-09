for x in git python
do wget -O "$x.html" "http://stackoverflow.com/questions/tagged/$x?sort=votes&pageSize=25" && \
   echo cat "//div[@id='questions']//div[@class='votes']/span/strong/text()|//div[@id='questions']//div[@class='summary']/h3/a/text()" | \
   xmllint --html --shell "$x.html" | \
   grep -v '^ -\+$' | \
   paste -sd '\t\n' | \
   column -s "$(printf '\t')" -t > "$x.text"
done
