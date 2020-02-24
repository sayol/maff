%% TEMPLETE WRITER: SAY OL  %%
%% EMAIL: say_ol@yahoo.com  %%
%% WEBSITE: khtug.blogspot.com  %%
%% PERSONAL BLOG: bunnybookshelf.blogspot.com  %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{maff}
\LoadClassWithOptions{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{12pt,a4paper}
\ProcessOptions\relax
\RequirePackage{geometry}
\geometry{%
	top=3cm,%
	bottom=3cm,%
	left=1.5cm,%
	right=1.5cm,%
	bindingoffset=1cm}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage[no-math]{fontspec}% no math font
\setmainfont[Ligatures=TeX,AutoFakeBold=0.25,AutoFakeSlant=0.25]{Khmer OS}% roman font
\setsansfont[Ligatures=TeX,AutoFakeBold=0,AutoFakeSlant=0.25]{Khmer OS Bokor}% sans serif font
\setmonofont[Ligatures=TeX,AutoFakeBold=0.25,AutoFakeSlant=0.25]{Khmer OS Siemreap}% typewriter font
\newfontfamily{\mlfamily}[Ligatures=TeX,AutoFakeBold=0,AutoFakeSlant=0.25]{Khmer OS Muol}
\XeTeXlinebreaklocale "km"% line break rule
\XeTeXlinebreakskip = 0pt plus 1pt minus 1pt% line break skip
% khmer number
\def\khmer#1{\expandafter\@khmer\csname c@#1\endcsname}
\def\@khmer#1{\expandafter\@@khmer\number#1\@nil}
\def\@@khmer#1{%
	\ifx#1\@nil% terminate when encounter @nil
	\else%
	\ifcase#1 ០\or ១\or ២\or ៣\or ៤\or ៥\or ៦\or ៧\or ៨\or ៩\fi%
	\expandafter\@@khmer% recursively map the following characters
	\fi}
\def\khmernumeral#1{\@@khmer#1\@nil}
% khmer alphabet
\def\alpkh#1{\expandafter\@alpkh\csname c@#1\endcsname}
\def\@alpkh#1{%
	\ifcase#1% zero -> none
	\or ក\or ខ\or គ\or ឃ\or ង%
	\or ច\or ឆ\or ជ\or ឈ\or ញ%
	\or ដ\or ឋ\or ឌ\or ឍ\or ណ%
	\or ត\or ថ\or ទ\or ធ\or ន%
	\or ប\or ផ\or ព\or ភ\or ម%
	\or យ\or រ\or ល\or វ\or ស%
	\or ហ\or ឡ\or អ%
	\else%
	\@ctrerr% otherwise, counter error!
	\fi}
%
\def\khmershortdate{%
	\ifnum\day<10\@khmer{0\day}\else\@khmer\day\fi%
	/\@khmer\month%
	/\@khmer\year}
\def\khmerdate{%
	\ifnum\day<10\@khmer{0\day}\else\@khmer\day\fi~%
	\ifcase\month\or%
	មករា\or កុម្ភៈ\or មិនា\or មេសា\or ឧសភា\or មិថុនា\or%
	កក្កដា\or សីហា\or កញ្ញា\or តុលា\or វិច្ឆិកា\or ធ្នូ\fi~%
	\@khmer\year}
