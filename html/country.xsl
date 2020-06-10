<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>
            <head>
                <link rel="stylesheet"
                      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                      crossorigin="anonymous"/>
            </head>
            <body>
                <div class="container">

                    <h1><xsl:value-of select="country/name"/></h1>

                    <xsl:variable name="country-name" select="country/name"/>
                    <img src="../countries-png/{$country-name}.png"/>

                    <h2>Introduction</h2>
                    <p><xsl:value-of select="country/introduction"/></p>

                    <h2>Geography</h2>

                    <h3>Location</h3>
                    <p><xsl:value-of select="country/geography/location"/></p>

                    <h3>Coordinates</h3>
                    <p><xsl:value-of select="country/geography/coordinates"/></p>

                    <h3>Area</h3>
                    <ul>
                        <xsl:for-each select="country/geography/area/*">
                            <li>
                                <xsl:value-of select="name(.)"/> : <xsl:value-of select="."/>
                            </li>
                        </xsl:for-each>
                    </ul>

                    <h3>Climate</h3>
                    <p><xsl:value-of select="country/geography/climate"/></p>


                    <h2>People</h2>

                    <h3>Population</h3>
                    <p><xsl:value-of select="country/people/population"/></p>

                    <h3>Description</h3>
                    <p><xsl:value-of select="country/people/description"/></p>

                    <h2>Government</h2>
                    <p><xsl:value-of select="country/government"/></p>

                    <h2>Economy</h2>
                    <p><xsl:value-of select="country/economy/text()"/></p>


                    <h3>GDP</h3>
                    <p><xsl:value-of select="country/economy/gdp"/></p>

                    <h3>Agriculture</h3>

                    <script
                            src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                            crossorigin="anonymous"/>
                    <script
                            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                            crossorigin="anonymous"/>
                    <script
                            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                            crossorigin="anonymous"/>
                </div>
            </body>
        </html>

    </xsl:template>


</xsl:stylesheet>

