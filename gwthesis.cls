%----------------------------------------------
% LaTeX document class for GWU PhD dissertation
%         Copyright (C) 2015 Bin Zhang
%       mrbzhang@gmail.com,  bzh@gwu.edu
%----------------------------------------------
% for more information on LaTeX class, refere
% to "The LaTeX Companion"
%----------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gwthesis}[2015/08/12 v1.0 GW Thesis Class]

%----------------------------
% initial code/packages
%----------------------------
\newcommand{\baseclass}{book}
\newcommand{\dffs}{12pt}
\newcommand{\dfpaper}{letterpaper}
\newcommand{\dfside}{oneside}
%\RequirePackage{ifthen}

%----------------------------
% option declaration
%----------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

%----------------------------
% option execution
%----------------------------
\PassOptionsToClass{\dfpaper,\dfside,\dffs}{\baseclass}
\ProcessOptions\relax

%----------------------------
% class/packages loading
%----------------------------
\LoadClass{\baseclass}

\RequirePackage[doublespacing]{setspace}
\RequirePackage{indentfirst}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocbibind}

\RequirePackage{graphicx}
\RequirePackage{float}

\RequirePackage[
   lmargin=1.25in,
   rmargin=1.25in,
   tmargin=1in,
   bmargin=1in
]{geometry}

\RequirePackage[
   final,
   bookmarks=true,
   bookmarksnumbered=true,
   linktocpage=true,
   breaklinks=true,
   bookmarkstype=toc,
   hidelinks,
   colorlinks=false,
   pdfstartview={XYZ null null 1.00},
   pdfpagemode=UseOutlines
]{hyperref}

\RequirePackage[numbers]{natbib}
\RequirePackage{rotating}

\AtBeginDocument{}
\AtEndDocument{}

%----------------------------
% document layout
%----------------------------
\newtheorem{theorem}{Jibberish}

\pagestyle{plain}

%----------------------------
% document markup
%----------------------------
% frontmatter environment
\renewenvironment{frontmatter}
{\renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}
\setcounter{page}{1}}

% chapter heading appearance
\titleformat{\chapter}[block]{\bf\centering}
   {\chaptertitlename~\thechapter:}{1em}{}
\titlespacing{\chapter}{0pt}{-\normalbaselineskip}{2em}

% section heading appearance
\titleformat{\section}{\bf}{\thesection}{1em}{}
\titlespacing{\section}{0pt}{*2}{0pt}

% subsection heading appearance
\titleformat{\subsection}{\bf}{\thesubsection}{1em}{}
\titlespacing{\subsection}{0.25in}{*2}{0pt}

% subsubsection heading appearance
\titleformat{\subsubsection}{\bf}{\thesubsubsection}{1em}{}
\titlespacing{\subsubsection}{0.5in}{*2}{0pt}

