# FEIstyle
Upgraded FEIStyle ([original](http://www.uim.elf.stuba.sk/kaivt/Predmety/Sablony)):

 - support for citation standard [ISO-690](https://github.com/michal-h21/biblatex-iso690) required by [STU FEI](http://www.fei.stuba.sk/sk/kniznica-fei/vzory-bibliografickych-odkazov-a-citovanie.html?page_id=1756), using biber
 - support for acronym package
 - removed FEIstyle.bst (not needed)
 
>**note**: This FEIstyle supports **only UTF-8** encoding.

### Changelog

Changelog is located [here](https://github.com/Kyslik/FEIStyle/blob/master/CHANGELOG.md).

## Installation
 - Download all [files](https://github.com/Kyslik/FEIStyle/archive/master.zip) from repository, extract to desired folder and enjoy.
 
## Compile chain

>**note** In following subchapters `file` is your main `file.tex` (eg: `diploma.tex` in root folder)

### Manual

Following chain should output `file.pdf`

```
$ pdflatex file
$ biber file
$ pdflatex file
```

### Using *latexmk*
Runs necessary compile chain.

```
$ latexmk -pdf -bibtex -quiet file
```

Read more on how to be even more efficient with [latexmk && make](https://drewsilcock.co.uk/using-make-and-latexmk).

   
## Hints and trics

searchterms:

 - latexmk, CTAN, latex, tex, 
 
humas whom you can ask: 

 - [http://tex.stackexchange.com/](http://tex.stackexchange.com/)
 
editors and IDEs:

 - [http://tex.stackexchange.com/questions/339/latex-editors-ides](http://tex.stackexchange.com/questions/339/latex-editors-ides)
 
>Afraid of losing your work? Use GIT.
 
### Hints and trics for OS X

 - install [MacTex distribution](https://tug.org/mactex/) using [homebrew](http://brew.sh/index.html) (~2gb)

    ```
    $ brew cask install mactex
    ```

 - install [latexmk](https://www.ctan.org/pkg/latexmk/?lang=en) using homebrew
 
   ```
   $ brew install latexmk
   ```

# TODO

 - working example on [Sharelatex.com](https://www.sharelatex.com)

# Contribution

Any contributions are welcome!

