%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MANIT Synopsis Template
% LaTeX Class File
% Version 2.0 (27/11/2024)
%
% Template Repository:
% https://github.com/ResearchInfuser/manit-pre-thesis
%
% Author:
% Prashant Kumar Nag
% Email: prashantnag.workmail@gmail.com
%
% Institution:
% Maulana Azad National Institute of Technology, Bhopal
% An Institute of National Importance
%
% Description:
% This class file defines the structure and layout for Synopsis
% submissions at MANIT. It provides a complete Quarto-based template with
% instructional chapters demonstrating proper formatting for:
% - Text formatting, sections, and cross-references
% - Citations and bibliography management (IEEE style)
% - Figures, tables, equations, and algorithms
% - Research methodology and results presentation
% - Publication lists and references
%
% Features:
% - LuaLaTeX engine for robust compilation
% - Customizable TOC spacing with tocloft
% - Professional algorithm formatting (algorithm/algorithmic packages)
% - Mermaid diagram support for workflow visualization
% - IEEE bibliography style with BibLaTeX
% - MANIT institutional branding and footer
% - Tutorial-style chapters for easy customization
%
% Usage:
% This template is designed for use with Quarto. Students should:
% 1. Update _quarto.yml with personal information
% 2. Replace tutorial content with actual research content
% 3. Add references to references.bib
% 4. Build using: quarto render --to manit-pre-thesis-synopsis-pdf
%
% Notes:
% 1) This class file should not be edited under normal circumstances.
% 2) All customization should be done through _quarto.yml metadata.
% 3) For major changes, create a new version and document modifications.
%
% Class License:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%
% Acknowledgments:
% Based on LaTeXTemplates.com thesis class structure
% Adapted for MANIT Pre-Thesis Synopsis requirements
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\newcommand{\classname}{ManitSynopsis}
\ProvidesClass{\classname}[2017/08/27 v1.6 LaTeXTemplates.com]
\providecommand{\baseclass}{book}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\newbool{nolistspace}
\newbool{chapteroneline}
\newbool{listtoc}
\newbool{toctoc}
\newbool{parskip}
\newbool{hyperrefsupport}
\booltrue{hyperrefsupport}
\newbool{headsepline}
\newbool{consistentlayout}


\DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
\DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
\DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
\DeclareOption{toctotoc}{\booltrue{toctoc}}
\DeclareOption{parskip}{\booltrue{parskip}}
\DeclareOption{headsepline}{\booltrue{headsepline}}
\DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax

\LoadClass[oneside]{\baseclass}

%  Simple interface for the user  to customize the chapter titles 
\ProvideDocumentCommand{\abovechapterskip}{}{\vspace*{2pt}}
\ProvideDocumentCommand{\chapterbelowskip}{}{\vspace*{2pt}}
\ProvideDocumentCommand{\chapterinbetweenskip}{}{\vspace*{2pt}}
\ProvideDocumentCommand{\autodot}{}{}
\ProvideDocumentCommand{\mdtChapapp}{}{}
\ProvideDocumentCommand{\chapteralign}{}{\raggedright}
\ProvideDocumentCommand{\chapterfont}{}{\LARGE\bfseries}
\ProvideDocumentCommand{\chapterprefixfont}{}{\large\bfseries}
% \ProvideDocumentCommand{\chapterfont}{}{\fontsize{16}{18}\selectfont\bfseries}
% \ProvideDocumentCommand{\chapterprefixfont}{}{\fontsize{14}{16}\selectfont\bfseries}
\DeclareDocumentCommand{\@makechapterhead}{ m }{%
	\abovechapterskip
	{\parindent \z@ \chapteralign \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
		\ifbool{chapteroneline}{%
			\chapterfont \mdtChapapp\thechapter\autodot\enspace
		}{%
			\chapterprefixfont \@chapapp\space \thechapter
			\par\nobreak
			\chapterinbetweenskip
		}%
		\fi
		\fi
		\interlinepenalty\@M%
		\chapterfont #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}
\def\@makeschapterhead#1{%
	\abovechapterskip
	{\parindent \z@ \chapteralign
		\normalfont
		\interlinepenalty\@M
		\chapterfont  #1\par\nobreak
		\chapterbelowskip
	}
	\thispagestyle{\chapter@p@gestyle}
}


% Addchap provides unnumbered chapters with an entry in the table of contents as well as an updated header
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeMarkcase{#3}}{\MakeMarkcase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeMarkcase{#2}}{\MakeMarkcase{#2}}%
		}%
	}%
}%

