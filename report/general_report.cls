% The following template make from inspiration by Argonne National Laboratory's anlreport.cls file. 
% Additional formatting inspiration came from https://github.com/arfc/report-template

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{general_report}[2026 Custom Report Class]

\LoadClass[11pt, letterpaper]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage{tgpagella}
\RequirePackage{mathtools}
\RequirePackage{geometry}
\RequirePackage{microtype}
\RequirePackage{titlesec}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{setspace}
\RequirePackage{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{apptools}
\RequirePackage{units}
\RequirePackage[labelfont=bf]{caption}
\RequirePackage{amsthm}
\RequirePackage{bm}
\RequirePackage{subcaption}
\RequirePackage{longfbox}
\RequirePackage{eso-pic}
\RequirePackage{physics2}
\RequirePackage{derivative}
\RequirePackage{parskip}
\RequirePackage{mdframed}

\RequirePackage[noabbrev,capitalize]{cleveref}

\geometry{margin=1in}

% \titleformat{\section}{\normalfont\Large\bfseries}{\thesection.}{1em}{}
\AtAppendix{\titleformat{\section}{\normalfont\Large\bfseries}{Appendix~\thesection: }{1em}{}}

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  filecolor=magenta,
  urlcolor=blue,
  citecolor=black
}

\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.7}
\floatplacement{figure}{H}

\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{20pt}

%==============================================================================%
% NEW COMMANDS
%==============================================================================%
% ------------ Helper macro: executes #2 only if #1 is not empty  ------------
\newcommand{\IfNotEmpty}[2]{%
  \edef\temp{#1}%
  \ifx\temp\empty
    % do nothing
  \else
    #2%
  \fi
}
% ------------ Text Box position ------------
\newcommand{\placetextbox}[7]{
  \setbox0=\hbox{#7}
  \AddToShipoutPictureFG*{
    \put(\LenToUnit{#1\paperwidth},\LenToUnit{#2\paperheight}){\vtop{{\null}
        \begin{longfbox}[width={#3\paperwidth}, height={#4\paperheight},#6]
        \begin{#5}#7\end{#5}
        \end{longfbox}
      }}
  }
}

\onehalfspacing

% ------------ Subtitle ------------
\newcommand\subtitle[1]{\renewcommand\@subtitle{#1}}
\newcommand\@subtitle{}

% ------------ Author List ------------
\newcommand\authoronelist[1]{\renewcommand\@authoronelist{#1}}
\newcommand\@authoronelist{}
\newcommand\authortwolist[1]{\renewcommand\@authortwolist{#1}}
\newcommand\@authortwolist{}
\newcommand\authorthreelist[1]{\renewcommand\@authorthreelist{#1}}
\newcommand\@authorthreelist{}

% ------------ Author Titles ------------
\newcommand\authoronetitle[1]{\renewcommand\@authoronetitle{#1}}
\newcommand\@authoronetitle{}
\newcommand\authortwotitle[1]{\renewcommand\@authortwotitle{#1}}
\newcommand\@authortwotitle{}
\newcommand\authorthreetitle[1]{\renewcommand\@authorthreetitle{#1}}
\newcommand\@authorthreetitle{}

% ------------ Department Info ------------
\newcommand\authoronedepart[1]{\renewcommand\@authoronedepart{\textsc{#1}}}
\newcommand\@authoronedepart{}
\newcommand\authortwodepart[1]{\renewcommand\@authortwodepart{\textsc{#1}}}
\newcommand\@authortwodepart{}
\newcommand\authorthreedepart[1]{\renewcommand\@authorthreedepart{\textsc{#1}}}
\newcommand\@authorthreedepart{}

% ------------ Affiliation Info ------------
\newcommand\authoroneaffil[1]{\renewcommand\@authoroneaffil{\textsc{#1}}}
\newcommand\@authoroneaffil{}
\newcommand\authortwoaffil[1]{\renewcommand\@authortwoaffil{\textsc{#1}}}
\newcommand\@authortwoaffil{}
\newcommand\authorthreeaffil[1]{\renewcommand\@authorthreeaffil{\textsc{#1}}}
\newcommand\@authorthreeaffil{}

%==============================================================================%
% TITLE PAGE
%==============================================================================%
\newcommand\@titlepage{
  % Roman page numbers starting here.
  \pagenumbering{roman}
  \setcounter{page}{0}

  % Title.
  \placetextbox{0.12}{0.95}{0.70}{0.25}{flushleft}{height-align=bottom,border-style=none}{
    \color{black}
    \fontfamily{qpl}\fontsize{18}{20}\selectfont\bfseries{{\selectfont\@title}}\\ \rule{23em}{1pt}
  }

  % Subtitle.
  \placetextbox{0.12}{0.70}{0.70}{0.25}{flushleft}{height-align=top,border-style=none}{
    \color{black}
    \fontfamily{qpl}\fontsize{14}{14}\selectfont\textit{\@subtitle}
  }

  % Authors
  \placetextbox{0.12}{0.60}{0.75}{1.25}{flushleft}{height-align=top,border-style=none}{%
    \color{black}%
    \fontfamily{qpl}\fontsize{11}{15}\selectfont%
    \textit{Prepared by:} \\
    \vspace{18pt}

    \@authoronelist \\
    \@authoronetitle \\
    \@authoronedepart \\
    \@authoroneaffil \\

    \vspace{18pt}

    \IfNotEmpty{\@authortwolist}{
      \@authortwolist \\
      \@authortwotitle \\
      \@authortwodepart \\
      \@authortwoaffil \\

      \vspace{18pt}
    }

    \IfNotEmpty{\@authorthreelist}{
      \@authorthreelist \\
      \@authorthreetitle \\
      \@authorthreedepart \\
      \@authorthreeaffil \\

      \vspace{18pt}
    }
    \vspace{18pt}
    \@date

    % \vspace{12pt}
    % \IfNotEmpty{\@gradstudentcontribs}{\@gradstudentcontribs \par Graduate Students \par \vspace{18pt}}%
    % \IfNotEmpty{\@undergradstudentcontribs}{\@undergradstudentcontribs \par Undergraduate Students \par \vspace{18pt}}%

  }%


  \clearpage
}

%==============================================================================%
% BLANK PAGE
%==============================================================================%
\newcommand\blankpage{
  \clearpage
  \hbox{\space}
  \vspace{1.75in}
  \clearpage
}

%==============================================================================%
% FOREWORD PAGE
%==============================================================================%
\newenvironment{foreword}{%
  \clearpage
  \pagestyle{fancy}% <-- add this
  \fancyhf{}
  \fancyfoot[C]{\thepage}%
  \section*{Foreword}%
  \addcontentsline{toc}{section}{Foreword}%
}{%
  \clearpage
}

%==============================================================================%
% FRONT MATTER
%==============================================================================%
\newcommand\frontmatter{
  \@titlepage
  \blankpage
  % \blankpage
}
\makeatother



\endinput
