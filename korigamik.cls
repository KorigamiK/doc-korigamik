%%
%% This is file `korigamik.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% korigamik.dtx  (with options: `class')
%% ---------:| ----------------------------------------------------------
%% korigamik:| KorigamiK LaTeX Template
%%    Author:| Kushagra Lakhwani
%%    E-mail:| korigamik@gmail.com
%%   License:| Released under the GNU General Public License v3 or later
%%       See:| http://www.gnu.org/licenses/




\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{korigamik}
    [2023/06/24 v1.10 KorigamiK LaTeX Template]




\LoadClass[12pt]{article}
\RequirePackage[a4paper,margin=1in,tmargin=1.5in]{geometry}

\RequirePackage{tikz,color,hyperref,graphicx}
\usetikzlibrary{positioning,calc}

\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % modernized version of the Computer Modern font family
\RequirePackage[sc]{mathpazo} % small caps option (sc)
\RequirePackage{textcomp} % provides additional symbols and text companion fonts.
\RequirePackage[protrusion=true,expansion=false]{microtype} % enabling character protrusion) (disabling font expansion)

\RequirePackage{fancyhdr}
\fancypagestyle{firstpage}{%
\fancyhf{} % clear all six fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{
\fancyhf{} % clear all six fields
\fancyhead[LO, L]{\@header}
\fancyhead[RO]{\nouppercase\leftmark}
\fancyhead[R]{\nouppercase\leftmark}
\setlength{\headheight}{15pt}
\fancyfoot{}
\fancyfoot[L,LO]{\hfill\thepage\hfill}
}

\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}
\linespread{1.069}
\definecolor{linkcolour}{rgb}{0.286,0.286,0.286}
\newcommand*{\@rollno}{<rollno>}
\newcommand*{\rollno}[1]{ \renewcommand*{\@rollno}{#1} }
\newcommand*{\@subject}{<subject>}
\newcommand*{\subject}[1]{ \renewcommand*{\@subject}{#1} }
\newcommand*{\@keywords}{<keywords>}
\newcommand*{\keywords}[1]{ \renewcommand*{\@keywords}{#1} }
\newcommand*{\@logoimagepath}{}
\newcommand*{\@logoimagescale}{0.5}
\newcommand*{\@logolabel}{<Logo label>}
\newcommand*{\logoimage}[3]{  \renewcommand*{\@logoimagepath}{#1}
                              \renewcommand*{\@logoimagescale}{#2}
                              \renewcommand*{\@logolabel}{#3} }
\newcommand*{\@titlelabel}{<Something here>}
\newcommand*{\titlelabel}[1]{ \renewcommand*{\@titlelabel}{#1} }
\newcommand*{\@semester}{<semester>}
\newcommand*{\semester}[1]{ \renewcommand*{\@semester}{#1} }
\newcommand*{\@header}{<header>}
\newcommand*{\header}[1]{ \renewcommand*{\@header}{#1} }
\newcommand*{\@bottomnote}{<bottom note>}
\newcommand*{\bottomnote}[1]{ \renewcommand*{\@bottomnote}{#1} }
\newcommand*{\@course}{<course>}
\newcommand*{\course}[1]{ \renewcommand*{\@course}{#1} }

\hypersetup{  colorlinks,breaklinks,
  linkcolor=linkcolour,citecolor=linkcolour,
  filecolor=linkcolour, urlcolor=linkcolour,
  pdftitle={\@title}, pdfauthor={\@author}
  pdfsubject={\@subject}, pdfkeywords={\@keywords}, }

\newcommand{\square}{
\begin{tikzpicture}
\draw (0,0) -- (1,0) -- (1,1) -- (0,1) -- (0,0);
\end{tikzpicture}
}

\renewcommand{\maketitle}{%
\newgeometry{tmargin=1in,bmargin=.5in}
\makeatletter
\begin{titlepage}
\begin{center}
\begin{flushright}
\ifx\@logoimagepath\empty
\square
\\<your logo here>
\else
\includegraphics[scale=\@logoimagescale]{\@logoimagepath}
\Large {\\ \textbf{\@logolabel}}
\fi
\end{flushright}
\end{center}
\vfill

\noindent\begin{tikzpicture}
\node[
text width=\textwidth-2cm,
align=left,
font=\fontsize{30}{30}\selectfont\scshape,
inner xsep=.5cm
] (x) {\@title};
\draw (x.north west) node[
draw,
above right=1cm and 0pt,
font=\LARGE,
inner sep=.2cm
] (y) {\textsc{\@titlelabel}};
\draw (y.south west)--($(x.south west)+(0,-1)$);
\end{tikzpicture}

\vspace*{2cm}
\begin{center}
\begin{minipage}{\textwidth}
\begin{tabular}[h]{l  l}
Name     & \textbf{\@author}          \\
\ifx\@rollno\empty
\else
Roll No. & \textbf{\textit{\@rollno}} \\
\fi
\ifx\@semester\empty
\else
Semester & \textbf{\@semester}        \\
\fi
\ifx\@course\empty
\else
Course   & \textbf{\textit{\@course}} \\
\fi
\end{tabular}
\end{minipage}
\end{center}
\vfill

\begin{center}
\textsc{\large \@bottomnote}\\[0.4cm]
{\large \today}
\end{center}

\end{titlepage}
\makeatother
\restoregeometry
}

\renewcommand\section{\@startsection {section}{1}{\z@}%
  {-3.5ex \@plus -1ex \@minus -.2ex}%
  {2.3ex \@plus.2ex}%
  {\normalfont\Large\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
{-3.25ex\@plus -1ex \@minus -.2ex}%
{1.5ex \@plus .2ex}%
{\normalfont\large\raggedright}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
{-3.25ex\@plus -1ex \@minus -.2ex}%
{1.5ex \@plus .2ex}%
{\normalfont\normalsize\raggedright}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
{3.25ex \@plus1ex \@minus.2ex}%
{-1em}%
{\normalfont\normalsize\itshape}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
{3.25ex \@plus1ex \@minus .2ex}%
{-1em}%
{\normalfont\normalsize\itshape}}

\newcommand\tpj@deflogo{\@dblarg\tpj@@deflogo}

\newcommand\tpj@@deflogo[3][\@nil]{%
\expandafter\DeclareRobustCommand\csname#2\endcsname{#3}%
\pdfstringdefDisableCommands{%
\expandafter\def\csname#2\endcsname{#1}}}

\makeatletter
\tpj@deflogo{TeX}{T\kern-.15em\lower.5ex\hbox{E}\kern-.07em X\spacefactor1000\relax}
\tpj@deflogo{LaTeX}{L\kern-.32em\raise.37ex\hbox{\scalebox{0.76}{A}}\kern-.15em\TeX}
\tpj@deflogo{LaTeXe}{\LaTeX2$_{\textstyle\varepsilon}$}
\tpj@deflogo{BibTeX}{B{\textsc i\kern-.025em\textsc b}\kern-.08em\TeX}
\DeclareRobustCommand\logofamily{%
\not@math@alphabet\logofamily\relax
\fontencoding{U}\fontfamily{logo}\selectfont}
\DeclareTextFontCommand{\textlogo}{\logofamily}
\tpj@deflogo[MetaFont]{MF}{\textlogo{META}\@dischyph\textlogo{FONT}\@}
\tpj@deflogo[MetaPost]{MP}{\textlogo{META}\@dischyph\textlogo{POST}\@}
\tpj@deflogo{ConTeXt}{C\kern-.03em on\-\kern-.10em\TeX\kern-0.04em t}%
\tpj@deflogo{pdfTeX}{pdf\/\TeX}
\tpj@deflogo{pdfLaTeX}{pdf\/\LaTeX}
\makeatother

\let\originalItemize\itemize
\let\originalEndItemize\enditemize
\let\originalEnumerate\enumerate
\let\originalEndEnumerate\endenumerate
\let\originalDescription\description
\let\originalEndDescription\enddescription

\renewenvironment{itemize}
{\originalItemize\parskip=0pt}
{\originalEndItemize}

\renewenvironment{enumerate}
{\originalEnumerate\parskip=0pt}
{\originalEndEnumerate}

\renewenvironment{description}
{\originalDescription\parskip=0pt\parindent=1.8em}
{\originalEndDescription}

\let\itemise\itemize
\let\enditemise\enditemize

\renewcommand\labelitemi{\normalfont\bfseries\textendash}

\renewcommand\labelitemii{\normalfont\bfseries\textperiodcentered}

\renewcommand*\descriptionlabel[1]{\hspace\labelsep
\normalfont\itshape #1}

\renewcommand*\contentsname{\centering \Huge Index \vskip 1cm}
\setcounter{tocdepth}{3} % Set the depth of the table of contents


%% Copyright (C) 2023 by Kushagra Lakhwani <korigamik@gmail.com>
%% 
%% KorigamiK class is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or (at
%% your option) any later version.
%% 
%% KorigamiK class is distributed in the hope that it will be useful, but
%% WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%% General Public License for more details.
%% 
%% You should have received a copy of the GNU General Public License
%% along with KorigamiK class.  If not, see <http://www.gnu.org/licenses/>.
%%
%% End of file `korigamik.cls'.
