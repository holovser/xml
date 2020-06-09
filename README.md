# XML semestral work

## Convert HTML to XML
tidy -q -asxml --numeric-entities yes ./countries-html/argentina.html > ./countries-xml/argentina-transform.xml


## Join XML files with DTD 
xmllint --noent countries-dtd.xml > countries-join.xml

## Validate XML due to its DTD schema
xmllint --valid cyprus-transform.xml > /dev/null

## Validate XML due to its RelaxNg schema
xmllint --relaxng schema.rng ../countries-xml/argentina-transform.xml  > /dev/null

## Format XML to PDF
../fop-2.5/fop/fop -xml countries-xml/argentina.xml  -xsl pdf-formatting/country-fo.xsl -pdf country.pdf