\ProvideDocumentCommand{\addsec}{ s o m }{%
	\section*{#3}%
	\markright{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addcontentsline{toc}{section}{#3}%
			\markright{\MakeMarkcase{#3}}%%
		}{%
			\addcontentsline{toc}{section}{#2}%
			\markright{\MakeMarkcase{#2}}%
		}%
	}%
}%

%----------------------------------------------------------------------------------------
%	CLASS OPTIONS
%----------------------------------------------------------------------------------------

\ifbool{parskip}{\RequirePackage{parskip}} % If the parskip option is passed to the class, require the parskip package 


\ifbool{listtoc}{% If the liststotoc option has been passed to the class, add the lists to the table of contents
	\patchcmd{\listoftables}{\@starttoc{lot}}{%
		\addchaptertocentry{\listtablename}\@starttoc{lot}%
	}{}{}%
	\patchcmd{\listoffigures}{\@starttoc{lof}}{%
		\addchaptertocentry{\listfigurename}\@starttoc{lof}%
	}{}{}%
}

% \ifbool{toctoc}{% If the toctotoc options has been passed to the class, add the table of contents to the table of contents
% 	\patchcmd{\tableofcontents}{\@starttoc{toc}%
% }{%
% 	\addchaptertocentry{\contentsname}\@starttoc{toc}}{}{}%
% }

% Table of Contents configuration - use default behavior like ManitThesis.cls
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
\patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}

% If the option `nolistspacing' is given, the spacing in the different lists is reduced to single spacing. This option is only useful, if the spacing of the document has been changed to onehalfspacing or doublespacing.
\ifbool{nolistspace}{
	\patchcmd{\listoffigures}{%
		\@starttoc{lof}
	}{%
		\begingroup%
		\singlespace\@starttoc{lof}\endgroup%
	}{}{}%
	\patchcmd{\listoftables}{%
		\@starttoc{lot}
	}{%
		\begingroup%
		\singlespace\@starttoc{lot}\endgroup%
	}{}{}%
	\patchcmd{\tableofcontents}{%
		\@starttoc{toc}
	}{%
		\begingroup%
		\singlespace\@starttoc{toc}\endgroup%
	}{}{}%
}{}


%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

% \RequirePackage{babel} % Required for automatically changing names of document elements to languages besides english

\RequirePackage{scrbase} % Required for handling language-dependent names of sections/document elements

\RequirePackage{scrhack} % Loads fixes for various packages

\RequirePackage{setspace} % Required for changing line spacing

% Table of Contents spacing control
\RequirePackage{tocloft} % Required for customizing TOC spacing
\setlength{\cftbeforechapskip}{6pt} % Reduce space before chapter entries
\setlength{\cftbeforesecskip}{3pt} % Reduce space before section entries
\setlength{\cftbeforesubsecskip}{2pt} % Reduce space before subsection entries

\RequirePackage{longtable} % Required for tables that span multiple pages (used in the symbols, abbreviations and physical constants pages)

%\RequirePackage{siunitx} % Required for \SI commands

\RequirePackage{graphicx} % Required to include images
\graphicspath{{Figures/}{./}} % Specifies where to look for included images

\RequirePackage{booktabs} % Required for better table rules

\RequirePackage{caption} % Required for customising the captions
\captionsetup{justification=centerlast,font=small,labelfont=sc,margin=50pt}

%----------------------------------------------------------------------------------------
%	DEFINE CUSTOM THESIS INFORMATION COMMANDS
%----------------------------------------------------------------------------------------

% -------------------------------------
% Thesis Information
% -------------------------------------
\NewDocumentCommand{\thesistitle} { o m }{%
 \IfValueTF{#1}{\def\shorttitle{#1}}{\def\shorttitle{#2}}%
 \def\@title{#2}%
 \def\ttitle{#2}%
}
\DeclareDocumentCommand{\author}{m}{\newcommand{\authorName}{#1}\renewcommand{\@author}{#1}}
\NewDocumentCommand{\department}{m}{\newcommand{\Department}{#1}}
\NewDocumentCommand{\institute}{m}{\newcommand{\Institute}{#1}}
\NewDocumentCommand{\scholarid}{m}{\newcommand{\scholarID}{#1}}
\NewDocumentCommand{\phdstart}{m}{\newcommand{\phdStartDate}{#1}}
\NewDocumentCommand{\phdend}{m}{\newcommand{\phdEndDate}{#1}}

% -------------------------------------
% University Information
% -------------------------------------
\NewDocumentCommand{\university}{m}{\newcommand{\universityName}{#1}}
\NewDocumentCommand{\universitylineone}{m}{\newcommand{\universityLineOne}{#1}}
\NewDocumentCommand{\universitylinetwo}{m}{\newcommand{\universityLineTwo}{#1}}
\NewDocumentCommand{\universitylocation}{m}{\newcommand{\universityLocation}{#1}}

% -------------------------------------
% Examiner, Degree, and Address Information
% -------------------------------------
\NewDocumentCommand{\examiner}{m}{\newcommand{\examinerName}{#1}}
\NewDocumentCommand{\degree}{m}{\newcommand{\degreeName}{#1}}
\NewDocumentCommand{\addresses}{m}{\newcommand{\thesisAddress}{#1}}

% -------------------------------------
% Research Group, Faculty, and Keywords
% -------------------------------------
\NewDocumentCommand{\group}{m}{\newcommand{\researchGroup}{#1}}
\NewDocumentCommand{\faculty}{m}{\newcommand{\facultyName}{#1}}
\NewDocumentCommand{\subject}{m}{\newcommand{\researchSubject}{#1}}
\NewDocumentCommand{\keywordnames}{m}{\newcommand{\thesisKeywords}{#1}}

% -------------------------------------
% Supervisor Information (Primary Supervisor)
% -------------------------------------
\NewDocumentCommand{\supervisor}{m}{\newcommand{\supervisorName}{#1}}
\NewDocumentCommand{\supdesignation}{m}{\newcommand{\supervisorDesignation}{#1}}
\NewDocumentCommand{\supdepartment}{m}{\newcommand{\supervisorDepartment}{#1}}
\NewDocumentCommand{\supinstitute}{m}{\newcommand{\supervisorInstitute}{#1}}

% -------------------------------------
% Co-Supervisor Information (Secondary Supervisor)
% -------------------------------------
\NewDocumentCommand{\cosupervisor}{m}{\newcommand{\cosupervisorName}{#1}}
\NewDocumentCommand{\cosupdesignation}{m}{\newcommand{\cosupervisorDesignation}{#1}}
\NewDocumentCommand{\cosupdepartment}{m}{\newcommand{\cosupervisorDepartment}{#1}}
\NewDocumentCommand{\cosupinstitute}{m}{\newcommand{\cosupervisorInstitute}{#1}}


\newcommand{\checktoopen}{% New command to move content to the next page which prints to the next odd page if twosided mode is active  
	\if@openright\cleardoublepage\else\clearpage\fi
	\ifdef{\phantomsection}{\phantomsection}{}% The \phantomsection command is necessary for hyperref to jump to the correct page
}

\NewDocumentCommand{\bhrule}{}{\typeout{--------------------}}
\NewDocumentCommand{\tttypeout}{m}{\bhrule\typeout{\space #1}\bhrule}

\newcommand{\HRule}{\rule{.9\linewidth}{.6pt}} % New command to make the lines in the title page
\newcommand{\decoRule}{\rule{.8\textwidth}{.4pt}} % New command for a rule to be used under figures

\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
	\addcontentsline{toc}{chapter}{#1}%
}

%----------------------------------------------------------------------------------------
%	COLOURS
%----------------------------------------------------------------------------------------

\usepackage{xcolor} % Required for specifying custom colours

\colorlet{mdtRed}{red!50!black}



%----------------------------------------------------------------------------------------
%	PENALTIES
%----------------------------------------------------------------------------------------

\doublehyphendemerits=10000 % No consecutive line hyphens
\brokenpenalty=10000 % No broken words across columns/pages
\widowpenalty=9999 % Almost no widows at bottom of page
\clubpenalty=9999 % Almost no orphans at top of page
\interfootnotelinepenalty=9999 % Almost never break footnotes

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS - DISABLED (Simple page numbers only)
%----------------------------------------------------------------------------------------

% Use plain pagestyle with no headers, just page numbers at bottom center
\pagestyle{plain}


\newcommand{\blank@p@gestyle}{empty}
\newcommand{\chapter@p@gestyle}{plain}
\NewDocumentCommand{\blankpagestyle}{ m }{%
	\ClassWarning{\classname}{\string\blankpagestyle\space is
	obsolete,\MessageBreak use \string\setblankpagestyle \space  instead}\renewcommand{\blank@p@gestyle}{}{#1}
}
\NewDocumentCommand{\setblankpagestyle}{ m }{\renewcommand{\blank@p@gestyle}{#1}}
\NewDocumentCommand{\setchapterpagestyle}{ m }{\renewcommand{\chapter@p@gestyle}{#1}}

\DeclareDocumentCommand\cleardoublepage{}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{\blank@p@gestyle}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

%----------------------------------------------------------------------------------------
%	HYPERREF SETUP
%----------------------------------------------------------------------------------------

\ifbool{hyperrefsupport}{% If the nohyperref class option has not been specified
\AtEndPreamble{\RequirePackage{hyperref}
\hypersetup{pdfpagemode={UseOutlines},
bookmarksopen=true,
bookmarksopenlevel=0,
hypertexnames=false,
pdfstartview={FitV},
unicode,
breaklinks=true,
}

\pdfstringdefDisableCommands{% If there is an explicit linebreak in a section heading (or anything printed to the pdf-bookmarks), it is replaced by a space
	\let\\\space%
}
	}
}{%nothing
}

%----------------------------------------------------------------------------------------

\endinput
% lazyLizardTracer
