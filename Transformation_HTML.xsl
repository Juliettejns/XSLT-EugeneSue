<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs tei"
    version="2.0">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
    <!--On signale que la sortie est en html-->
    <xsl:strip-space elements="*"/>
    <!-- pour éviter les espaces non voulus -->


    <xsl:template match="/">
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
            <!-- récupération du nom et du chemin du fichier courant -->
        </xsl:variable>

        <!--CREATION DES VARIABLES CONTENANT LES CHEMINS DE CHAQUE PAGE HTML-->
        <xsl:variable name="pathAccueil">
            <xsl:value-of select="concat($witfile, 'pages_html/accueil', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathBibliographie">
            <xsl:value-of select="concat($witfile, 'pages_html/bibliographie', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathRoman">
            <xsl:value-of select="concat($witfile, 'pages_html/roman', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexPersonnes">
            <xsl:value-of select="concat($witfile, 'pages_html/indexPersonne', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexLieux">
            <xsl:value-of select="concat($witfile, 'pages_html/indexLieu', '.html')"/>
        </xsl:variable>
        <xsl:variable name="pathImages">
            <xsl:value-of select="concat($witfile, 'pages_html/images', '.html')"/>
        </xsl:variable>


        <!--CREATION DES VARIABLES RAPPELEES FREQUEMMENT-->
        <!--Création du head commun à toutes les pages du site et des variables pour appeler les titres-->
        <xsl:variable name="titre1" select="//fileDesc/titleStmt//title[@type = 'main']"/>
        <xsl:variable name="titre2" select="//fileDesc/titleStmt//title[@type = 'sub']"/>
        <xsl:variable name="head">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <title>
                    <xsl:value-of select="$titre1"/>
                </title>
            </head>
        </xsl:variable>

        <!--Création de la barre de navigation permettant de circuler dans le site-->
        <xsl:variable name="navbar">
            <nav class="navbar navbar-dark navbar-expand-md justify-content-between"
                style="background-color: #85C1E9; font-family:Times New Roman;font-size:14pt">
                <a class="navbar-brand" href="{$pathAccueil}">Accueil</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"/>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="{$pathBibliographie}">Source bibliographique</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$pathRoman}">Roman</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                >Index</a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="{$pathIndexPersonnes}">Personnes</a>
                                <a class="dropdown-item" href="{$pathIndexLieux}">Lieux</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{$pathImages}">Galerie des Images</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </xsl:variable>

        <!--Création d'un footer-->
        <xsl:variable name="footer">
            <footer class="blog-footer">
                <div class="container" style="padding:1em;text-align:right">
                    <p>© Juliette Janes - 2021</p>
                </div>
            </footer>
        </xsl:variable>
       
        <!--PAGE d'ACCUEIL-->
        <xsl:result-document href="{$pathAccueil}" method="html" indent="yes">
            <html>
                <!--récupération du head-->
                <xsl:copy-of select="$head"/>
                <body>
                    <!--récupération de la barre de navigation-->
                    <xsl:copy-of select="$navbar"/>
                    <div class="offset-md-2 col-md-8" style="margin-top:50px">
                        <div class="blocks">
                            <!--Ajout de l'image d'entête de début du livre-->
                            <center>
                                <img src="../images/image1.JPEG" width="500"/>
                            </center>
                        </div>

                        <h1 align="center">Édition numérique de <xsl:value-of select="$titre1"/>,
                                <xsl:value-of select="$titre2"/></h1>

                        <div class="offset-md-2 col-md-8" style="margin-top:50px;text-align:center">
                            <p>Bienvenue sur le site de l'édition numérique de <xsl:value-of
                                    select="$titre1"/>, roman d'Eugène Sue. Les pages présentées
                                sont issues d'un exemplaire de la <xsl:value-of
                                    select=".//sourceDesc//distributor"/> disponible sur <a
                                    href="{//distributor/@facs}">Gallica</a>.</p>
                            <p>Ce projet a été réalisé par <a href="http://github.com/Juliettejns"
                                    >Juliette Janes</a>, promo 2021 du master 2 Technologies
                                numériques de l'École nationale des Chartes, dans le cadre des
                                enseignements de XML-TEI et XSLT. L'encodage, le guide d'encodage et
                                la feuille de transformation XSL utilisés sont disponibles sur son
                                    <a href="http://github.com/Juliettejns/XSLT-EugeneSue"
                                    >github</a>.</p>

                        </div>
                    </div>
                    <!--utilitaires bootstrap-->
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
        
        <!--PAGE DE PRESENTATION DU ROMAN-->
        <xsl:result-document href="{$pathBibliographie}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row text-justify" style="margin:50px;align='center'">
                            <div class="offset-md-2 col-md-8">
                            <h1>
                                Informations bibliographiques
                            </h1>
                                <ul>                                   
                                    <li>Titre:&#160;<xsl:value-of select="//title[@type='main']"/></li>
                                    <li>Sous-titre:&#160;<xsl:value-of select="//title[@type='sub']"/></li>
                                    <li>Sous-sous-titre:&#160;<xsl:value-of select="//title[@type='m']"/></li>
                                    <li>Auteur:&#160;<xsl:value-of select="//author[@resp='main']/forename"/>&#160;<xsl:value-of select="//author[@resp='main']/roleName"/>&#160;<xsl:value-of select="//author[@resp='main']/surname"/></li>
                                    <li>Dessinateur:&#160;<xsl:value-of select="//author[@resp='contributor']/forename"/>&#160;<xsl:value-of select="//author[@resp='contributor']/surname"/></li>
                                    <li>Editeur:&#160;<xsl:value-of select="//publisher"/></li>
                                    <li>Date et Lieu de Publication:&#160;<xsl:value-of select="/publicationStmt/date"/>,&#160;<xsl:value-of select="//pubPlace"/></li>
                                    <li>Emplacement de l'ouvrage:&#160;<xsl:value-of select="//distributor"/></li>   
                                </ul>
                            </div>
                        </div>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>                    
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>-->

        <!--PAGE D'AFFICHAGE DU TEXTE ET DE SES NOTES-->
        <xsl:result-document href="{$pathRoman}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>                      
                        <div class="container">
                            <div class="row text-justify" style="margin:50px;align='center'">
                                <div class="offset-md-2 col-md-8">
                                    <!--Affichage des titres de livre et chapitre-->
                                    <h3><xsl:value-of select="//body/div1/head"/></h3>
                                    <h4><xsl:value-of select="//body//div2/head"/></h4>
                                    <!--Affichage du texte par page sans les notes-->
                                    <xsl:apply-templates select="//div3 except //note/p"/>                        
                                </div>
                            </div>
                            <div class="row" style="margin:50px">
                            <h4>Notes</h4>
                                <div>
                                    <!--Affichage des notes-->
                                    <xsl:apply-templates select="//note/p"/>                                                    
                                </div>
                            </div>
                        </div>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>

        <!--PAGE INDEX DES PERSONNES-->
        <xsl:result-document href="{$pathIndexPersonnes}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row" style="margin:50px">                           
                            <div class="offset-md-2 col-md-8">
                                <h1>Index de Personnes</h1>
                                <div>
                                    <!--Appelle de la template personnes-->
                                    <xsl:call-template name="personnes"/>                            
                                </div>
                            </div>
                        </div>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
            </html>
        </xsl:result-document>

        <!--PAGE INDEX DE LIEUX-->
        <xsl:result-document href="{$pathIndexLieux}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row" style="margin:50px">                           
                            <div class="offset-md-2 col-md-8">
                                <h1>Index de Personnes</h1>
                                <div>
                                    <!--Appel de la template lieux-->
                                    <xsl:call-template name="lieux"/>                            
                                </div>
                            </div>
                        </div>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
            </html>
        </xsl:result-document>

        <!--PAGE PRESENTANT LES IMAGES CONTENANT DANS LE ROMAN-->
        <xsl:result-document href="{$pathImages}" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="container">
                        <div class="row" style="margin:50px">                           
                            <div class="offset-md-2 col-md-8">
                                <h1>Galerie des Illustrations</h1>
                                <br/>
                                <div align="center">
                                    <xsl:apply-templates select="//figure"/>                            
                                </div>
                            </div>
                        </div>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"/>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"/>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>


    <!--TEMPLATES-->

    <!--REGLE D'AFFICHAGE DU TEXTE PAR PAGE-->
    <xsl:template match="div3">
        <!-- J'insère chaque page dans un div afin d'avoir une vue d'ensemble 
            pour construire mon index. Cependant, par un souci d'ergonomie, il est 
            plus intéressant de garder les deux div sur la même page HTML, plutôt 
            que de changer de page-->
        <hr/>
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="@n"/>
            </xsl:attribute>
            <!--Affichage du numéro de page-->
            <xsl:text>[</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>]</xsl:text>
            <!--on applique toutes les templates dans la page sauf figure-->
            <xsl:apply-templates select="* except //figure"/>
        </xsl:element>
    </xsl:template>
    
    <!--Affichage des paragraphes-->
    <xsl:template match="p">
        <xsl:element name="p">
                <xsl:apply-templates/>
            </xsl:element>
    </xsl:template>

    <!--REGLE D'AFFICHAGE DES IMAGES-->
   <xsl:template match="figure">
        <xsl:element name="figure">
            <xsl:element name="img"> 
                <!--Récupération du chemin de l'image dans le git-->
                <xsl:attribute name="src">
                    <!--Le dossier images n'étant pas au même niveau pour les pages html et le fichier tei, j'ajoute un ../ afin d'y accéder-->
                    <xsl:text>../</xsl:text><xsl:value-of select="@facs"/>
                </xsl:attribute>
                <!--On réduit un peu les images car étant trop grandes-->
                <xsl:attribute name="width">
                    <xsl:text>300</xsl:text>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="figcaption">
                <!--On récupère le nom de l'image-->
                <xsl:apply-templates select="./head"/><br/>
                <!--Et son emplacement-->
                Emplacement: <xsl:value-of select="@type"/> de la page <xsl:value-of select="ancestor::div3/@n"/>,&#160;Chapitre <xsl:value-of select="ancestor::div2/@n"/>
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
        <xsl:element name="ul">
            <!--Règle permettant la création et l'affichage d'un index de personnes-->
            <!--Pour chaque persName, on reproduit les actions suivantes-->
            <xsl:for-each select="//particDesc//person/persName">
                <!--on trie les différents personnages dans l'ordre alphabétique-->
                <xsl:sort select="./surname" order="ascending"/>
                <!--Chaque personne est affichée dans un li, permettant de réaliser une liste-->
                <xsl:element name="li">
                    <!--On créé un attribut id, afin de pouvoir faire des renvois depuis le texte vers les descriptions dans l'index de personnages-->
                    <xsl:attribute name="id">
                        <!--On récupère l'xml:id situé dans le person au niveau supérieur-->
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:attribute>
                    <!--l'élément b permet de mettre en gras le nom de chaque personne-->
                    <xsl:element name="b">
                        <!--Si le nom du personnage est divisé en forename, surname, on récupère ces éléments, auquel cas, on vérifie si un roleName 
                            existe et si oui, on le récupère. Autrement on récupère directement le texte situé dans le persName-->
                        <xsl:choose>
                            <xsl:when test="./forename">
                                <xsl:value-of select="./forename"/>&#160;<xsl:value-of
                                    select="./surname"/>
                                <xsl:choose>
                                    <xsl:when test="./roleName"> ,&#160;<xsl:value-of
                                            select="./roleName"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="."/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:element>
                    <!--On créé une variable contenant le xml:id de la personne-->
                    <xsl:variable name="idPerson">
                        <xsl:value-of select="parent::person/@xml:id"/>
                    </xsl:variable>
                    <xsl:text>:&#160;</xsl:text>
                    <!--Pour chaque persName situé dans le texte (groupé par page), on compare son attribut ref à la variable idPerson. Auquel cas, on récupère le
                        numéro de la page où il se situe.-->                        
                    <xsl:for-each-group
                        select="ancestor::TEI//body//persName[replace(@ref, '#', '') = $idPerson]"
                        group-by="ancestor::div3">
                        <xsl:value-of select="ancestor::div3/@n"/>
                        <xsl:if test="position() != last()">, </xsl:if>
                        <xsl:if test="position() = last()">.</xsl:if>
                    </xsl:for-each-group>
                    <!--On affiche la description du personnage-->
                    <xsl:if test="parent::person//note">
                        <xsl:element name="p">
                            <xsl:value-of select="parent::person//note"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="lieux">
        <xsl:element name="ul">
            <!--Règle permettant la création et l'affichage d'un index de personnes-->
            <xsl:for-each select="//listPlace/place">
                <!--On trie les lieux par ordre alphabétique-->
                <xsl:sort select="./placeName" order="ascending"/>
                <xsl:element name="li">
                    <!--Chaque personne est contenue dans une balise li afin d'obtenir une liste-->
                    <xsl:attribute name="id">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:attribute>
                    <xsl:element name="b">                       
                            <xsl:value-of select="./placeName"/>
                    </xsl:element>
                    <!--Si l'emplacement du lieu est mentionné, on l'ajoute-->
                    <xsl:if test="./district"> , &#160;<xsl:value-of select="./district"/>
                    </xsl:if>
                    <xsl:if test="./settlement"> , &#160;<xsl:value-of select="./settlement"/>
                    </xsl:if>
                    <!--Création d'une variable contenant l'xml:id du lieu-->
                    <xsl:variable name="idPlace">
                        <xsl:value-of select="@xml:id"/>
                    </xsl:variable>
                    <xsl:text>:&#160;</xsl:text>
                    <!--Pour chaque placeName contenu dans le texte, groupé par page, on compare l'attribut ref à la variable idPlace
                        et on affiche le numéro de page correspondant-->
                    <xsl:for-each-group
                        select="ancestor::TEI//body//placeName[replace(@ref, '#', '') = $idPlace]"
                        group-by="ancestor::div3">
                        <xsl:value-of select="ancestor::div3/@n"/>
                        <xsl:if test="position() != last()">, </xsl:if>
                        <xsl:if test="position() = last()">.</xsl:if>
                    </xsl:for-each-group>
                    <!--Si il y a une description du lieu, on l'ajoute à la suite-->
                    <xsl:if test="parent::place/note">
                        <xsl:element name="p">
                            <xsl:value-of select="parent::place/note"/>
                        </xsl:element>
                    </xsl:if>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template match="body//persName[@ref]">
        <!--Structuration du persName situé dans le texte afin de renvoyer à sa description dans l'index de Personnes-->
        <!--Récupération du chemin-->
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexPersonnes">
            <xsl:value-of select="concat($witfile, 'pages_html/indexPersonne', '.html')"/>
        </xsl:variable>
        <!--Création d'une balise a avec un attribut href contenant: url de l'index de personnes#nom de la personne-->
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:copy-of select="$pathIndexPersonnes"/><xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="body//placeName[@ref]">
        <!--Structuration du placeName situé dans le texte afin de renvoyer à sa description dans l'index de Lieux-->
        <!--Récupération du chemin-->
        <xsl:variable name="witfile">
            <xsl:value-of select="replace(base-uri(.), '.xml', '')"/>
        </xsl:variable>
        <xsl:variable name="pathIndexPersonnes">
            <xsl:value-of select="concat($witfile, 'pages_html/indexLieu', '.html')"/>
        </xsl:variable>
        <!--Création d'une balise a avec un attribut href contenant: url de l'index de lieux # nom du lieu-->
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:copy-of select="$pathIndexPersonnes"/><xsl:value-of select="@ref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>