\def\contentsname{មាតិកា}
\def\listfigurename{បញ្ជីរូបភាព}
\def\listtablename{បញ្ជីតារាង}
\def\bibname{គន្ថិទ្ទេស}
\def\indexname{លិបិក្រម}
\def\figurename{រូប}
\def\tablename{តារាង}
\def\partname{ផ្នែក}
\def\chaptername{ជំពូក}
\def\appendixname{សេចក្ដីបន្ថែម}
\def\thechapter{\khmer{chapter}}
\def\thesection{\thechapter.\khmer{section}}
\def\thesubsection{\thesection.\khmer{subsection}}
\def\thefigure{\thechapter.\khmer{figure}}
\def\thetable{\thechapter.\khmer{table}}
\def\thepage{\khmer{page}}
\RequirePackage{tikz}
\def\@makechapterhead#1{%
	{%
		\parindent\z@\raggedright%
		\ifnum\c@secnumdepth>\m@ne%
		{\Large\mlfamily\bfseries\color{orange!70!red}\@chapapp~\thechapter.~#1}%
		\fi%
		\@@par\nobreak\vskip4ex%
	}%
}
\def\@makeschapterhead#1{%
	{%
		\parindent\z@\raggedright%
		\ifnum\c@secnumdepth>\m@ne%
		{\Large\mlfamily\bfseries\color{orange!70!red} #1}%
		\fi%
		\@@par\nobreak\vskip4ex%
	}%
}
\def\headtext{}
\def\ps@plain{%
	\def\@oddhead{%
		\begin{tikzpicture}[remember picture,overlay]
		\fill[left color=orange,right color=orange!50!yellow](current page.north west)rectangle([yshift=-2cm]current page.north east);
		\draw[color=white,ultra thick]([yshift=-1.9cm]current page.north west)rectangle([yshift=-1.9cm]current page.north east);
		\node[left color=orange,right color=orange!50!yellow,draw=white,ultra thick,circle,minimum height=1.5cm,inner sep=0.1ex]at([xshift=-2cm,yshift=-2cm]current page.north east){\mlfamily\bfseries\thepage};
		\node[inner sep=0pt,right] at ([xshift=2.5cm,yshift=-1cm]current page.north west){\parbox{\linewidth}{\flushleft\footnotesize\itshape\headtext}};
		\end{tikzpicture}}
	\def\@evenhead{%
		\begin{tikzpicture}[remember picture,overlay]
		\fill[right color=orange,left color=orange!50!yellow](current page.north west)rectangle([yshift=-2cm]current page.north east);
		\draw[color=white,ultra thick]([yshift=-1.9cm]current page.north west)rectangle([yshift=-1.9cm]current page.north east);
		\node[right color=orange,left color=orange!50!yellow,draw=white,ultra thick,circle,minimum height=1.5cm,inner sep=0.1ex]at([xshift=2cm,yshift=-2cm]current page.north west){\mlfamily\bfseries\thepage};
		\node[inner sep=0pt,left] at ([xshift=-2.5cm,yshift=-1cm]current page.north east){\parbox{\linewidth}{\flushright\footnotesize\itshape\headtext}};
		\end{tikzpicture}}
	\def\@oddfoot{%
		\begin{tikzpicture}[remember picture,overlay]
		\fill[left color=orange,right color=orange!50!yellow](current page.south west)rectangle([yshift=2cm]current page.south east);
		\draw[color=white,ultra thick]([yshift=1.9cm]current page.south west)rectangle([yshift=1.9cm]current page.south east);
		\node[inner sep=0pt,right] at ([xshift=2.5cm,yshift=1cm]current page.south west){\parbox{\linewidth}{\flushleft\footnotesize\itshape\url{khtug.blogspot.com}}};
		\end{tikzpicture}}
	\def\@evenfoot{%
		\begin{tikzpicture}[remember picture,overlay]
		\fill[right color=orange,left color=orange!50!yellow](current page.south west)rectangle([yshift=2cm]current page.south east);
		\draw[color=white,ultra thick]([yshift=1.9cm]current page.south west)rectangle([yshift=1.9cm]current page.south east);
		\node[inner sep=0pt,left] at ([xshift=-2.5cm,yshift=1cm]current page.south east){\parbox{\linewidth}{\flushright\footnotesize\itshape\url{khtug.blogspot.com}}};
		\end{tikzpicture}}
}
\def\@seccntformat#1{\csname the#1\endcsname.~}
\def\@sect#1#2#3#4#5#6[#7]#8{%
	\ifnum #2>\c@secnumdepth
	\let\@svsec\@empty
	\else
	\refstepcounter{#1}%
	\protected@edef\@svsec{\@seccntformat{#1}\relax}%
	\fi
	\@tempskipa #5\relax
	\ifdim \@tempskipa>\z@
	\begingroup
	#6{%
		\noindent
		\raggedright\@svsec #8%title
		\@@par}%
	\endgroup
	\csname #1mark\endcsname{#7}%
	\addcontentsline{toc}{#1}{%
		\ifnum #2>\c@secnumdepth \else
		\protect\numberline{\csname the#1\endcsname}%
		\fi
		#7}%
	\else
	\def\@svsechd{%
		#6{\hskip #3\relax
			\@svsec #8}%
		\csname #1mark\endcsname{#7}%
		\addcontentsline{toc}{#1}{%
			\ifnum #2>\c@secnumdepth \else
			\protect\numberline{\csname the#1\endcsname}%
			\fi
			#7}}%
	\fi
	\@xsect{#5}}
% section star
\def\@ssect#1#2#3#4#5{%
	\@tempskipa #3\relax
	\ifdim \@tempskipa>\z@
	\begingroup
	#4{\noindent\raggedright #5% title
		\@@par}%
	\endgroup
	\else
	\def\@svsechd{#4{\hskip #1\relax #5}}%
	\fi
	\@xsect{#3}}
\def\section{%
	\@startsection{section}{1}{\z@}{%
		-1.5ex\@plus-.2ex\@minus-.2ex}{%
		1.5ex\@plus.2ex\@minus.2ex}{\color{orange!70!red}\large\sffamily\bfseries}}
\def\subsection{%
	\@startsection{subsection}{2}{\z@}{%
		-1.5ex\@plus-.2ex\@minus-.2ex}{%
		1.5ex\@plus.2ex\@minus.2ex}{\color{orange!70!red}\normalsize\sffamily\bfseries}}
\def\subsubsection{%
	\@startsection{subsubsection}{3}{\z@}{%
		-1.5ex\@plus-.2ex\@minus-.2ex}{%
		1.5ex\@plus.2ex\@minus.2ex}{\color{orange!70!red}\normalsize\sffamily\bfseries}}
\def\paragraph{%
	\@startsection{paragraph}{4}{\z@}{%
		1.5ex\@plus.2ex\@minus.2ex}{-1em}{\color{orange!70!red}\normalsize\sffamily\itshape}}
\def\subparagraph{%
	\@startsection{subparagraph}{4}{\parindent}{%
		1.5ex\@plus.2ex\@minus.2ex}{-1em}{\color{orange!70!red}\normalsize\sffamily\itshape}}
\RequirePackage{tcolorbox}
\tcbuselibrary{skins,breakable}
\tcbset{
	fonttitle=\color{black}\sffamily\bfseries,%
	attach title to upper=\enspace,
	titlerule=0pt,%
	boxrule=0pt,%
	sharp corners,%
	colback=yellow,%
	before skip=\topskip,%
	after skip=\topskip,%
	top=1ex,%
	bottom=1ex,%
	middle=1ex,%
	left=1ex,%
	right=1ex,
	breakable}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{pifont}
% set enumerate and itemize key for number of columns
% \RequirePackage{multicol}
\SetEnumitemKey{2}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{2},after=\end{multicols}}
\SetEnumitemKey{3}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{3},after=\end{multicols}}
\SetEnumitemKey{4}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{4},after=\end{multicols}}
\SetEnumitemKey{5}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{5},after=\end{multicols}}
\SetEnumitemKey{6}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{6},after=\end{multicols}}
% set enumerate and itemize key for numerals
\AddEnumerateCounter{\alpkh}{\@alpkh}{ឈ}
\AddEnumerateCounter{\khmer}{\@khmer}{៣}
% enumerate keys
\SetEnumitemKey{1}{label=\protect\color{orange!70!red}\arabic*.}
\SetEnumitemKey{a}{label=\protect\color{orange!70!red}\alph*.}
\SetEnumitemKey{A}{label=\protect\color{orange!70!red}\Alph*.}
\SetEnumitemKey{i}{label=\protect\color{orange!70!red}\roman*.}
\SetEnumitemKey{I}{label=\protect\color{orange!70!red}\Roman*.}
\SetEnumitemKey{k}{label=\protect\color{orange!70!red}\alpkh*.}
\SetEnumitemKey{m}{label=\protect\color{orange!70!red}\khmer*.}
% itemize keys
\SetEnumitemKey{b}{label=\protect\color{orange!70!red}\protect\ensuremath{\bullet}}
\SetEnumitemKey{c}{label=\protect\color{orange!70!red}\protect\ensuremath{\circ}}
\SetEnumitemKey{d}{label=\protect\color{orange!70!red}\protect\ensuremath{\diamond}}
\SetEnumitemKey{t}{label=\protect\color{orange!70!red}\protect\ensuremath{\triangleright}}
\SetEnumitemKey{p}{label=\protect\color{orange!70!red}\protect\ding{43}}
\SetEnumitemKey{w}{label=\protect\color{orange!70!red}\protect\ding{45}}
% styling enumerate
\setlist[enumerate]{%
	parsep=0pt,%
	topsep=1ex,%
	partopsep=0pt,%
	leftmargin=*,%
	itemsep=1ex,%
	labelsep=.5ex}
\setlist[enumerate,1]{1}
\setlist[enumerate,2]{a}
\setlist[enumerate,3]{i}
\setlist[enumerate,4]{A}
% styling itemize
\setlist[itemize]{%
	parsep=0pt,%
	topsep=1ex,%
	partopsep=0pt,%
	leftmargin=*,%
	itemsep=1ex,%
	labelsep=.7ex}
\setlist[itemize,1]{b}
\setlist[itemize,2]{c}
\setlist[itemize,3]{d}
\setlist[itemize,4]{t}
% table of contents
% chapter
\def\l@chapter#1#2{%
	\ifnum \c@tocdepth >\m@ne
	\addpenalty{-\@highpenalty}%
	\vskip 1.0em \@plus\p@
	\setlength\@tempdima{1.5em}%
	\begingroup
	\parindent \z@ \rightskip \@pnumwidth
	\parfillskip -\@pnumwidth
	\leavevmode \mlfamily\bfseries
	\advance\leftskip\@tempdima
	\hskip -\leftskip
	\textcolor{orange}{#1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par%\color{black}
	\penalty\@highpenalty
	\endgroup
	\fi}
% section
\def\@dottedtocline#1#2#3#4#5{%
	\ifnum #1>\c@tocdepth \else
	\vskip \z@ \@plus.2\p@
	{\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
		\parindent #2\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima #3\relax
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		{\color{orange}#4}\nobreak
		{\color{blue}\leaders\hbox{$\m@th
				\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
				mu$}\hfill}
		\nobreak
		\hb@xt@\@pnumwidth{\hfil #5}%\color{black}
		\par}%
	\fi}
\RequirePackage{hyperref}
\hypersetup{%
	linktoc=all,%
	bookmarksnumbered,%
	bookmarksopen,%
	hidelinks}
\RequirePackage{bookmark}
\bookmarksetup{
	addtohook={%
		\ifnum\bookmarkget{level}=0%
		\bookmarksetup{color=orange!70!black}%
		\fi%
		\ifnum\bookmarkget{level}=1%
		\bookmarksetup{color=orange!70!red}%
		\fi%
		\ifnum\bookmarkget{level}=2%
		\bookmarksetup{color=orange}%
		\fi}}
\raggedbottom
\pagestyle{plain}
\pagecolor{yellow!25}
\endinput