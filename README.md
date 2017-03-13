<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [FEIstyle](#feistyle)
    - [Changelog](#changelog)
- [Usage](#usage)
- [Compile chain](#compile-chain)
  - [Manual](#manual)
  - [Using *latexmk*](#using-latexmk)
  - [Using Makefile (uses *latexmk*)](#using-makefile-uses-latexmk)
  - [Sublime-text 3 project file](#sublime-text-3-project-file)
- [Hints and trics](#hints-and-trics)
  - [Installation on macOS](#installation-on-macos)
  - [Installation on Ubuntu / Fedora using eitl](#installation-on-ubuntu--fedora-using-eitl)
- [TODO](#todo)
- [Contribution](#contribution)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# FEIstyle
[![Latest Version](https://img.shields.io/github/release/Kyslik/FEIStyle.svg?style=flat-square)](https://github.com/Kyslik/column-sortable/releases)
[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](LICENSE.md)

Upgraded FEIStyle ([original](http://www.uim.elf.stuba.sk/kaivt/Predmety/Sablony)):

 - support for citation standard [ISO-690](https://github.com/michal-h21/biblatex-iso690) required by [STU FEI](http://www.fei.stuba.sk/sk/kniznica-fei/vzory-bibliografickych-odkazov-a-citovanie.html?page_id=1756), using biber
 - support for acronym package
 - removed FEIstyle.bst (not needed)
 - added Makefile
 - added seminar paper template (**example_paper.tex**) [example_paper.pdf](example_paper.pdf)
 - <strike>python script (utils/tree.py) to auto-generate contents of electronic medium (**attachmentA.tex**)</strike>
 - improved contents of electronic medium example, added 2 commands to make it easy to write [**attachmentA.tex**](https://github.com/Kyslik/FEIStyle/blob/master/includes/attachmentA.tex) like files
 
>**note**: FEIstyle supports **only UTF-8** encoding.

### Changelog

Changelog is located [here](CHANGELOG.md).

# Usage
 - Download all [files](https://github.com/Kyslik/FEIStyle/archive/master.zip) from repository, extract to desired folder and enjoy.

# Compile chain

>**Note**: in following subchapters `file` is your main `file.tex` (eg: `diploma.tex` in root folder)

## Manual

Following chain should output `file.pdf`

```
$ pdflatex file
$ biber file
$ glossary file
$ pdflatex file
```

## Using *latexmk*
>**Note**: see [Hints and Trics](https://github.com/Kyslik/FEIStyle#hints-and-trics) section to get information on how to install **letexmk**

Following command runs necessary compile chain.

```
$ latexmk -pdf -bibtex -quiet file
$ glossary file
$ latexmk -pdf -bibtex -quiet file
```

## Using Makefile (uses *latexmk*)

>**Note**: make sure to change filename in Makefile on line [#2](https://github.com/Kyslik/FEIStyle/blob/master/Makefile#L2)

Build in `.build` folder

```
$ make
```

Clean `.build` folder and delete PDF file in parent folder

```
$ make clean
```

Read more on how to be even more efficient with [latexmk && make](https://drewsilcock.co.uk/using-make-and-latexmk).

## Sublime-text 3 project file
Repository consits of ST3 project file which includes building your pdf using `SUPER+b`.

>**Note**: to enable building with shortcut `tools->Build System->FEI-LaTeX`
   
# Hints and trics
search terms:

 - latexmk, CTAN, latex, tex, make, Makefile
 
humas whom you can ask: 

 - [http://tex.stackexchange.com/](http://tex.stackexchange.com/)
 
editors and IDEs:

 - [http://tex.stackexchange.com/questions/339/latex-editors-ides](http://tex.stackexchange.com/questions/339/latex-editors-ides)
 
> Afraid of losing your work? Use GIT.
 
## Installation on macOS

 - install [MacTex distribution](https://tug.org/mactex/) using [homebrew](http://brew.sh/index.html) (~2gb)

    ```
    $ brew cask install mactex
    ```

 - install [latexmk](https://www.ctan.org/pkg/latexmk/?lang=en) using homebrew
 
   ```
   $ brew install latexmk
   ```

## Installation on Ubuntu / Fedora using eitl
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

 - [ ] <strike>working example on [Sharelatex.com](https://www.sharelatex.com)</strike>
   - Sharelatex does not support biblatex-iso690 at this time 
 - [ ] transform **tutorial.pdf** to wiki page
 - [ ] update readme to include usage for Windows OS users
 - [ ] update csquotes style to slovak after [this PR](https://github.com/josephwright/csquotes/pull/9) is merged, (perhaps in 2017)
 - [x] <strike>auto-generate contents of electronic medium</strike>
   - el. medium should be breif with explanation
 - [x] publish example of electronic medium

# Contribution

Any contributions are welcome!

