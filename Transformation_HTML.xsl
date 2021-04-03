<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/> <!--On signale que la sortie est en html-->
    <xsl:strip-space elements="*"/> <!-- pour éviter les espaces non voulus -->
    
    <xsl:template match="TEI">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select="//fileDesc/titleStmt//title[@type='main']"/>
                </title>
            </head>
            <body>
                <h1><xsl:value-of select="//body/div1/head"/></h1>
                <div>
                    <h2><xsl:value-of select="//div2/head"/></h2>
                    <xsl:apply-templates select="//body//p|//figure"/>
                </div>
            </body>
            
        </html>
    </xsl:template>
    <xsl:template match="p">
        <xsl:element name="p">        
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="figure">
        <xsl:element name="figure">
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="@facs"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="figcaption">
                <xsl:value-of select="./figDesc/text()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>