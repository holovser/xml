<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

  <country>
      <introduction>
        <xsl:value-of select="//div[@id='field-background']"/>
      </introduction>

      <geography>
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
      </geography>

      <people>
          <population>
              <xsl:value-of select="//div[@id='field-population']"/>
          </population>
          <description>
              <xsl:value-of select="//div[@id='field-demographic-profile']"/>
          </description>
      </people>

      <government>
          <xsl:value-of select="//*[@id='government-category-section']"/>
      </government>
      <economy>
          <xsl:value-of select="//div[@id='field-economy-overview']"/>
      </economy>
  </country>
</xsl:template>

</xsl:stylesheet>

