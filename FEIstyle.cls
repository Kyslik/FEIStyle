\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FEIstyle}[2026/07/14 v3.0.0 Thesis template - FEI STUBA]

\RequirePackage{ifxetex}
\RequirePackage{ifluatex}

\ifxetex
  \ClassError{noxelatex}{%
    FEIStyle doesn't support XeLaTeX.%
  }{%
    Please use pdfLaTeX or LuaLaTeX instead.%
  }
\fi

\ifluatex
\else
  \RequirePackage[utf8]{inputenc}
\fi

\LoadClass[a4paper,12pt]{report}

\RequirePackage[a4paper,tmargin=3cm,bmargin=3cm,lmargin=2.75cm,rmargin=2.75cm]{geometry}
% hyperref has to be loaded *before* glossaries
% see https://mirror.kumi.systems/ctan/macros/latex/contrib/glossaries/glossaries-user.html#sec:hyperref
\RequirePackage[bookmarksopen,%
colorlinks,%
plainpages=false,%
citecolor=black,%
filecolor=black,%
linkcolor=black,%
urlcolor=black,%
hypertexnames=false,%
unicode]{hyperref}

\pagenumbering{arabic}
\pagestyle{plain}
\parindent 0.63cm
\parskip 1pt
\linespread{1.25} % Vyriesit nizsie

\def\@chapterskip{2.3ex plus .2ex}
\def\@sectionbeforeskip{-3ex \@plus -1ex \@minus -.2ex}
\def\@sectionafterskip{1.25ex \@plus.2ex}
\def\@subsectionbeforeskip{-2.5ex \@plus -1ex \@minus -.2ex}
\def\@chaptertitlefont{\fontsize{20pt}{18pt}}
\def\@sectiontitlefont{\fontsize{16pt}{15pt}}
\def\@subsectiontitlefont{\fontsize{14pt}{14pt}}

\def\@FEIafterTheChapter{ \space}
\def\@FEIbeforeChapterName{ }

\def\@makechapterhead#1{{%
    \setlength\parindent{\z@}%
  \setlength\parskip  {\z@}%
  \@chaptertitlefont\selectfont\bfseries %\Large \ChapFont
  \ifnum
    \c@secnumdepth >\m@ne
    \par\nobreak
    % \vskip 10\p@
    \thechapter{}\@FEIafterTheChapter%
  \fi\@FEIbeforeChapterName#1\par
  \nobreak
  \addpenalty\@secpenalty\addvspace{\@chapterskip}}}

\def\@makeschapterhead#1{{%
  \setlength\parindent{\z@}%
  \setlength\parskip  {\z@}%
  \@chaptertitlefont\selectfont\bfseries #1\par
  \nobreak
  \addpenalty\@secpenalty\addvspace{\@chapterskip}}}

\def\chapter{%
 \clearpage
 \thispagestyle{plain}
 \global\@topnum\z@
 \@afterindentfalse
 \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter.}%
    \addcontentsline{toc}{chapter}%
    {\protect\numberline{\thechapter}#1}%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi}

\def\section{\@startsection {section}{1}{\z@}%
  {\@sectionbeforeskip}%
  {\@sectionafterskip}%
  {\normalfont\@sectiontitlefont\selectfont\bfseries}}
\def\subsection{\@startsection {subsection}{2}{\z@}%
  {\@subsectionbeforeskip}%
  {\@sectionafterskip}%
  {\normalfont\@subsectiontitlefont\selectfont\bfseries}}

% Counters without chapter number
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

\endinput
