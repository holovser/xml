<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <country>
            <name>
                <xsl:value-of select="//*[@class='region_name1 countryName']"/>
            </name>
            <introduction>
                <xsl:value-of select="//div[@id='field-background']"/>
            </introduction>

            <geography>
                <xsl:value-of select="//div[@id='field-geography-note']"/>
                <location>
                    <xsl:value-of select="//div[@id='field-location']"/>
                </location>
                <coordinates>
                    <xsl:value-of select="//div[@id='field-geographic-coordinates']"/>
                </coordinates>
                <map-references>
                    <xsl:value-of select="//div[@id='field-map-references']"/>
                </map-references>
                <area>
                    <xsl:for-each select="//div[@id='field-area']/div[@class='category_data subfield numeric']">
                        <xsl:if test="span[1] = 'total:'">
                            <total>
                                <xsl:value-of select="span[2]"/>
                            </total>
                        </xsl:if>
                        <xsl:if test="span[1] = 'land:'">
                            <land>
                                <xsl:value-of select="span[2]"/>
                            </land>
                        </xsl:if>
                        <xsl:if test="span[1] = 'water:'">
                            <water>
                                <xsl:value-of select="span[2]"/>
                            </water>
                        </xsl:if>
                    </xsl:for-each>
                </area>
                <climate>
                    <xsl:value-of select="//div[@id='field-climate']"/>
                </climate>
                <natural-hazards>
                    <xsl:value-of select="//div[@id='field-natural-hazards']"/>
                </natural-hazards>
                <population-distribution>
                    <xsl:value-of select="//div[@id='field-population-distribution']"/>
                </population-distribution>
            </geography>

            <people>
                <xsl:value-of select="//div[@id='field-demographic-profile']"/>
                <population>
                    <xsl:value-of select="//div[@id='field-population']"/>
                </population>
                <age-structure>
                    <xsl:apply-templates select="//div[@id='field-age-structure']/div[@class='category_data subfield numeric']"/>
                </age-structure>
                <urbanization>
                    <xsl:value-of select="//div[@id='field-urbanization']"/>
                </urbanization>
                <distribution>
                    <xsl:value-of select="//div[@id='field-population-distribution']"/>
                </distribution>
            </people>

            <government>
                <xsl:value-of select="//*[@id='government-category-section']"/>
            </government>
            <economy>
                <xsl:value-of select="//div[@id='field-economy-overview']"/>
                <gdp>
                    <xsl:value-of select="//div[@id='field-gdp-purchasing-power-parity']"/>
                </gdp>
                <agriculture>
                    <xsl:value-of select="//div[@id='field-gdp-composition-by-sector-of-origin']"/>
                </agriculture>
                <industries>
                    <xsl:value-of select="//div[@id='field-industries']"/>
                </industries>
                <uneployment>
                    <xsl:value-of select="//div[@id='field-unemployment-rate']"/>
                </uneployment>
                <balance>
                    <xsl:value-of select="//div[@id='field-current-account-balance']"/>
                </balance>
                <budget>
                    <xsl:value-of select="//div[@id='field-budget']"/>
                </budget>
            </economy>

            <communications>
                <xsl:value-of select="//div[@id='field-telecommunication-systems']"/>
                <static-telephones>
                    <xsl:value-of select="//div[@id='field-telephones-fixed-lines']"/>
                </static-telephones>
                <mobile-phones>
                    <xsl:value-of select="//div[@id='field-telephones-mobile-cellular']"/>
                </mobile-phones>
                <broadcast-media>
                    <xsl:value-of select="//div[@id='field-broadcast-media']"/>
                </broadcast-media>
                <internet>
                    <xsl:value-of select="//div[@id='field-internet-users']"/>
                </internet>
            </communications>

            <military>
                <xsl:value-of select="//div[@id='field-military-note']"/>
                <forces>
                    <xsl:value-of select="//div[@id='field-military-and-security-forces']"/>
                </forces>
                <obligation>
                    <xsl:value-of select="//div[@id='field-military-service-age-and-obligation']"/>
                </obligation>
                <expenditures>
                    <xsl:value-of select="//div[@id='field-military-expenditures']"/>
                </expenditures>
            </military>

            <transportation>
                <xsl:value-of select="//*[@id='transportation-category-section']"/>
            </transportation>

        </country>
    </xsl:template>
    <xsl:template match="div[@class='category_data subfield numeric']">
        <category>
            <xsl:value-of select="."/>
        </category>
    </xsl:template>

</xsl:stylesheet>

