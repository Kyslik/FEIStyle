# Changelog
 - 1.6.2 (2021.10.15)
   1. fix some typos
   2. fix bibliography invalid items (ISBN) and text formatting
   3. remove all Overleaf warnings by: A) package reordering; B) some parameter changes (glossary package)
   4. silence two warnings of sectsty.sty package (for now I don't see another solution)

 - 1.6.1 (2020.05.13)
   1. changed Study Field 'Informatics' to AIS version 'Computer Science'

 - 1.6 (2020.05.11)
   1. changed Study Field 'Applied Informatics' to 'Informatics'
   2. removed (commented out) Study Field Number

 - 1.5.3 (2019.04.19)
   1. added dissertation type of thesis
   2. fixed width of right column in abstract page
   3. use slovak lang in csquotes package as default

 - 1.5 (2017.03.10)
   1. improving grammar (english)
   2. changing keywords workflow (see example.tex)
   3. readme update
   4. make update
   5. replacing acronym package with glossary
   6. improving listings
   7. improving algorithms

 - 1.4 (2017.01.21)
   1. removed python script from `utils` since its not useful (misleads user to make ugly contents of medium)
   2. updated Makefile according to 1.
   3. introducing two commands `\dir{NAME}{DESCRIPTION}{SUB[DIR|FILE]}` and `\file{NAME}{DESCRIPTION}`, please see [`attachmentA.tex`](https://github.com/Kyslik/FEIStyle/blob/master/includes/attachmentA.tex)

 - 1.3 (2016.09.26)
   1. support for citation standard [ISO-690](https://github.com/michal-h21/biblatex-iso690) required by [STU FEI](http://www.fei.stuba.sk/sk/kniznica-fei/vzory-bibliografickych-odkazov-a-citovanie.html?page_id=1756), using biber
   2. support for acronym package
   3. removed FEIstyle.bst (not needed)
   4. minimize warnings caused by `\\`
   5. build using Makefile
   6. added seminar paper template (see `example_paper.tex|pdf`)
   7. python script (`utils/tree.py`) to auto-generate contents of medium (attachmentA.tex)

 - 1.2f (2016.05.16.zip)
   1. zmena číslovania strán (začínať majú od 1 pri úvode)
   2. odstránenie nepovinných vyhlásení a poďakovaní z default ukážky

 - 1.2e (2015.05.12.zip)
   1. zmena formulacie vyhlasenia o vypracovani prace
   2. odstranenie duplikacie bodky za menom veduceho prace

 - 1.2d (2015.05.04.zip)
   1. pridane odsadenie typu prace na titulnom liste a na obalke
   2. opravene viacriadkove zarovnanie nazvu prace v abstrakte
   3. zmena cislovania stran, pocitanie od titulneho listu

 - 1.2c (2014.07.22.zip)
   1. na titulnej strane opravena chyba 'Cslo' ---> 'Cislo'
   2. v anglickom abstrakte nazov temy slovensky zmeneny na anglicky
   3. uvodny cover a titulna strana zuzene o 0.19cm z kazdej strany, aby sa to voslo na tlaciaren

 - 1.2b (2014.05.05.zip)
   1. na bakalarske prace sa pouziva argument 'bp' a nie 'bc'
   2. v anglickej verzii zmeneny text nadpisu podakovania zo 'Sincere thanks' na 'Acknowledgments'
  
 - 1.2 (2014.04.11.zip)
   1. oprava textovych mutacii
   2. oprava drobnych chyb a formatovania
  
 - 1.0 (2014.02.22.zip)
