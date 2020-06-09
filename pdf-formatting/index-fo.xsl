<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:fox="http://xmlgraphics.apache.org/fop/extensions">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4-portrait"
                                       page-height="29.7cm" page-width="21.0cm" margin="2cm">
                    <fo:region-body margin-top="5em" margin-bottom="5em"/>
                    <fo:region-after region-name="xsl-region-after" extent="0.5in"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4-portrait">

                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="end">
                        Page
                        <fo:page-number/>
                        of
                        <fo:page-number-citation
                                ref-id="TheVeryLastPage"/>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="24pt" font-weight="bold">
                        Countries List
                    </fo:block>

                    <!--                    Table of contents-->
                    <fo:list-block
                            provisional-distance-between-starts="21mm"
                            provisional-label-separation="7pt">

                        <xsl:for-each select="countries/*">
                            <xsl:variable name="country" select="country/name"/>
                            <fo:list-item space-after="8pt" space-before="13pt" start-indent="1pt">
                                <fo:list-item-label

                                        end-indent="200pt"
                                        text-align="start">
                                    <fo:block font-weight="bold">
                                        <fo:basic-link internal-destination="{$country}"
                                                       color="blue">
                                            <xsl:value-of select="country/name"/>
                                        </fo:basic-link>
                                    </fo:block>
                                </fo:list-item-label>
                                <fo:list-item-body
                                        start-indent="body-start()">
                                    <fo:block text-align-last="justify">
                                        <fo:leader leader-pattern="dots"/>
                                        <fo:page-number-citation ref-id="{$country}"/>
                                    </fo:block>

<!--                                    Content of sections-->

                                    <fo:list-block>
                                        <xsl:for-each select="country/*">

                                            <xsl:if test="name(.) != 'name'">
                                                <fo:list-item>
                                                    <fo:list-item-label>
                                                        <fo:block>
                                                            <fo:basic-link internal-destination="{$country}-{name(.)}">
                                                                <xsl:value-of select="name(.)"/>
                                                            </fo:basic-link>
                                                        </fo:block>
                                                    </fo:list-item-label>
                                                    <fo:list-item-body start-indent="130pt">
                                                        <fo:block text-align-last="justify">
                                                            <fo:leader leader-pattern="dots"/>
                                                            <fo:page-number-citation ref-id="{$country}-{name(.)}"/>
                                                        </fo:block>
                                                    </fo:list-item-body>
                                                </fo:list-item>
                                            </xsl:if>
                                        </xsl:for-each>
                                     </fo:list-block>

                                </fo:list-item-body>
                            </fo:list-item>

                            <!--                            <fo:block font-size="18pt">-->
                            <!--                                <xsl:variable name="BlockId" select="country/name"/>-->
                            <!--                                <fo:basic-link internal-destination="{$BlockId}" color="blue">-->
                            <!--                                    <xsl:value-of select="country/name"/>-->
                            <!--                                </fo:basic-link>-->
                            <!--                            </fo:block>-->
                        </xsl:for-each>
                    </fo:list-block>


                </fo:flow>
            </fo:page-sequence>

            <xsl:for-each select="countries/*">
<!--                Generating each country's content-->
                <xsl:variable name="pageId" select="country/name"/>
                <fo:page-sequence master-reference="A4-portrait">
                    <fo:static-content flow-name="xsl-region-after">
                        <fo:block text-align="end">
                            Page
                            <fo:page-number/>
                            of
                            <fo:page-number-citation
                                    ref-id="TheVeryLastPage"/>
                        </fo:block>
                    </fo:static-content>

                    <fo:flow flow-name="xsl-region-body">
                        <xsl:variable name="country" select="country/name"/>

                        <fo:block>
                            <fo:external-graphic src="url('../countries-png/{$country}.png')"/>
                        </fo:block>

                        <fo:block font-size="24pt" font-weight="bold" id="{$country}">
                            <xsl:value-of select="country/name"/>
                        </fo:block>
                        <fo:block font-size="18pt" font-weight="bold" id="{$country}-introduction">
                            Introduction:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/introduction"/>
                        </fo:block>

                        <fo:block font-size="18pt" font-weight="bold" id="{$country}-geography">
                            Geography:
                        </fo:block>

                        <fo:block font-size="14pt" font-weight="bold" id="{$country}-location">
                            Location:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/geography/location"/>
                        </fo:block>

                        <fo:block font-size="14pt" font-weight="bold" id="{$country}-coordinates">
                            Coordinates:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/geography/coordinates"/>
                        </fo:block>

                        <fo:block font-size="14pt" font-weight="bold" id="{$country}-map">
                            Map-references:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/geography/map-references"/>
                        </fo:block>

                        <fo:block font-size="14pt" font-weight="bold" id="{$country}-area">
                            Area:
                        </fo:block>

                        <fo:block font-size="12pt" font-weight="bold" id="{$country}-total">
                            Total:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/geography/area/total"/>
                        </fo:block>

                        <fo:block font-size="12pt" font-weight="bold" id="{$country}-land">
                            Land:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/geography/area/land"/>
                        </fo:block>

                        <fo:block font-size="12pt" font-weight="bold" id="{$country}-water">
                            Water:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/geography/area/water"/>
                        </fo:block>


                        <fo:block font-size="14pt" font-weight="bold" id="{$country}-climate">
                            Climate:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/geography/climate"/>
                        </fo:block>

                        <fo:block font-size="18pt" font-weight="bold" id="{$country}-people">
                            People:
                        </fo:block>

                        <fo:block font-size="14pt" font-weight="bold" id="{$country}-population">
                            Population:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/people/population"/>
                        </fo:block>


                        <xsl:choose>
                            <xsl:when test="country/people/description =''"></xsl:when>
                            <xsl:otherwise>
                                <fo:block font-size="14pt" font-weight="bold" id="{$country}-description">
                                    Description:
                                </fo:block>
                                <fo:block>
                                    <xsl:value-of select="country/people/description"/>
                                </fo:block>
                            </xsl:otherwise>
                        </xsl:choose>

                        <fo:block font-size="18pt" font-weight="bold" id="{$country}-government">
                            Government:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/government"/>
                        </fo:block>

                        <fo:block font-size="18pt" font-weight="bold" id="{$country}-economy">
                            Economy:
                        </fo:block>
                        <fo:block>
                            <xsl:value-of select="country/economy"/>
                        </fo:block>

                    </fo:flow>
                </fo:page-sequence>
            </xsl:for-each>

            <fo:page-sequence master-reference="A4-portrait">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block id="TheVeryLastPage">
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
