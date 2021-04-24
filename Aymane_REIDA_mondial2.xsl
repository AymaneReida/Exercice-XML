<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/"> 
        <mondial>
        <xsl:for-each select="//mondial/country">
            <country>
                <pays> <xsl:value-of select="name[1]"/> </pays>
                <capital> <xsl:value-of select="@capital"/> </capital>
                <population> <xsl:value-of select="population[last()]"/> </population>
                <superficie> <xsl:value-of select="@area"/> </superficie>
                <religions>
                <xsl:for-each select="religion">
                    <xsl:variable name="cls" select="@percentage"/>
                    <religion pourcentage="{$cls}"> <h3> <xsl:value-of select="."/> </h3> </religion>
                </xsl:for-each>
                </religions>
                <villes>
                <xsl:for-each select="city">
                    <ville> <xsl:value-of select="name[1]"/> </ville>
                </xsl:for-each>
                </villes>
                <frontières>
                <xsl:for-each select="border">
                    <frontière> <xsl:value-of select="@country"/> </frontière>
                </xsl:for-each>
                </frontières>
            </country>
        </xsl:for-each>  
        </mondial>
    </xsl:template> 
</xsl:stylesheet> 
