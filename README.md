# FEIstyle
Upgraded FEIStyle ([original](http://www.uim.elf.stuba.sk/kaivt/Predmety/Sablony)):

 - support for citation standard [ISO-690](https://github.com/michal-h21/biblatex-iso690) required by [STU FEI](http://www.fei.stuba.sk/sk/kniznica-fei/vzory-bibliografickych-odkazov-a-citovanie.html?page_id=1756), using biber
 - support for acronym package
 - removed FEIstyle.bst (not needed)
 
>**note**: This FEIstyle supports **only UTF-8** encoding.

### Changelog

Changelog is located [here](https://github.com/Kyslik/FEIStyle/blob/master/CHANGELOG.md).

# Installation
 - Download all [files](https://github.com/Kyslik/FEIStyle/archive/master.zip) from repository, extract to desired folder and enjoy.
 
# Compile chain

>**Note**: in following subchapters `file` is your main `file.tex` (eg: `diploma.tex` in root folder)

## Manual

Following chain should output `file.pdf`

```
$ pdflatex file
$ biber file
$ pdflatex file
```

## Using *latexmk*
>**Note**: see [Hints and Trics](https://github.com/Kyslik/FEIStyle#hints-and-trics) section to get information on how to install **letexmk**

Following command runs necessary compile chain.

```
$ latexmk -pdf -bibtex -quiet file
```

## Using Makefile (uses latexmk)
>**Note**: make sure to change filename in Makefile on line #2

Build in `.build` folder

```
$ make
```

Clean `.build` folder and delete PDF file in parent folder

```
$ make clean
```

Read more on how to be even more efficient with [latexmk && make](https://drewsilcock.co.uk/using-make-and-latexmk).

   
# Hints and trics

searchterms:

 - latexmk, CTAN, latex, tex, 
 
humas whom you can ask: 

 - [http://tex.stackexchange.com/](http://tex.stackexchange.com/)
 
editors and IDEs:

 - [http://tex.stackexchange.com/questions/339/latex-editors-ides](http://tex.stackexchange.com/questions/339/latex-editors-ides)
 
>Afraid of losing your work? Use GIT.
 
## Installation on macOS

 - install [MacTex distribution](https://tug.org/mactex/) using [homebrew](http://brew.sh/index.html) (~2gb)

    ```
    $ brew cask install mactex
    ```

 - install [latexmk](https://www.ctan.org/pkg/latexmk/?lang=en) using homebrew
 
   ```
   $ brew install latexmk
   ```

## Installation on Ubuntu/Fedora using eitl
>**note**: biblatex-iso690 is included in 2016 build of texlive

Do following steps only if you have texlive 2015 or less

 - download install script
  
   ```
   $ wget http://mirrors.ctan.org/support/texlive/eitl.zip
   ```
 
 - unzip
   
   ```
   $ unzip eitl.zip && cd eitl
   ```

 - install TexLive
 
   ```
   $ ./eitl /usr/share/texlive
   ```

# TODO

 - working example on [Sharelatex.com](https://www.sharelatex.com)

# Contribution

Any contributions are welcome!

