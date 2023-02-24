\ProvidesClass{korigamik}[2023/02/23 v1.0 Korigamik class]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt]{article}

\RequirePackage[a4paper,margin=1in,tmargin=1.5in]{geometry}

% Packages
\usepackage{tikz}
\usetikzlibrary{positioning,calc}
\RequirePackage{color,hyperref,graphicx}
\definecolor{linkcolour}{rgb}{0.7,0.2,0.2}

% Page layout
\RequirePackage{fancyhdr}
\fancypagestyle{firstpage}{%
	\fancyhf{} % clear all six fields
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{%
	\fancyhf{} % clear all six fields
	\fancyhead[LO, L]{\@header}
	\fancyhead[RO]{\nouppercase\leftmark}
	\fancyhead[R]{\nouppercase\leftmark}

	\fancyfoot{}
	\fancyfoot[L,LO]{\hfill\thepage\hfill}
}

\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

\linespread{1.069}

% Font settings
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % modernized version of the Computer Modern font family  
\RequirePackage[sc]{mathpazo} % small caps option (sc) 
\RequirePackage{textcomp} % provides additional symbols and text companion fonts.
\RequirePackage[protrusion=true,expansion=false]{microtype} % enabling character protrusion) (disabling font expansion)

% Configurations
\newcommand*{\@rollno}{<rollno>}
\newcommand*{\rollno}[1]{
	\renewcommand*{\@rollno}{#1}
}
\newcommand*{\@subject}{<subject>}
\newcommand*{\subject}[1]{
	\renewcommand*{\@subject}{#1}
}
\newcommand*{\@keywords}{<keywords>}
\newcommand*{\keywords}[1]{
	\renewcommand*{\@keywords}{#1}
}
\newcommand*{\@logoimagepath}{}
\newcommand*{\@logoimagescale}{0.5}
\newcommand*{\@logolabel}{<Logo label>}
\newcommand*{\logoimage}[3]{
	\renewcommand*{\@logoimagepath}{#1}
	\renewcommand*{\@logoimagescale}{#2}
	\renewcommand*{\@logolabel}{#3}
}
\newcommand*{\@titlelabel}{<Something here>}
\newcommand*{\titlelabel}[1]{
	\renewcommand*{\@titlelabel}{#1}
}
\newcommand*{\@semester}{<Semester>}
\newcommand*{\semester}[1]{
	\renewcommand*{\@semester}{#1}
}
\newcommand*{\@header}{}
\newcommand*{\header}[1]{
	\renewcommand*{\@header}{#1}
}

\newcommand{\square}{
	\begin{tikzpicture}
		\draw (0,0) -- (1,0) -- (1,1) -- (0,1) -- (0,0);
	\end{tikzpicture}
}

\hypersetup{colorlinks,breaklinks,
linkcolor=linkcolour,citecolor=linkcolour,
filecolor=linkcolour, urlcolor=linkcolour,
pdftitle={\@title}, pdfauthor={\@author}
pdfsubject={\@subject}, pdfkeywords={\@keywords},
}

% Title page
\renewcommand{\maketitle}{%
	\makeatletter
	\begin{titlepage}
		\thispagestyle{empty}
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
			\begin{tabular}[h]{r | l}
				Name     & \textbf{\@author}          \\
				Roll No  & \textbf{\textit{\@rollno}} \\
				Semester & \textbf{\@semester}        \\
				Course   & \textbf{\textit{CICPC09}}  \\
			\end{tabular}
		\end{center}
		\vfill

		\begin{center}
			\textsc{\large Department of Computer Science \& Engineering}\\[0.4cm]
			{\large \today}
		\end{center}

	\end{titlepage}
	\makeatother
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

% Define the logos
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

% Lists

% Save the original itemize, enumerate, and description environments
\let\originalItemize\itemize
\let\originalEndItemize\enditemize
\let\originalEnumerate\enumerate
\let\originalEndEnumerate\endenumerate
\let\originalDescription\description
\let\originalEndDescription\enddescription

% Redefine the itemize environment
\renewenvironment{itemize}
{\originalItemize\parskip=0pt}
{\originalEndItemize}

% Redefine the enumerate environment
\renewenvironment{enumerate}
{\originalEnumerate\parskip=0pt}
{\originalEndEnumerate}

% Redefine the description environment
\renewenvironment{description}
{\originalDescription\parskip=0pt\parindent=1.8em}
{\originalEndDescription}

% Define aliases for itemize and enditemize
\let\itemise\itemize
\let\enditemise\enditemize

% Redefine the label for the first level of itemize
\renewcommand\labelitemi{\normalfont\bfseries\textendash}

% Redefine the label for the second level of itemize
\renewcommand\labelitemii{\normalfont\bfseries\textperiodcentered}

% Redefine the label for the description environment
\renewcommand*\descriptionlabel[1]{\hspace\labelsep
	\normalfont\itshape #1}

% Table of Contents
\renewcommand*\contentsname{\centering \Huge Index \\} % Change the name of the table of contents
\setcounter{tocdepth}{3} % Set the depth of the table of contents