% toc, lof, lot appearance
\def\@chapter[#1]#2{
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}
    \addcontentsline{toc}{chapter}{{\@chapapp~\thechapter: #1}}
    \else
      \addcontentsline{toc}{chapter}{#1}
    \fi
  \else
     \addcontentsline{toc}{chapter}{#1}
  \fi
  \chaptermark{#1}
  \addtocontents{lof}{\protect\addvspace{10\p@}}
  \addtocontents{lot}{\protect\addvspace{10\p@}}
  \@makechapterhead{#2}
  \@afterheading
}

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
\dottedcontents{section}[2em]{}{1.8em}{1em}
\dottedcontents{subsection}[4.6em]{}{2.6em}{1em}
\dottedcontents{subsubsection}[8.0em]{}{3.4em}{1em}

\titlecontents{figure}[0em]{}
  {\contentspush{Figure \thecontentslabel:\hspace{0.5em}}}{}
  {\titlerule*[1em]{.}\contentspage}

\titlecontents{table}[0em]{}
  {\contentspush{Table \thecontentslabel:\hspace{0.5em}}}{}
  {\titlerule*[1em]{.}\contentspage}

% add toc, lof, lot to contents
\renewcommand\contentsname{Table of Contents}
\renewcommand\tableofcontents{
  \chapter*{\contentsname}
  \vspace{-1em}
  \@starttoc{toc}
}

\renewcommand\listoffigures{
  \phantomsection
  \addcontentsline{toc}{chapter}{\listfigurename}
  \chapter*{\listfigurename}
  \vspace{-1em}
  \@starttoc{lof}
}

\renewcommand\listoftables{
  \phantomsection
  \addcontentsline{toc}{chapter}{\listtablename}
  \chapter*{\listtablename}
  \vspace{-1em}
  \@starttoc{lot}
}

% title page
\newcommand{\degreeyear}[1]{\gdef\@degreeyear{#1}}
\newcommand{\degreemonth}[1]{\gdef\@degreemonth{#1}}
\newcommand{\degreeday}[1]{\gdef\@degreeday{#1}}
\newcommand{\degreedate}{\@degreemonth\space\@degreeday,\space\@degreeyear}
\newcommand{\defensedate}[1]{\gdef\@defensedate{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\prevdegrees}[1]{\gdef\@prevdegrees{#1}}
\newcommand{\committeea}[1]{\gdef\@committeea{#1}} \committeea{}
\newcommand{\committeeb}[1]{\gdef\@committeeb{#1}} \committeeb{}
\newcommand{\committeec}[1]{\gdef\@committeec{#1}} \committeec{}
\newcommand{\committeed}[1]{\gdef\@committeed{#1}} \committeed{}
\newcommand{\committeee}[1]{\gdef\@committeee{#1}} \committeee{}
\newcommand{\committeef}[1]{\gdef\@committeef{#1}} \committeef{}
\newcommand{\institution}[1]{\gdef\@institution{#1}}
\newcommand{\school}[1]{\gdef\@school{#1}}
\newcommand{\advisorname}[1]{\gdef\@advisorname{#1}}
\newcommand{\advisortitle}[1]{\gdef\@advisortitle{#1}}

\renewcommand{\maketitle}{
\thispagestyle{empty}
\setcounter{page}{1}
\null\vfill
\begin{center}
  {\singlespacing 
  {\bfseries \@title}         \par \vspace{3em}
  by {\@author}               \par \vspace{2em}
  \@prevdegrees               \par \vspace{4em}
  A dissertation submitted to \par \vspace{2em}
  The Faculty of              \\
     \@school                 \\
  of \@institution            \\
  in partial fulfillment of the requirements \\
  for the degree of \@degree  \par \vspace{4em}
  \degreedate                 \par \vspace{4em}
  Dissertation directed by    \par \vspace{1em}
  \@advisorname               \par
  \@advisortitle              \par \vspace{8em}}
\end{center}
\vfill\null
\setcounter{footnote}{0}
}

% approval page command
\newcommand{\approvalpage}{
\newpage
\noindent The School of Engineering and Applied Science of 
The George Washington University certifies that {\@author} 
has passed the Final Examination for the degree of Doctor 
of Philosophy as of {\@defensedate}. This is the final and 
approved form of the dissertation.

\vspace{2em}
\begin{center}
  {\singlespacing \bfseries \@title \par}
  \vspace{1em}
  \@author
\end{center}

\vspace{2em}
\noindent Dissertation Research Committee: \par \vspace{1em}
\noindent\hfill\begin{minipage}{\textwidth-5ex}
\singlespacing
\noindent \@committeea \par \vspace{\dffs}
\noindent \@committeeb \par \vspace{\dffs}
\noindent \@committeec \par \vspace{\dffs}
\noindent \@committeed \par \vspace{\dffs}
\noindent \@committeee \par \vspace{\dffs}
\noindent \@committeef \par \vspace{\dffs}
\end{minipage}
}

% copyright page command
\newcommand{\copyrightpage}{
\newpage
\null\vfill
\vspace{-2em}
\begin{center}
  \singlespacing
  \copyright ~ Copyright \@degreeyear ~ by \@author \par
  All rights reserved \\
\end{center}
\vfill\null
}

% acknowledge environment
\newcommand{\acknowledgename}{Acknowledgements}
\newenvironment{acknowledgements}{
\phantomsection
\addcontentsline{toc}{chapter}{\acknowledgename}
\chapter*{\centering \acknowledgename}
}{}

% dedication environment
\newcommand{\dedicationname}{Dedication}
\newenvironment{dedication}{
\phantomsection
\addcontentsline{toc}{chapter}{\dedicationname}
\chapter*{\centering \dedicationname}
}{}

% abstract environment
\newcommand{\abstractname}{Abstract}
\newenvironment{abstract}{
\phantomsection
\addcontentsline{toc}{chapter}{\abstractname}
\chapter*{\centering \abstractname}
\vspace{-1.3em}
\begin{center}
  \singlespacing \bfseries \@title \par \vspace{0.3em}
\end{center}
}{}

% bibliography
\renewcommand{\bibname}{References}

% increase row height of tables
\let\Table\table
\let\endTable\endtable
\renewcommand\table{\begingroup\def\arraystretch{1.3}\Table}
\renewcommand\endtable{\endTable\endgroup}

\let\STable\sidewaystable
\let\endSTable\endsidewaystable
\renewcommand\sidewaystable{\begingroup\def\arraystretch{1.3}\STable}
\renewcommand\endsidewaystable{\endSTable\endgroup}

\endinput
