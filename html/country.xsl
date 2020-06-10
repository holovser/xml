<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'"/>
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>

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
                    <h1>
                        <xsl:value-of select="country/name"/>
                    </h1>

                    <xsl:variable name="country-name" select="country/name"/>
                    <img src="../countries-png/{$country-name}.png"/>

                    <xsl:apply-templates select="country"/>

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


    <xsl:template match="country/*">
        <xsl:if test="name() != 'name'">
            <h2>
                <xsl:value-of select="concat(translate(substring(name(),1,1), $lowercase, $uppercase),
          substring(name(), 2))"/>
            </h2>
            <p>
                <xsl:copy-of select="text()"/>
            </p>

            <xsl:for-each select="*">
                <xsl:if test="not(*) and text() != ''">
                    <h3>
                        <xsl:value-of select="concat(translate(substring(name(),1,1), $lowercase, $uppercase),
          substring(name(), 2))"/>
                    </h3>
                    <p>
                        <xsl:value-of select="."/>
                    </p>
                </xsl:if>

                <xsl:if test="*">
                    <ul>
                        <xsl:for-each select="*">
                            <li>
                                <xsl:if test="name() != 'category'">
                                    <p>
                                        <strong>
                                            <xsl:value-of
                                                    select="concat(translate(substring(name(),1,1),
                                                 $lowercase, $uppercase),substring(name(), 2))"/> :
                                        </strong>
                                        <xsl:value-of select="."/>
                                    </p>
                                </xsl:if>
                                <xsl:if test="name() = 'category'">
                                    <p>
                                        <xsl:value-of select="."/>
                                    </p>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>

