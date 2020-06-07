# XML semestral work

## Convert HTML to XML
tidy -q -asxml --numeric-entities yes ./countries-html/argentina.html > ./countries-xml/argentina-transform.xml


## Join XML files with DTD 
xmllint --noent countries-dtd.xml > countries-join.xml

## Validate XML due to its DTD schema
xmllint --valid cyprus-transform.xml > /dev/null

