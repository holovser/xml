# XML semestral work


## Description of performed work

1. Converting pure html of individual countries to xhml with tidy command. Pure html directory: countries-html. xhtml files: countries-xml/argentina.xml countries-xml/cyprus.xml countries-xml/nepal.xml countries-xml/yemen.xml
2. Convert xhtml files to xml with transform.xsl file; Output files: ../countries-xml/argentina-transform.xml ../countries-xml/cyprus-transform.xml ../countries-xml/nepal-transform.xml ../countries-xml/yemen-transform.xml 
3. File for joining individual countries' xml to one xml: countries-dtd.xml; Output file: countries-join.xml
4. Validating XMLs due to DTD schema. Shema file: schema/schema.dtd Input files: schema/*
5. Validating XMLs due to RelaxNg schema. Shema file: relaxng/schema.rng Input files: countries-xml/nepal-transform.xml and similar in the same directory
6. Formating XML to HTML. html/index.xsl – xsl file for generating index.html file. html/country.xsl – xsl file for generating individual countries. 
7. Generating XML to PDF with Apache FOP. Input files: ./pdf-formatting/countries-join.xml  ./pdf-formatting/index-fo.xsl. Output file: index.pdf

### Convert HTML to XML
tidy -q -asxml --numeric-entities yes ./countries-html/argentina.html > ./countries-xml/argentina-transform.xml

### Join XML files with DTD 
xmllint --noent countries-dtd.xml > countries-join.xml

### Validate XML due to its DTD schema
xmllint --valid cyprus-transform.xml > /dev/null

### Validate XML due to its RelaxNg schema
xmllint --relaxng schema.rng ../countries-xml/argentina-transform.xml  > /dev/null

### Format XML to PDF
../fop-2.5/fop/fop -xml countries-xml/argentina.xml  -xsl pdf-formatting/country-fo.xsl -pdf country.pdf

### XSL execution was performed with IDEA XSLT tool
