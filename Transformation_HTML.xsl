<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html" indent="yes" encoding="UTF-8"/> <!--On signale que la sortie est en html-->
    <xsl:strip-space elements="*"/> <!-- pour éviter les espaces non voulus -->

    <xsl:template match="/">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>
        
        <!--Création des différents chemins du site-->
        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($witfile,'accueil','.html')"/>
        </xsl:variable>      
        <xsl:variable name="pathIndex">
            <xsl:value-of select="concat($witfile,'index','.html')"/>
        </xsl:variable>
        <xsl:variable name="pathRoman">
                <xsl:value-of select="concat($witfile,'roman', '.html')"/>
            
        </xsl:variable>
        
        
        <!--Création du head commun à toutes les pages du site-->
        <xsl:variable name="titre1" select="//fileDesc/titleStmt//title[@type='main']"/>
        <xsl:variable name="titre2" select="//fileDesc/titleStmt//title[@type='sub']"/>
        <xsl:variable name="head">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <title>
                    <xsl:value-of select="$titre1"/>
                </title>
            </head>
        </xsl:variable>
        <xsl:result-document href="{$pathAccueil}"
            method="html" indent="yes">
            <html>
                <xsl:value-of select="$head"/>
                <body>
                    <h1><xsl:value-of select="$titre1"/></h1>
                    <h2><xsl:value-of select="$titre2"/></h2>
                    <span>
                        <a href="{//distributor/@facs}">[lien vers la version imprimée Gallica]</a>
                    </span>
                    <ul>
                        <li><a href="{$pathIndex}">Index des noms de personnages</a></li>
                        <li><a href="{$pathRoman}">Édition numérique de Jean Bart et Louis XIV</a></li>
                    </ul>
                </body>
            </html>
        </xsl:result-document>
     <xsl:result-document href="{$pathRoman}"
                method="html" indent="yes">
                <html>
                    <xsl:value-of select="$head"/>
                    <body>
                        <h1><xsl:value-of select="$titre1"/></h1>
                        <h2><xsl:value-of select="$titre2"/></h2>
                        <div>
                            <a href="{//distributor/@facs}">lien vers le manuscrit</a>
                        </div>
                        <div>
                            <a href="{$pathAccueil}">Retour accueil</a>
                        </div>
                        <div align="center">
                            <xsl:apply-templates select="//div3/node() except //note/p"/>
                        </div>
                        <div>
                            <h4>Notes</h4>
                            <xsl:apply-templates select="//note/p"/>
                        </div>
                        <div>
                            <h4>Index de personnes</h4>
                            <xsl:call-template name="personnes"/>
                        </div>
                        <div>
                            <h4>Index de lieux</h4>
                            <xsl:call-template name="lieux"/>
                        </div>
                    </body>
                </html>
        </xsl:result-document>
    </xsl:template>
    
    
    <!--Affichage des titres de la structure globale du texte:
    titres de chapitres et livres, paragraphes structurés, images et notes-->
    <xsl:template match="div1/head">
        <h1><xsl:value-of select="."/></h1>
    </xsl:template>
    <xsl:template match="div2/head">
        <h2><xsl:value-of select="."/></h2>
    </xsl:template>
    
   <!--REGLE D'AFFICHAGE DU TEXTE-->
    <xsl:template match="div3">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="p">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!--REGLE D'AFFICHAGE DES IMAGES-->
    <xsl:template match="figure">
        <xsl:element name="figure">
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="@facs"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="figcaption">
                <xsl:apply-templates select="./figDesc/text()"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!--REGLES DES NOTES-->
    <xsl:template match="note">
        <!--Règle permettant d'afficher les exposants correspondants à chaque note dans le texte-->
        <xsl:element name="sup">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <!--l'attribut href permet de lier l'exposant à une note située plus bas-->
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="@n"/>
                </xsl:attribute>
                <xsl:value-of select="@n"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="note/p">
        <!--Règle permettant d'afficher le texte des notes de bas de page-->
        <xsl:element name="p">
            <xsl:attribute name="id">
                <!--l'attribut id permet de lier la note à son exposant dans le texte via son attribut href-->
                <xsl:value-of select="ancestor::note/@n"/>
            </xsl:attribute>
            <xsl:value-of select="ancestor::note/@n"/>
            <xsl:text>. </xsl:text>
            <xsl:apply-templates/>
        </xsl:element>        
    </xsl:template>
    
    <!--REGLES DES INDEX-->
    <xsl:template name="personnes">
        <!--Règle permettant la création et l'affichage d'un index de personnes-->
        <xsl:for-each select="//particDesc//person/persName">
            <xsl:sort select="./surname" order="ascending"/>
            <xsl:element name="p">
                <xsl:choose>
                    <xsl:when test="./forename">            
                            <xsl:value-of select="./forename"/>&#160;<xsl:value-of select="./surname"/>
                            <xsl:choose>
                                <xsl:when test="./roleName">
                                    &#160;<xsl:value-of select="./roleName"/>
                                </xsl:when>
                            </xsl:choose>                       
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="."/>      
                    </xsl:otherwise>
                </xsl:choose>
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text>:</xsl:text>
                <xsl:for-each-group select="ancestor::TEI//body//persName[replace(@ref, '#','')=$idPerson]" group-by="ancestor::div3">
                    <xsl:value-of select="ancestor::div3/@n"/> 
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if>
                </xsl:for-each-group>
                <xsl:if test="parent::person//note">
                    <xsl:element name="p">
                        <xsl:value-of select="parent::person//note"/>                       
                    </xsl:element>
                </xsl:if>           
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="lieux">
        <!--Règle permettant la création et l'affichage d'un index de personnes-->
        <xsl:for-each select="//listPlace/place">
            <xsl:sort select="./placeName" order="ascending"/>
            <xsl:element name="p">
                <xsl:value-of select="./placeName"/>
                <xsl:if test="./district">
                    , &#160;<xsl:value-of select="./district"/>
                </xsl:if>
                <xsl:if test="./settlement">
                , &#160;<xsl:value-of select="./settlement"/>
                </xsl:if>
                <xsl:variable name="idPlace">
                    <xsl:value-of select="@xml:id"/>
                </xsl:variable>
                <xsl:text>:</xsl:text>
                <xsl:for-each-group select="ancestor::TEI//body//placeName[replace(@ref, '#','')=$idPlace]" group-by="ancestor::div3">
                    <xsl:value-of select="ancestor::div3/@n"/> 
                    <xsl:if test="position()!= last()">, </xsl:if>
                    <xsl:if test="position() = last()">.</xsl:if>
                </xsl:for-each-group>
                <xsl:if test="parent::place/note">
                    <xsl:element name="p">
                        <xsl:value-of select="parent::place/note"/>                       
                    </xsl:element>
                </xsl:if>           
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>