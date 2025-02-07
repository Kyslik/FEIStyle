\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FEIstyle}[2025/02/07 v. 2.0.1 Thesis template - FEI STUBA]

% parse arguments
\DeclareOption{dizp}{\def\typPraceSkr{dizp}
    \def\isThesis{1}
    \def\typPraceEn{Dissertation}
    \def\typPrace{Dizerta\v{c}n\a'a pr\a'aca}
    \def\typPraceTemp{dizerta\v{c}n\'{u} pr\'{a}cu}
    \def\typPraceTempII{dizerta\v{c}nej pr\'{a}ce}}
\DeclareOption{dp}{\def\typPraceSkr{d}
    \def\isThesis{1}
    \def\typPraceEn{Master's thesis}
    \def\typPrace{Diplomov\a'a pr\a'aca}
    \def\typPraceTemp{diplomov\'{u} pr\'{a}cu}
    \def\typPraceTempII{diplomovej pr\'{a}ce}}
\DeclareOption{bp}{\def\typPraceSkr{b}
    \def\isThesis{1}
    \def\typPraceEn{Bachelor's thesis}
    \def\typPrace{Bakal\a'arska pr\a'aca}
    \def\typPraceTemp{bakal\'{a}rsku pr\'{a}cu}
    \def\typPraceTempII{bakal\'{a}rskej pr\'{a}ce}}
\DeclareOption{sp}{\def\typPraceSkr{s}}
    \def\isThesis{0}
    \def\typPraceEn{Seminar paper}
    \def\typPrace{Semin\a'arna pr\a'aca}
    \def\typPraceTemp{semin\'{a}rnu pr\'{a}cu}
    \def\typPraceTempII{semin\'{a}rnej práce}

\newcommand*\myset{a4paper,12pt}
\newcommand*\parentclass{article}

\DeclareOption{article}{
    \renewcommand*\myset{a4paper,12pt}
    \renewcommand*\parentclass{article}
}
\DeclareOption{book}{
    \renewcommand*\myset{a4paper,12pt}
    \renewcommand*\parentclass{book}
}

\def\FEIenglish{0}
\DeclareOption{en}{
    \def\FEIenglish{1} 
}

\ProcessOptions
\ExecuteOptions{dp}
\LoadClass[\myset]{\parentclass}

\usepackage[overload]{textcase}

% hyperref has to be loaded *before* glossaries
% see https://mirror.kumi.systems/ctan/macros/latex/contrib/glossaries/glossaries-user.html#sec:hyperref
\usepackage[bookmarksopen,colorlinks,plainpages=false,urlcolor=blue,hypertexnames=false,unicode]{hyperref}

\usepackage[acronym,nopostdot,nogroupskip,nonumberlist]{glossaries}

\usepackage[final, babel, nopatch=item]{microtype}
\usepackage[utf8]{inputenc}
% we should use ISO 690 & 690-2 http://www.fei.stuba.sk/sk/kniznica-fei/vzory-bibliografickych-odkazov-a-citovanie.html?page_id=1756 
% package for biblatex https://github.com/michal-h21/biblatex-iso690
\usepackage[backend=biber,
            sorting=none,
            style=iso-numeric,
            shortnumeration=true,
            citestyle=numeric-comp,
            maxnames=5,
            minnames=1,
            giveninits=true]{biblatex}
\DefineBibliographyStrings{slovak}{
  urlfrom = {Dostupné z}
}

\ifnum\FEIenglish=0
    \usepackage[english,main=slovak]{babel}
\else
    \usepackage[main=english, slovak]{babel}
\fi
\languageattribute{slovak}{split}

\usepackage[style=slovak]{csquotes}
\usepackage[T1]{fontenc}

\usepackage[immediate]{silence}
\WarningFilter[temp]{latex}{Command}
% silence warnings of sectsty/sectsty.sty:
%     'Command \underbar has changed.'
%     'Command \underline has changed.'

\usepackage{sectsty}
\DeactivateWarningFilters[temp]

\usepackage{chngcntr}
\usepackage{tocloft}
\usepackage{rotating}
\usepackage[a4paper, tmargin=3cm,bmargin=3cm,lmargin=2.75cm,rmargin=2.75cm]{geometry}
\usepackage{xifthen}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{upgreek}
\usepackage{isomath}
\usepackage{ifmtarg}
\usepackage{xstring}
\usepackage[compact]{titlesec}
\usepackage{xcolor}
\usepackage{listings}
\usepackage{lmodern}
\usepackage{changepage}
\usepackage{scrextend}
\usepackage{xurl}
\usepackage{enumitem}
\usepackage{caption}
\usepackage{subcaption}
\usepackage{algorithm}
\usepackage{algorithmic}
\usepackage{tabularx}
\usepackage{booktabs}
\usepackage{pdfpages}
\usepackage[all]{nowidow}
%\usepackage{showframe} % debugging overflows

% \cftsetpnumwidth{1.8em} % set the dots width in loX (f,t,l,a...) https://tex.stackexchange.com/q/369283/106389

% https://stackoverflow.com/a/74266238
\lstset{
  extendedchars=true,
  literate=
    {á}{{\'a}}1
    {ä}{{\"a}}1
    {č}{{\v{c}}}1
    {ď}{{\v{d}}}1
    {é}{{\'e}}1
    {í}{{\'i}}1
    {ĺ}{{\'l}}1
    {ľ}{{\v{l}}}1
    {ň}{{\v{n}}}1
    {ó}{{\'o}}1
    {ô}{{\^o}}1
    {ŕ}{{\'{r}}}1
    {š}{{\v{s}}}1
    {ť}{{\v{t}}}1
    {ú}{{\'u}}1
    {ý}{{\'y}}1
    {ž}{{\v{z}}}1
    {Á}{{\'A}}1
    {Ä}{{\""A}}1
    {Č}{{\v{C}}}1
    {Ď}{{\v{C}}}1
    {É}{{\'E}}1
    {Í}{{\'I}}1
    {Ĺ}{{\'L}}1
    {Ľ}{{\v{L}}}1
    {Ň}{{\v{N}}}1
    {Ó}{{\'O}}1
    {Ô}{{\^O}}1
    {Ŕ}{{\'{R}}}1
    {Š}{{\v{S}}}1
    {Ť}{{\v{T}}}1
    {Ú}{{\'U}}1
    {Ý}{{\'Y}}1
    {Ž}{{\v{Z}}}1
}

% https://www.overleaf.com/learn/latex/Code_listing
\definecolor{codegreen}{rgb}{0,0.506,0}
\definecolor{codegray}{rgb}{0.2,0.2,0.2}
\definecolor{codeviolet}{rgb}{0.58,0,0.82}
\definecolor{codemagenta}{rgb}{0.839,0,0.494}
\definecolor{backcolour}{rgb}{0.95,0.95,0.95}
\lstdefinestyle{code-listing}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen},
    keywordstyle=\color{codemagenta},
    numberstyle=\ttfamily\footnotesize\color{codegray},
    stringstyle=\color{codeviolet},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=none,
    numbersep=8pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    frame=single,
    framesep=3pt,
    framerule=0pt,
    xleftmargin=4pt,
    xrightmargin=4pt,
    framexleftmargin=1pt,
    framexrightmargin=1pt
}

\newboolean{isThesis}

\IfEqCase*{\isThesis}{
    {0}{\setboolean{isThesis}{false}}
    {1}{\setboolean{isThesis}{true}}
}

% deine global variables 
\def\@nedefinovane{! UNDEFINED: \textbackslash}

\def\@skola{Slovensk\a'a technick\a'a  univerzita v Bratislave}
\def\FEIschool#1{\def\@skola{#1}}
\newcommand{\printSkola}{\@skola}
\def\@skolaEn{Slovak University of Technology in Bratislava}
\def\FEIschoolEn#1{\def\@skolaEn{#1}}
\newcommand{\printSkolaEn}{\@skolaEn}

\def\@fakulta{Fakulta elektrotechniky a informatiky}
\def\FEIfaculty#1{\def\@fakulta{#1}}
\newcommand{\printFakulta}{\@fakulta}

\def\@fakultaEn{Faculty of Electrical Engineering and Information Technology}
\def\FEIfacultyEn#1{\def\@fakultaEn{#1}}
\newcommand{\printFakultaEn}{\@fakultaEn}

\def\@autor{\@nedefinovane FEIauthor}
\def\FEIauthor#1{\def\@autor{#1}}
\newcommand{\printAutor}{\@autor}

\def\@lecturer{\@nedefinovane FEIlecturer}
\def\FEIlecturer#1{\def\@lecturer{#1}}
\newcommand{\printLecturer}{\@lecturer}

\def\@ta{\@nedefinovane FEITA}
\def\FEITA#1{\def\@ta{#1}}
\newcommand{\printTa}{\@ta}

\def\@course{\@nedefinovane FEIcourse}
\def\FEIcourse#1{\def\@course{#1}}
\newcommand{\printCourse}{\@course}

\def\@courseEn{\@nedefinovane FEIcourseEn}
\def\FEIcourseEn#1{\def\@courseEn{#1}}
\newcommand{\printCourseEn}{\@courseEn}

\def\@courseTag{\@nedefinovane FEIcourseTag}
\def\FEIcourseTag#1{\def\@courseTag{#1}}
\newcommand{\printCourseTag}{\@courseTag}

\def\@nazov{\@nedefinovane FEItitle}
\def\FEItitle#1{\def\@nazov{#1}}
\newcommand{\printNazov}{\@nazov}

\def\@nazovEn{\@nedefinovane FEItitleEn}
\def\FEItitleEn#1{\def\@nazovEn{#1}}
\newcommand{\printNazovEn}{\@nazovEn}

\def\@keywords{\@nedefinovane FEIkeywords}
\def\FEIkeywords#1{\def\@keywords{#1}}
\newcommand{\printKeywords}{\@keywords}

\def\@keywordsEn{\@nedefinovane FEIkeywordsEn}
\def\FEIkeywordsEn#1{\def\@keywordsEn{#1}}
\newcommand{\printKeywordsEn}{\@keywordsEn}

\def\@evidencneCislo{\@nedefinovane FEIregNr}
\def\FEIregNr#1{\def\@evidencneCislo{#1}}
\newcommand{\printEvidencneCislo}{\@evidencneCislo}

\def\@den{\number\day}
\def\@mesiac{\number\month}
\def\@rok{\number\year}
\newcommand\FEIdate[3]{\def\@den{#1}
    \def\@mesiac{#2}
    \def\@rok{#3}}
\newcommand{\printDatum}{\@den.\@mesiac.\@rok}

\def\@studijnyProgram{Aplikovan\a'a informatika}
\def\FEIstudyProgramme#1{\def\@studijnyProgram{#1}}
\newcommand{\printStudijnyProgram}{\@studijnyProgram}

\def\@studijnyProgramEn{Applied Informatics}
\def\FEIstudyProgrammeEn#1{\def\@studijnyProgramEn{#1}}
\newcommand{\printStudijnyProgramEn}{\@studijnyProgramEn}

\def\@nazovStudijnehoOdboru{Informatika}
\def\FEIstudyField#1{\def\@nazovStudijnehoOdboru{#1}}
\newcommand{\printNazovStudijnehoOdboru}{\@nazovStudijnehoOdboru}

\def\@nazovStudijnehoOdboruEn{Computer Science}
\def\FEIstudyFieldEn#1{\def\@nazovStudijnehoOdboruEn{#1}}
\newcommand{\printNazovStudijnehoOdboruEn}{\@nazovStudijnehoOdboruEn}

\def\@skoliacePracovisko{\a'Ustav informatiky a matematiky}
\def\FEItrainingWorkplace#1{\def\@skoliacePracovisko{#1}}
\newcommand{\printSkoliacePracovisko}{\@skoliacePracovisko}

\def\@skoliacePracoviskoEn{Institute of Computer Science and Mathematics}
\def\FEItrainingWorkplaceEn#1{\def\@skoliacePracoviskoEn{#1}}
\newcommand{\printSkoliacePracoviskoEn}{\@skoliacePracoviskoEn}

\def\@veduciZaverecnejPrace{\@nedefinovane FEIsupervisor}
\def\FEIsupervisor#1{\def\@veduciZaverecnejPrace{#1}}
\newcommand{\printVeduciZaverecnejPrace}{\@veduciZaverecnejPrace}

\def\@tempKonzultant{0}
\def\FEIconsultant#1{\def\@konzultant{#1} \def\@tempKonzultant{1}}
\newcommand{\printKonzultant}{\@konzultant}

%definovanie globalnych nastaveni
\pagenumbering{arabic}  
\pagestyle{plain}
\parindent=0.63cm
\parskip=1pt
\linespread{1.25}
\hypersetup{colorlinks, citecolor=black, filecolor=black, linkcolor=black, urlcolor=black}
\sectionfont{\fontsize{20pt}{18pt}\selectfont}
\subsectionfont{\fontsize{16pt}{15pt}\selectfont}
\subsubsectionfont{\fontsize{14pt}{14pt}\selectfont}

\titlespacing*\section{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
\titlespacing*\subsection{0pt}{3ex plus 1ex minus .2ex}{1.25ex plus .2ex}
\titlespacing*\subsubsection{0pt}{2.5ex plus 1ex minus .2ex}{1.25ex plus .2ex}

\lstset{
  basicstyle=\scriptsize\ttfamily,
  columns=flexible, % removes spaces
  breaklines=true,
  breakatwhitespace=true,
  showstringspaces=false, % removes ␣ character from " "
  captionpos=b % caption below text
}

\IfEqCase*{\FEIenglish}{
   {0}{
       \addto\captionsslovak{\renewcommand{\lstlistingname}{V\a'ypis k\a'odu}}
       \renewcommand{\ALG@name}{Algoritmus}}
   {1}{
       \addto\captionsenglish{\renewcommand{\lstlistingname}{Listing}}
       \renewcommand{\ALG@name}{Algorithm}}
   }[]

% http://tex.stackexchange.com/questions/588/how-can-i-change-the-margins-for-only-part-of-the-text
\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
\let\endchangemargin=\endlist 

\newcommand{\dir}[3]{
\begin{description}[topsep=0pt,leftmargin=0.5cm,style=nextline]
  \item[#1] $\cdot$ #2
\end{description}
\ifx&#3&%
   % #3 is empty
\else
    \vspace{-5mm}
    \begin{changemargin}{0.5cm}{0cm}
        #3
    \end{changemargin}
    \vspace{-4mm}
\fi
}

\newcommand{\file}[2]{
    \begin{description}[topsep=0pt,leftmargin=0.5cm,font=\normalfont\itshape,style=nextline]
        \item[#1] $\cdot$ #2
    \end{description}
}

\newcommand\FEIcover{
    \pagestyle{empty}
    \newgeometry{tmargin=2cm,bmargin=1.8cm,lmargin=2.75cm,rmargin=2.75cm}
        \IfEqCase*{\FEIenglish}{
            {0}{
                \def\@skolaTemp{\printSkola}
                \def\@skolaFakulta{\printFakulta}
                \def\@skolaEvCislo{{Eviden\v{c}n\a'e \v{c}\a'islo: \printEvidencneCislo}}
                \def\@skolaNazovPrace{\printNazov}
                \def\@skolaTypPrace{\typPrace}
                }
            {1}{
                \def\@skolaTemp{\printSkolaEn}
                \def\@skolaFakulta{\printFakultaEn}
                \def\@skolaEvCislo{{Registration number: \printEvidencneCislo}}
                \def\@skolaNazovPrace{\printNazovEn}
                \def\@skolaTypPrace{\typPraceEn}
                }
            }[]
        \begin{sffamily}
        \begin{center}
            {\fontsize{14.5pt}{0}\selectfont\bfseries \MakeTextUppercase{\@skolaTemp}\\[11.3pt] \@skolaFakulta}
        \end{center}
        \vspace{11.5mm}
        \ifthenelse{\boolean{isThesis}}
        {
            \fontsize{12.5pt}{0}\selectfont\noindent\@skolaEvCislo
        }{}
        \vspace{51.5mm}
        \begin{center}
            {\fontsize{20.5pt}{18.2pt}\selectfont\bfseries\nointerlineskip\@skolaNazovPrace\par}\vspace{29pt}
            {\fontsize{14.5pt}{0}\selectfont\bfseries \@skolaTypPrace}
        \end{center}
        \vspace{\fill}
        \begin{flushleft}
            {\fontsize{14.5pt}{0}\selectfont\bfseries
                \@rok
                \hfill
                \printAutor}
        \end{flushleft} 
    \end{sffamily}
    \restoregeometry
    \newpage    
}

\newcommand\FEItitlePage{
    \setcounter{page}{1}
    \pagestyle{empty}
    \newgeometry{tmargin=3.024cm,bmargin=2.775cm,lmargin=2.75cm,rmargin=2.75cm}
        \IfEqCase*{\FEIenglish}{
            {0}{
                \def\@skolaTemp{\printSkola}
                \def\@skolaFakulta{\printFakulta}
                \def\@skolaStudPr{\printStudijnyProgram}
                \def\@skolaStudPrCisl{\printNazovStudijnehoOdboru}
                \def\@skolaSkolPrac{\printSkoliacePracovisko}
                \def\@skolaEvCislo{{Eviden\v{c}n\a'e \v{c}\a'islo: \printEvidencneCislo}}
                \def\@skolaNazovPrace{\printNazov}
                \def\@skolaTypPrace{\typPrace}
                \def\@tempStudProgr{\v{S}tudijn\a'y program:}
                \def\@tempNazovStud{Študijný odbor:}
                \def\@tempSkolPracov{\v{S}koliace pracovisko:}
                \def\@tempVedPrace{Školiteľ:}
                \def\@tempKonzultanta{Konzultant:}
                \ifthenelse{\boolean{isThesis}}
                {}{
                    \def\@skolaCourse{\printCourseTag\enspace--\enspace\printCourse}
                    \def\@skolaLecturer{\printLecturer}
                    \def\@skolaTa{\printTa}
                    \def\@tempCourse{Predmet:}
                    \def\@tempLecturer{Predn\a'a\v{s}aj\a'uci:}
                    \def\@tempTa{Cvi\v{c}iaci:}
                }
            }              
            {1}{
                \def\@skolaTemp{\printSkolaEn}
                \def\@skolaFakulta{\printFakultaEn}
                \def\@skolaStudPr{\printStudijnyProgramEn}
                \def\@skolaStudPrCisl{\printNazovStudijnehoOdboruEn}
                \def\@skolaSkolPrac{\printSkoliacePracoviskoEn}
                \def\@skolaEvCislo{Registration number: \printEvidencneCislo}
                \def\@skolaNazovPrace{\printNazovEn}
                \def\@skolaTypPrace{\typPraceEn}
                \def\@tempStudProgr{Study Programme:}
                \def\@tempNazovStud{Study Field:}
                \def\@tempSkolPracov{Training Workplace:}
                \def\@tempVedPrace{Supervisor:}  
                \def\@tempKonzultanta{Consultant:}
                \ifthenelse{\boolean{isThesis}}
                {}{
                    \def\@skolaCourse{\printCourseTag\enspace--\enspace\printCourseEn}
                    \def\@skolaLecturer{\printLecturer}
                    \def\@skolaTa{\printTa}
                    \def\@tempCourse{Course:}
                    \def\@tempLecturer{Lecturer:}
                    \def\@tempTa{Teaching assistant:}
                }
            }
            }[]
        \begin{sffamily}
        \begin{center}
            {\fontsize{14pt}{1.3}\selectfont \bfseries \MakeTextUppercase{\@skolaTemp}\\[9.4pt] \@skolaFakulta}
        \end{center}
        \vspace{9mm}
        {
            \ifthenelse{\boolean{isThesis}}
            {
                \fontsize{12pt}{1.3}\selectfont \@skolaEvCislo
            }{}
        }    
        \vspace{40.9mm}
        \begin{center}
            {\fontsize{20pt}{18.1pt}\selectfont\bfseries\@skolaNazovPrace\par}\vspace{22pt}
            {\fontsize{14pt}{0}\selectfont\bfseries\@skolaTypPrace}
        \end{center}
        \vspace{\fill}
        {\fontsize{12pt}{14pt}\selectfont
        \begin{tabbing}
            \hspace*{5cm}\= \kill
            \@tempStudProgr \> \@skolaStudPr \\
            \ifthenelse{\boolean{isThesis}}
            {\@tempNazovStud \> \@skolaStudPrCisl \\
             \@tempSkolPracov \> \@skolaSkolPrac \\
             \@tempVedPrace \> \printVeduciZaverecnejPrace \\
             \IfEqCase*{\@tempKonzultant}{
                    {0}{}
                    {1}{\@tempKonzultanta \> \printKonzultant}
                    }[]
            }{\@tempCourse \> \parbox[t]{9cm}{\@skolaCourse\vspace{1ex}} \\ %TODO use this for abstract minipage
                \@tempLecturer \> \@skolaLecturer \\
                \@tempTa \> \@skolaTa \\
            }
        \end{tabbing}
        }
        \vspace{3.43cm}
        \begin{flushleft}
            {\fontsize{12pt}{0}\selectfont \bfseries
                \@rok
                \hfill
                \printAutor}
        \end{flushleft}
        \end{sffamily}
    \restoregeometry
    \newpage
}

\newcommand\FEIthanks[1]{
    \pagestyle{empty}
    \vspace*{\stretch{1}}
    \IfEqCase*{\FEIenglish}{
        {0}{\section*{\fontsize{16pt}{1.3}\selectfont Po\v{d}akovanie}}
        {1}{\section*{\fontsize{16pt}{1.3}\selectfont Acknowledgments}}
        }[]
    \vspace{1pt}
        
    \ifthenelse{\isempty{#1}}
    {Chcem sa po\v{d}akova\v{t} ved\'{u}cemu z\'{a}vere\v{c}nej pr\'{a}ce, ktor\'{y}m bol \printVeduciZaverecnejPrace, za odborn\'{e} vedenie, rady a pripomienky, ktor\'{e} mi pomohli pri vypracovan\'{i} tejto  \typPraceTempII.}
    {\input{#1}}
    \vspace{7.1pt}
    \newpage
}

\newcommand\FEIabstract[1]{
    \pagestyle{empty}   
    \vspace*{-26.6pt}
    \section*{\fontsize{20pt}{1.3}\selectfont Abstrakt}
    \vspace{0.45cm}

    \noindent\input{#1}

    \vspace{0.8cm}
    \noindent \textbf{K\v{l}\a'u\v{c}ov\a'e slov\a'a}

    \vspace{0.3cm}
    \noindent \printKeywords
    \clearpage
}
    
\newcommand\FEIabstractEn[1]{
    \pagestyle{empty}   
    \vspace*{-26.6pt}
    \section*{\fontsize{20pt}{1.3}\selectfont Abstract}
    \vspace{0.45cm}

    \noindent\input{#1}

    \vspace{0.8cm}
    \noindent \textbf{Keywords}

    \vspace{0.3cm}
    \noindent \printKeywordsEn
    \clearpage
}
        
\newcommand\FEIcontent{ 
    \pagestyle{plain}
    \addtocontents{toc}{\protect\thispagestyle{plain}}
    \tableofcontents
    \newpage
}
        
\newcommand\listoffiguresandtables{
    \IfEqCase*{\FEIenglish}{
        {0}{\renewcommand{\cftfigpresnum}{Obrázok\ }
            \renewcommand{\cfttabpresnum}{Tabu\v{l}ka\ }}
        {1}{\renewcommand{\cftfigpresnum}{Figure\ }
            \renewcommand{\cfttabpresnum}{Table\ }}
        }[] 
    \newlength{\mylenf}
    \settowidth{\mylenf}{\cftfigpresnum}
    \setlength{\cftfignumwidth}{\dimexpr\mylenf+3em}
    \setlength{\cfttabnumwidth}{\dimexpr\mylenf+3em}
    \IfEqCase*{\FEIenglish}{
        {0}{\section*{\fontsize{20pt}{1.3}\selectfont Zoznam obr\'{a}zkov a tabuliek}}
        {1}{\section*{\fontsize{20pt}{1.3}\selectfont List of Figures and Tables}}
        }[]    
    \phantomsection
    \@starttoc{lof}
    \bigskip
    \@starttoc{lot}
}
        
\newcommand\FEIlistOfTables{
    \pagestyle{plain}        
    \listoftables
    \newpage
    \pagestyle{plain}
}
        
\newcommand\FEIlistOfFigures{   
    \pagestyle{plain}
    \listoffigures
    \newpage
    \pagestyle{plain}
}
        
\newcommand\FEIlistOfAlgorithms{
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamAlg{Zoznam algoritmov}}
        {1}{\def\@zoznamAlg{List of Algorithms}}
        }[]
    \renewcommand{\listalgorithmname}{\fontsize{20pt}{1.3}\selectfont \@zoznamAlg}
    \pagestyle{plain}
    \listofalgorithms
    \newpage
    \pagestyle{plain}
}

\newcommand\FEIlistOfListings{    
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamList{Zoznam v\a'ypisov k\a'odov}}
        {1}{\def\@zoznamList{List of listings}}
        }[]
    \renewcommand{\lstlistlistingname}{\fontsize{20pt}{1.3}\selectfont \@zoznamList}
    \pagestyle{plain}
    \lstlistoflistings
    \newpage
    \pagestyle{plain}
}
        
\newcommand\FEIlistOfFiguresAndTables{ 
    \pagestyle{plain}
    \listoffiguresandtables
    \newpage
    \pagestyle{plain}
}

\renewcommand{\glsnamefont}[1]{\textbf{#1}}

% https://tex.stackexchange.com/questions/266591/printing-glossaries-with-long-styles-adds-to-the-tables-counter
\newglossarystyle{FEIlong}{
    \setglossarystyle{long}
    \renewenvironment{theglossary}{
      \begin{longtable*}{lp{\glsdescwidth}}
    }
    {\end{longtable*}}%
}

\newcommand\FEIglossaries[1]{
    \setglossarystyle{FEIlong}
    \makeglossaries
    \loadglsentries{#1}
    \setlength\LTleft{8pt}
}

\newcommand\FEIlistOfGlossaries{
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamZn{Zoznam značiek a skratiek}}
        {1}{\def\@zoznamZn{List of Symbols and Abbreviations}}
    }[]
    %\addtocontents{lof}{\protect\thispagestyle{plain}}
    %\addtocontents{lot}{\protect\thispagestyle{plain}}
    \printglossary[type=\acronymtype,title={\fontsize{20pt}{1.3}\selectfont \@zoznamZn}]
    \newpage
}

\newcommand\FEImanualListOfGlossaries[1]{
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamZn{Zoznam značiek a skratiek}}
        {1}{\def\@zoznamZn{List of Symbols and Abbreviations}}
    }[]
    \section*{\@zoznamZn}
    {
        \linespread{1.7}\selectfont
        \input{#1}\par
    }
    \newpage
}

\newcommand\FEIintroduction[1]{ 
    \pagestyle{plain}
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamUv{\'{U}vod}}
        {1}{\def\@zoznamUv{Introduction}}
        }[]
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{section}{\@zoznamUv}
    \section*{\@zoznamUv}
    \noindent \input{#1}
}

\newcommand\FEIcore[1]{
    \let\stdsection\section
    \renewcommand\section{\newpage\stdsection}  
    \newpage
    \input{#1}
}

\newcommand\FEIconclusion[1]{   
    \newpage
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamZa{Z\'{a}ver}}
        {1}{\def\@zoznamZa{Conclusion}}
        }[]
    \cleardoublepage
    \phantomsection 
    \addcontentsline{toc}{section}{\@zoznamZa}
    \section*{\@zoznamZa}
    \noindent \noindent \input{#1}
}

\newcommand\FEIresume[1]{   
    \newpage
    \cleardoublepage
    \phantomsection 
    \addcontentsline{toc}{section}{Rezum\'{e}}
    \section*{Rezum\'{e}}
    \noindent \noindent \input{#1}
}

\newcommand\FEIbibliography{    
    \newpage
    \cleardoublepage
    \phantomsection 
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@zoznamBib{Literatúra}}
        {1}{\def\@zoznamBib{Bibliography}}
        }[]
    \addcontentsline{toc}{section}{\@zoznamBib}
    \renewcommand\refname{\@zoznamBib} 

    % below you can set padding in bibliography
    \setlength{\bibhang}{0pt}
    \printbibliography
}

\newcommand\FEIaiDeclaration[1]{
    \IfEqCase*{\FEIenglish}{
        {0}{\def\@aiDeclaration{Použitie nástrojov umelej inteligencie}}
        {1}{\def\@aiDeclaration{Usage of artificial intelligence tools}}
        }[]
    \phantomsection
    \addcontentsline{toc}{subsection}{\@aiDeclaration}
    \subsection*{\@aiDeclaration}
    \input{#1}\par
}

\newcounter{listOfAppendix}

\IfEqCase*{\FEIenglish}{
    {0}{
        \def\@appendices{Dodatky}
        \def\@appendix{Dodatok}
    }
    {1}{
        \def\@appendices{Appendices}
        \def\@appendix{Appendix}
    }
}[]

\newcommand\FEIlistOfAppendix{
    \newpage
    \renewcommand \thesection{\Alph{section}}
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    \renewcommand \thetable{\Alph{section}}
    \setcounter{table}{0}
    \counterwithin{table}{section}
    \setcounter{figure}{0}
    \counterwithin{figure}{section}
    \setcounter{algorithm}{0}
    \counterwithin{algorithm}{section}
    \setcounter{lstlisting}{0}
    \counterwithin{lstlisting}{section}
    \cleardoublepage
    \phantomsection 
    \addcontentsline{toc}{section}{\@appendices}
    \listofpriloh
}

\newcommand\FEIappendix[2]{ 
    \newpage
    \cleardoublepage    
    \phantomsection 
    \section{#1}    
    \noindent
    \pridajPrilohu{#1}  
    \noindent\input{#2}
}
        
\newlistof{priloh}{pri}{\@appendices}
\newcommand{\pridajPrilohu}[1]{
    \refstepcounter{priloh}
    \addcontentsline{pri}{priloh}{\protect\numberline{\Alph{section}} #1}\par
}
        
\newcommand\FEIpdfInfo{ 
    \hypersetup{pdfinfo={
        Title={\printNazov},
        Author={\printAutor},
        Subject={\typPrace},
        Keywords={\printKeywords}
    }}
}

%PZ: hack - front/main/backmatter v article 
%http://tex.stackexchange.com/questions/154646/
%\makeatletter

\newcommand\frontmatter{%
    \clearpage
    %\@mainmatterfalse
}

\newcommand\mainmatter{%
    \cleardoublepage
    % \@mainmattertrue
}

\newcommand\backmatter{%
    \if@openright
    \cleardoublepage
    \else
    \clearpage
    \fi
    \renewcommand \thesection{\Alph{section}}
    \titleformat{\section}
    {\normalfont\Large\bfseries}{\@appendix{} \thesection:}{1ex}{}
    \setcounter{section}{0}
    \setcounter{subsection}{0}
    \setcounter{subsubsection}{0}
    % \@mainmatterfalse
}
%\makeatother
\endinput
