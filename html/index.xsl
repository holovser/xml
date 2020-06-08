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
                <style>
                    #buttons {
                        width: 40em;
                        margin: auto;
                    }

                    #buttons a {
                        margin: 1em;
                    }
                </style>
            </head>
            <body>

                <ul class="nav nav-pills">
                    <xsl:for-each select="countries/*">
                        <li class="nav-item">
                            <a class="nav-link">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="name(.)"/>.html
                                </xsl:attribute>
                                <xsl:value-of select="name(.)"/>
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>

                <h1 style="text-align: center">Index of countries</h1>

                <div id="buttons">
                    <xsl:for-each select="countries/*">
                        <a class="btn btn-primary btn-lg">
                            <xsl:attribute name="href">
                                <xsl:value-of select="name(.)"/>.html
                            </xsl:attribute>
                            <xsl:value-of select="name(.)"/>
                        </a>
                    </xsl:for-each>
                </div>

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
            </body>
        </html>

    </xsl:template>


</xsl:stylesheet>

