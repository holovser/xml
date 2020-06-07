# XML semestral work

## Convert HTML to XML
tidy -q -asxml --numeric-entities yes ./countries-html/argentina.html > ./countries-xml/argentina-transform.xml


## Join xml files with DTD 
xmllint --noent countries-dtd.xml > countries-join.xml
