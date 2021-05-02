# Devoir de XML-TEI et XSLT

Projet d'encodage et de transformation d'un extrait de <i>Jean Bart et Louis XIV</i> d'Eugène Sue, réalisé dans le cadre des modules de XML-TEI et XSLT du Master 2 Techonologies numériques appliquées à l'Histoire de l'École nationale des Chartes, enseignés par Mme Pinche.

## Présentation
Cette édition partielle de roman a été réalisée en suivant les TEI guidelines, établies par le Consortium du même nom. Ces principes d'encodage communs, dans un langage XML, permettent de garantir la pérennité, l'interopérabilité et les possibilités de transformation des données.<br/>
Le texte utilisé lors de ce projet provient de [Gallica](https://gallica.bnf.fr/ark:/12148/bpt6k6365618w/). Après avoir été océsiré dans le but d'en obtenir une version texte, on a encodé sa structure et ses métadonnées, puis on a réalisé l'encodage et l'indexation des personnages et lieux mentionnés. Enfin, un ODD, présentant le projet, les choix d'encodages faits et les possibilités d'exploitation du fichier a été réalisé. Ce document permet également de forcer l'encodage le plus précisemment possible.

## Structure du dépôt
```
├── ODD
│     ├── out
|     |    └─ ODD.rng
│     ├─ ODD.xml
│     └─ ODD.html
|
├── images
|     ├─ image1.png
│     └─ image2.png
|
├── Eugene_SueTEIpage_html
│     ├─ accueil.html
│     ├─ bibliographie.html
│     ├─ images.html
│     ├─ indexLieu.html
│     ├─ indexPerson.html
│     └─ roman.html
|
├─ Eugene_SueTEI.xml
├─ Transformation_HTML.xsl
└─ README.md
```

## Crédits
Ce dépôt a été réalisé par [Juliette Janes](juliette.janes@chartes.psl.eu), étudiante en Master 2 Technologies numériques appliquées à l'Histoire à l'École nationale des Chartes (promotion 2021).


## Licence
![68747470733a2f2f692e6372656174697665636f6d6d6f6e732e6f72672f6c2f62792f322e302f38387833312e706e67](https://user-images.githubusercontent.com/56683417/115525743-a78d2400-a28f-11eb-8e45-4b6e3265a527.png)

