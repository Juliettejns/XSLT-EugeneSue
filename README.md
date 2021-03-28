# Devoir de XML-TEI et XSLT

Projet d'encodage et de transformation d'un extrait de <i>Jean Bart et Louis XIV</i> d'Eugène Sue, réalisé dans le cadre des modules de XML-TEI et XSLT du Master 2 Techonologies numériques appliquées à l'Histoire de l'École nationale des Chartes, enseignés par Mme Pinche.

## Présentation
Cette édition partielle de roman a été réalisée en suivant les TEI guidelines, établies par le Consortium du même nom. Ces principes d'encodage communs, dans un langage XML, permettent de garantir la pérennité, l'interopérabilité et les possibilités de transformation des données.<br/>
Le texte utilisé lors de ce projet provient de [Gallica](https://gallica.bnf.fr/ark:/12148/bpt6k6365618w/). Après avoir été océsiré dans le but d'en obtenir une version texte, on a encodé sa structure et ses métadonnées, puis on a réalisé l'encodage et l'indexation des personnages et lieux mentionnés. Enfin, un ODD, présentant le projet, les choix d'encodages faits et les possibilités d'exploitation du fichier a été réalisé. Ce document permet également de forcer l'encodage le plus précisemment possible.

## Structure du dépôt
- Eugene_Sue_TEI.xml: le fichier d'encodage TEI
- Transformation_HTML.xsl : feuille de transformation permettant d'obtenir une version html du projet
- images: 
     - image1.JPEG
     - image2.JPEG
- ODD: 
     - ODD.xml: ODD du projet
     - ODD.html: verson html de l'ODD
     - out:
         ODD.rng: schéma rng  
