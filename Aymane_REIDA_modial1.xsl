<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" indent="yes"/>
    <xsl:template match="/">
        
        [
        <xsl:for-each select="//mondial/country">
            {
            "pays" : "<xsl:value-of select="name[1]"/>",
           "capital" : "<xsl:value-of select="@capital"/>",
            "population" : "<xsl:value-of select="population[last()]"/>",
           "superficie" : "<xsl:value-of select="@area"/>",
            "religions" : {
               <xsl:for-each select="religion">
                   "<xsl:value-of select="."/>" :"<xsl:value-of select="@percentage"/>"
                   <xsl:choose>
                       <xsl:when test="position() = last()"></xsl:when>
                       <xsl:otherwise><xsl:text>,</xsl:text></xsl:otherwise>
                   </xsl:choose>
               </xsl:for-each>
            },
            <xsl:text>"ville" : {</xsl:text>
            <xsl:for-each select="city">
                "<xsl:value-of select="name[1]"/>"
                <xsl:choose>
                    <xsl:when test="position() = last()"></xsl:when>
                    <xsl:otherwise><xsl:text>,</xsl:text></xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            },
            "frontières" : {
            <xsl:for-each select="border">
                "<xsl:value-of select="@country"/>"
                <xsl:choose>
                    <xsl:when test="position() = last()"></xsl:when>
                    <xsl:otherwise><xsl:text>,</xsl:text></xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            }
            }
            <xsl:choose>
                <xsl:when test="position() = last()"></xsl:when>
                <xsl:otherwise><xsl:text>,</xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        ]
    </xsl:template>
</xsl:stylesheet>