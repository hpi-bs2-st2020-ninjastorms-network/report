%%
%% This is file `hpitr.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% hpitr.dtx  (with options: `class')
%% Copyright (c) Daniel Richter, Uwe Hentschel 2013-2014
%% Copyright (c) Tobias Pape, 2014-2019
%% 
%% This file was generated from file(s) of hpitr distribution.
%% ----------------------------------------------------------------------
%% 
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, version 1.3c of the license.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status "maintained".
%% 
%% The Current Maintainer and author of this work is Tobias Pape.
%% 
%% This file may only be distributed together with the file
%% `hpitr.dtx'. You may however distribute the file `hpitr.dtx'
%% without this file.
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hpitr}%
[%
  2019/11/20 v2.0
^^J
  A unified class for Technical Reports at the HPI
]
\edef\TR@ClassName{\@currname}
\RequirePackage{hardwrap}
\def\HardWrapSetup{%
  \def\MessageBreak{\\}%
  \def\newline{\\}}
\GenerateLogMacros{class}[TR]{\TR@ClassName}
\newcommand*\TR@fonterror{\TR@error{%
    Old font commands are not to be used}}
\RequirePackage{etexcmds,etoolbox,xpatch,ltxcmds}
\RequirePackage{scrbase}[2013/12/19]
\RequirePackage{ifthen,ifdraft,ifxetex,ifluatex}
\newcommand*\@pushback@classoption[1]{%
  \xdef\@classoptionslist{%
    \ifx\@classoptionslist\@empty\else\@classoptionslist,\fi
    #1}%
}
\newcommand*{\TR@NowButAtEndOfClass}{\AtEndOfClass}
\AtEndOfClass{\let\TR@NowButAtEndOfClass\@firstofone}
\DefineFamily{hpitr}
\def\TRFamily{\DefineFamilyMember{hpitr}}
\TRFamily%

\newcommand*{\TRKey}[1][.\@currname.\@currext]{%
  \DefineFamilyKey[#1]{hpitr}%
}
\newcommand*{\TRExecuteOptions}[1][.\@currname.\@currext]{%
  \FamilyExecuteOptions[#1]{hpitr}%
}
\newcommand*{\TRoptions}{\FamilyOptions{hpitr}}
\newcommand*{\AfterTRoptions}{}
\let\AfterTRoptions\AtEndOfFamilyOptions
\newcommand*{\TRoption}{\FamilyOption{hpitr}}

\newcommand*{\TRnewif}{\TRFamily\FamilyBoolKey{hpitr}}
\newcommand*{\TRsetif}{\FamilySetBool{hpitr}}
\newcommand*{\TRnewnumc}{\TRFamily\FamilyNumericalKey{hpitr}}
\newcommand*{\TRsetnumc}{\FamilySetNumerical{hpitr}}

\newcommand*{\TRnewifStd}[1]{%
  \newbool{TR@#1}
  \TRnewif{#1}{TR@#1}}

\newcommand*{\TR@curropt}{}
\newcommand*{\TRStdOption}[3][]{%
  \let\TR@curropt\CurrentOption
  \DeclareOption{#2}{
    #1%
    \TRExecuteOptions{#3}}
  \let\CurrentOption\TR@curropt
}

\providebool{@draft}
\newbool{TR@fulldraft}
\TRKey{draft}[true]{%
  \TRsetif{draft}{@draft}{#1}%
  \ifx\FamilyKeyState\FamilyKeyStateProcessed
    \boolfalse{TR@fulldraft}
  \else
    \ifstr{#1}{full}{%
      \booltrue{@draft}
      \booltrue{TR@fulldraft}
    }{}
  \fi
  \AfterTRoptions{
    \ifthenelse{\boolean{@draft}}{
      \@pushback@classoption{draft}
      \ifthenelse{\not\boolean{TR@fulldraft}}{
        \PassOptionsToPackage{draft=false}{scrlayer-scrpage}
        \PassOptionsToPackage{final}{listings}
        \AtBeginDocument{\Gin@draftfalse}
      }{}
    }{}
  }
}
\TRStdOption{final}{draft=false}
\TRStdOption{draft}{draft=true}

%% name of the base class
\providecommand*\TR@BaseClass{\@empty}

\newbool{TR@firsttitleseen}
\boolfalse{TR@firsttitleseen}
\TRnewifStd{contribtools}
\TRStdOption{contribtools}{contribtools=true}
\newcommand*\setcontribmaketitle{%
  \AtBeginDocument{%
    \ifthenelse{\boolean{TR@contribtools}}%
      {\booltrue{TR@firsttitleseen}%
        \let\maketitle\TR@contrib@maketitle%
        \let\author\TR@contrib@author%
        \lehead{\TR@titlemark}}
      {}}}
\newbool{TR@proceedings}
\newbool{TR@collection}
\newbool{TR@inproceedings}
\newbool{TR@chapters}
\booltrue{TR@chapters}
\TRnewifStd{chapterbib}
\TRStdOption{chapterbib}{chapterbib=true}
\TRnewifStd{copyrightmark}
\TRStdOption{copyrightmark}{copyrightmark=true}
\TRStdOption{nocopyrightmark}{copyrightmark=false}
\TRKey{trtype}{
  \TRsetnumc{trtype}{@tempa}{%
    {singlearticle}{0},{article}{0},%
    {singlereport}{1},{report}{1},%
    {proceedings}{2},%
    {collection}{3},%
    {inproceedings}{4}%
  }{#1}
  \ifcase \@tempa\relax
    \renewcommand*\TR@BaseClass{scrartcl}
    \boolfalse{TR@proceedings}
    \boolfalse{TR@collection}
    \boolfalse{TR@chapters}
    \boolfalse{TR@contribtools}
  \or
    \renewcommand*\TR@BaseClass{scrreprt}
    \boolfalse{TR@proceedings}
    \booltrue{TR@chapters}
    \boolfalse{TR@collection}
    \boolfalse{TR@contribtools}
  \or
    \renewcommand*\TR@BaseClass{scrbook}
    \booltrue{TR@proceedings}
    \booltrue{TR@contribtools}
    \boolfalse{TR@collection}
    \booltrue{TR@chapters}
    \booltrue{TR@chapterbib}
  \or
    \renewcommand*\TR@BaseClass{scrbook}
    \boolfalse{TR@proceedings}
    \booltrue{TR@collection}
    \booltrue{TR@contribtools}
    \booltrue{TR@chapters}
  \or
    \renewcommand*\TR@BaseClass{scrartcl}
    \booltrue{TR@proceedings}
    \booltrue{TR@contribtools}
    \boolfalse{TR@collection}
    \boolfalse{TR@chapters}
    \boolfalse{TR@chapterbib}
    \booltrue{TR@inproceedings}
    \AtBeginDocument{%
      \booltrue{TR@firsttitleseen}%
      \clearheadinfo%
      }
  \fi
}
\TRStdOption{single}{trtype=singlereport}
\TRStdOption{singlereport}{trtype=singlereport}
\TRStdOption{singlearticle}{trtype=singlearticle}
\TRStdOption{proceedings}{trtype=proceedings}
\TRStdOption{inproceedings}{trtype=inproceedings}
\TRStdOption{collection}{trtype=collection}
\TRnewifStd{inproceedingspagenumbers}
\def\TR@toc@enable#1{\AtBeginDocument{%
    \global\csletcs{#1tocdepth}{TR@toc@#1@level}%
    \global\csletcs{toclevel@#1}{TR@toc@#1@toclevel}}}
\def\TR@toc@disable#1{\AtBeginDocument{%
    \global\csdef{#1tocdepth}{9999}%
    \global\cslet{toclevel@#1}\maxdimen}}
\TRKey{intoc}{
  \TRsetnumc{intoc}{@tempa}{%
    {title}{0}, {notitle}{1},%
    {author}{2}, {noauthor}{3},%
    {affiliation}{4}, {noaffiliation}{5},%
    {principalInvestigator}{6}, {noprincipalInvestigator}{7},%
    {event}{8}, {noevent}{9},%
    {all}{10}%
  }{#1}
  \ifcase \@tempa\relax
     \TR@toc@enable{title}
  \or\TR@toc@disable{title}
  \or\TR@toc@enable{author}
  \or\TR@toc@disable{author}
  \or\TR@toc@enable{affiliation}
  \or\TR@toc@disable{affiliation}
  \or\TR@toc@enable{principalInvestigator}
  \or\TR@toc@disable{principalInvestigator}
  \or\TR@toc@enable{event}
  \or\TR@toc@disable{event}
  \or
    \TR@toc@enable{title}
    \TR@toc@enable{author}
    \TR@toc@enable{affiliation}
    \TR@toc@enable{principalInvestigator}
    \TR@toc@enable{event}
  \else
    \TR@error{Unknown key #1}
  \fi
}
\TRnewifStd{todotools}
\TRnewifStd{egiecomma}

\errorcontextlines=999
%% execute the standard options
\TRExecuteOptions{
  trtype=singlereport,%
  copyrightmark=true,%
}
\TRExecuteOptions{
  intoc=noevent,%
  intoc=noprincipalInvestigator,%
  intoc=title,%
  intoc=author,%
  intoc=noaffiliation,%
}

\FamilyProcessOptions{hpitr}\relax
\LoadClass{\TR@BaseClass}
\RequirePackage[LGR,OT1,LY1,T1]{fontenc}
\ifthenelse{\boolean{xetex} \or \boolean{luatex}}{}{%
  \RequirePackage[utf8]{inputenx}
  \input{ix-utf8enc.dfu}
  \RequirePackage{alphabeta}
}
\ifthenelse{\boolean{luatex}}{%
  \IfFileExists{luatex85.sty}{%
    \RequirePackage{luatex85}}{}}{}%
\KOMAoptions{
  twocolumn=false,
  fontsize=11pt,
  footinclude=false,
  headinclude=false,
}
\KOMAoptions{%
  pagesize=auto,
  paper=a4,
  DIV=9,
  twoside=semi,
}
\areaset[current]{\textwidth}{1.61803399\textwidth}

\AtEndPreamble{\recalctypearea}
\ifthenelse{\boolean{TR@proceedings}\AND\boolean{TR@chapters}}{
  \KOMAoption{open}{right}
}{}
\IfFileExists{latexrelease.sty}%
   {\PreventPackageFromLoading*[%
     \typeout{avoid fixltx2e if it does nothing in the first place}]%
   {fixltx2e}}
   {\RequirePackage{fixltx2e}}%
\RequirePackage{scrhack}

\PassOptionsToPackage{log-declarations=false}{xparse}
\RequirePackage{expl3}[2011/09/05]
\RequirePackage{xparse}
\ExplSyntaxOn
\cs_if_free:NTF \fp_div:Nn
  {
    \cs_new_protected:Npn \fp_div:Nn #1 #2
      {
        \fp_set:Nn #1 { #1/#2 }
      }
  }{}
\ExplSyntaxOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Title.
%%
%% No actual title, only a titlepage page when in draft mode.
%%
%% However, we collect the information for the pdf and also for
%% convenience.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@ifpackagelater{scrbase}{2013/12/19}{%
  \KOMAoption{titlepage}{firstiscover}
}{
  \KOMAoption{titlepage}{yes}
}

\xapptocmd{\title}{%
  \AfterPreamble{
    \begingroup
    \appto\pdfstringdefPreHook{\def\\{\space\ignorespaces}}
    \hypersetup{pdftitle={#1}}
    \endgroup}}
{}{%
  \TR@warning@noline{Cannot patch \string\title to set pdftitle}}

\xapptocmd{\author}{%
  \AfterPreamble{
    \begingroup
    \appto\pdfstringdefPreHook{\def\and{,\space\ignorespaces}}
    \hypersetup{pdfauthor={#1}}
    \endgroup}
  }
{}{%
  \TR@warning@noline{Cannot patch \string\author to set pdfauthor}}

\providecommand*\email[1]{\href{mailto:#1}{\nolinkurl{#1}}\xspace}
\providecommand*\hairspace{\ifmmode\mskip1mu\else\kern0.08em\fi}
\ifthenelse{\boolean{TR@egiecomma}}{
  \providecommand*\eg{e.\hairspace{}g.,\xspace}
  \providecommand*\Eg{E.\hairspace{}g.,\xspace}
  \providecommand*\Ie{I.\hairspace{}e.,\xspace}
  \providecommand*\ie{i.\hairspace{}e.,\xspace}
}{
  \providecommand*\eg{e.\hairspace{}g.\xspace}
  \providecommand*\Eg{E.\hairspace{}g.\xspace}
  \providecommand*\Ie{I.\hairspace{}e.\xspace}
  \providecommand*\ie{i.\hairspace{}e.\xspace}
}
\providecommand*\zB{z.\hairspace{}B.\xspace}
\providecommand*\ZB{Z.\hairspace{}B.\xspace}
\providecommand*\dh{d.\hairspace{}h.\xspace}
\providecommand*\Dh{D.\hairspace{}h.\xspace}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{@draft}}{
  \AtBeginDocument{
    \setkomafont{author}{\normalfont\normalsize}
    \setkomafont{date}{\normalfont\normalsize}
    \setkomafont{dedication}{\normalfont\normalsize}
    \setkomafont{publishers}{\normalfont\normalsize}
    \setkomafont{subtitle}{\normalfont\small}
    \setkomafont{title}{\normalfont\normalsize}
    \setkomafont{titlehead}{\normalfont\normalsize}
  }
  \pretocmd{\titlepage}{%
    \ifthenelse{\boolean{@mainmatter}}{\pagenumbering{Roman}}{}
    \let\center\flushright%
    \let\endcenter\endflushright%
    \let\huge\normalsize%
  }{}{%
    \TR@warning@noline{Cannot patch \string\maketitle}}
  \xapptocmd{\endtitlepage}{%
    \cleardoubleemptypage%
    \ifthenelse{\boolean{@mainmatter}}{%
      \pagenumbering{arabic}}{%
      \pagenumbering{roman}}
      \ifthenelse{\boolean{TR@inproceedingspagenumbers}}{}{%
        \setcounter{page}{5}%
      }
    \relax%
  }{}{%
    \TR@warning@noline{Cannot patch \string\maketitle}}
}{%
  \def\maketitle{%
    \ifthenelse{\boolean{TR@inproceedingspagenumbers}}{}{%
      \setcounter{page}{5}%
    }\relax}
}

\def\TR@toc@event@level{-1}
\let\TR@toc@event@toclevel\TR@toc@event@level
\def\TR@toc@principalInvestigator@level{-1}
\let\TR@toc@principalInvestigator@toclevel\TR@toc@principalInvestigator@level
\def\TR@toc@title@level{0}
\let\TR@toc@title@toclevel\TR@toc@title@level
\def\TR@toc@author@level{0}
\let\TR@toc@author@toclevel\maxdimen
\def\TR@toc@affiliation@level{0}
\let\TR@toc@affiliation@toclevel\maxdimen
\def\TR@toc@event@indent{0pt}
\def\TR@toc@principalInvestigator@indent{%
  \ifnum\numexpr\eventtocdepth\relax>\numexpr\principalInvestigatortocdepth\relax%
  0pt\else\the\dimexpr\TR@toc@event@indent + 15pt\relax\fi}
\def\TR@toc@title@indent{%
  \ifnum\numexpr\principalInvestigatortocdepth\relax>\numexpr\titletocdepth\relax%
  0pt\else\TR@toc@principalInvestigator@indent\fi}
\def\TR@toc@author@indent{\the\dimexpr\TR@toc@title@indent +15pt\relax}
\let\TR@toc@affiliation@indent\TR@toc@author@indent
\ifthenelse{\boolean{TR@chapters}}{}{
    \CloneTOCEntryStyle{section}{chapter}}
\CloneTOCEntryStyle{chapter}{event}
\TOCEntryStyleStartInitCode{event}{%
  \expandafter\providecommand%
  \csname scr@tso@#1@pagenumberformat\endcsname[1]{}%
  \expandafter\providecommand%
  \csname scr@tso@#1@indent\endcsname{\csuse{TR@toc@#1@indent}}
}
\DeclareTOCStyleEntry[level=\TR@toc@event@level,numwidth=1.5em,beforeskip=\baselineskip]{event}{event}
\CloneTOCEntryStyle{chapter}{principalInvestigator}
\TOCEntryStyleStartInitCode{principalInvestigator}{%
  \expandafter\providecommand%
  \csname scr@tso@#1@pagenumberformat\endcsname[1]{}%
  \expandafter\providecommand%
  \csname scr@tso@#1@indent\endcsname{\csuse{TR@toc@#1@indent}}
}
\DeclareTOCStyleEntry[level=\TR@toc@principalInvestigator@level,numwidth=1.5em,beforeskip=\baselineskip]{principalInvestigator}{principalInvestigator}
\CloneTOCEntryStyle{section}{title}
\TOCEntryStyleStartInitCode{title}{%
  \expandafter\providecommand%
  \csname scr@tso@#1@indent\endcsname{\csuse{TR@toc@#1@indent}}
}
\DeclareTOCStyleEntry[level=\TR@toc@title@level,numwidth=1.5em,beforeskip=\baselineskip]{title}{title}
\CloneTOCEntryStyle{section}{author}
\TOCEntryStyleStartInitCode{author}{%
  \expandafter\providecommand%
  \csname scr@tso@#1@entryformat\endcsname[1]{\itshape ##1}%
  \expandafter\providecommand%
  \csname scr@tso@#1@pagenumberformat\endcsname[1]{}%
  \expandafter\providecommand%
  \csname scr@tso@#1@linefill\endcsname{\hfill}
  \expandafter\providecommand%
  \csname scr@tso@#1@indent\endcsname{\csuse{TR@toc@#1@indent}}
}
\TOCEntryStyleInitCode{author}{
  \AtBeginDocument{\csletcs{toclevel@#1}{TR@toc@#1@toclevel}}
}
\DeclareTOCStyleEntry[level=\TR@toc@author@level,numwidth=0pt]{author}{author}
\CloneTOCEntryStyle{author}{affiliation}
\TOCEntryStyleStartInitCode{affiliation}{%
  \expandafter\providecommand%
  \csname scr@tso@#1@entryformat\endcsname[1]{{%
    \def\and{\unskip\newline}%
    \itshape ##1}}%
}
\DeclareTOCStyleEntry[level=\TR@toc@affiliation@level,numwidth=0pt]{affiliation}{affiliation}
\ifthenelse{\boolean{TR@proceedings}\OR\boolean{TR@contribtools}}{
  \newcommand*\event[1]{%
    \gdef\@eventtitle{#1}%
    \let\@principalInvestigator\@empty
    \let\@lastprincipalInvestigator\@empty
    \AfterPreamble{\hypersetup{pdfsubject = {Technical Report: #1}}}}
  \def\@eventtitle{%
    \TR@warning{No \string\event\space given}
    \global\cslet{@eventtitle}\@empty}
  \let\@lastevent\@empty
  \newcommand*\noevent{\gdef\@eventtitle{}}
  \newcommand{\papernumber}[1]{%
    \def\@papernumber{#1}
    \ifx\@papernumber\empty
    \else
      \renewcommand*{\thepage}{\@papernumber-\arabic{page}}
    \fi
  }
  \let\@papernumber\@empty

  \newcommand*\principalInvestigator[1]{%
    \gdef\@principalInvestigator{#1}}
  \let\@principalInvestigator\@empty
  \let\@lastprincipalInvestigator\@empty
  \RequirePackage{ragged2e,trimspaces,appendix}
  \renewcommand{\setthesection}{\Alph{section}}
  \renewcommand{\restoreapp}{}
  \ifthenelse{\boolean{TR@inproceedings}}%
    {}%
    {\ifthenelse{\boolean{TR@proceedings}\OR\boolean{TR@collection}}%
      {\AtEndPreamble{\RequirePackage{biblatex}}}%
      {}}
  \providecommand\TR@contributions{}
  \newcommand*{\contributions}[1]{%
    \xdef\TR@contributions{#1}%
    \configureContributions%
  }
  \newcommand*{\TR@preamble}[1]{%
      \InputIfFileExists {#1/preamble}{}{}%
      \ifthenelse{\boolean{TR@chapterbib}}{}{%
        \addbibresource{#1/references.bib}
      }}

  \newcommand*{\configureContributions}{%
    \def\doit{}%
    \@for\next:=\TR@contributions\do{%
      \expandafter\edef\expandafter\@tempa\expandafter%
      {\expandafter\trim@spaces\expandafter{\next}}
      \ifx\@empty\@tempa\relax\else%
      \expandafter\appto\expandafter\doit\expandafter%
      {\expandafter\TR@preamble\expandafter{\@tempa}}%
      \fi%
    }%
    \doit{}%
  }
  \newcommand*{\includeContributionContents}{%
    \def\doit{}%
    \@for\next:=\TR@contributions\do{%
      \expandafter\edef\expandafter\@tempa\expandafter%
      {\expandafter\trim@spaces\expandafter{\next}}
      \ifx\@empty\@tempa\else%
      \expandafter\appto\expandafter\doit\expandafter%
      {\expandafter\TR@includedir\expandafter{\@tempa}}%
      \fi%
    }%
    \doit{}%
  }
  \newcommand*{\TR@includedir}[1]{%
    \global\let\TR@saved@include\include
    \global\let\TR@saved@input\input
    \gdef\include##1{%
      \IfFileExists{#1/##1}{%
        \TR@saved@include{#1/##1}
      }{%
        \TR@saved@include{##1}}}
    \gdef\input##1{%
      \IfFileExists{#1/##1}{%
        \TR@saved@input{#1/##1}%
      }{%
        \TR@saved@input{##1}}}
    \graphicspath{{#1/}}
    \ltx@ifpackageloaded{listings}{\lstset{inputpath=#1/}}{}
    \TR@includedir@{#1}
    \global\let\include\TR@saved@include%
    \global\let\input\TR@saved@input%
  }
  \ifthenelse{\boolean{TR@chapterbib}}{%
    \newcommand*{\TR@includedir@}[1]{%
      \begin{refsection}[#1/references.bib]
        \ifthenelse{\boolean{TR@proceedings}}{%
          \cleardoubleemptypage}{\clearpage}%
        \begingroup%
        \TR@saved@input{#1/content}%
        \IfFileExists{#1/appendix}{%
          \begin{subappendices}
          \TR@saved@input{#1/appendix}%
          \end{subappendices}
        }{}%
        \printbibliography[%
          heading=subbibliography, %
          title=\refname, %
        ]%
        \endgroup%
      \end{refsection}}
  }{%
    \newcommand*{\TR@includedir@}[1]{%
      \ifthenelse{\boolean{TR@proceedings}}{\cleardoubleemptypage}{\clearpage}%
      \begingroup
      \TR@saved@input{#1/content}%
      \IfFileExists{#1/appendix}{%
        \begin{subappendices}%
        \TR@saved@input{#1/appendix}%
        \endgroup%
        }{}%
      \endgroup%
    }
  }

  \def\clearheadinfo{%
    \gdef\@author{No Author Given}%
    \gdef\@title{No Title Given}%
    \gdef\@subtitle{}%
    \gdef\@affiliation{No Affiliation Given}%
    \gdef\@thanks{}%
    \global\let\@titlerunning\@empty% only non-proceedings
  }
  \def\affiliation#1{\gdef\@affiliation{#1}}
  \newkomafont{abstract}{\normalfont}
  \newkomafont{institute}{\normalfont}
  \def\institute#1{\usekomafont{institute}#1}
  \newkomafont{organization}{\normalfont}
  \def\organization#1{\usekomafont{organization}#1}
  \let\organisation\organization
  \newkomafont{group}{\normalfont}
  \def\group#1{\usekomafont{group}#1}

  \newcounter{@affil}
  \newcounter{@auth}
  \newcounter{auco}
  \newbox\headrun
  \newbox\authrun
  \newtoks\authorrunning
  \newtoks\tocauthor
  \newtoks\titlerunning
  \newtoks\toctitle

  \def\affiliationtext{\par\begingroup
    \parskip=\z@
    \parindent=\z@
    \setcounter{@affil}{1}%
    \def\and{\par\stepcounter{@affil}%
      \noindent\textsuperscript{\the@affil}\enspace\ignorespaces}%
    \setbox0=\vbox{\def\thanks##1{}\@affiliation}%
    \ifnumequal{\value{@affil}}{1}%
      {\gdef\fnnstart{0}}
      {\xdef\fnnstart{\value{@affil}}%
      \setcounter{@affil}{1}%
      \noindent\textsuperscript{\the@affil}\enspace}
    \ignorespaces
    \csuse{@affiliation}\par
    \endgroup}
  \def\affil#1{\unskip\textsuperscript{#1}}
  \ifthenelse{\boolean{TR@inproceedings}}{%
    \def\TR@recordmetadata{%
      \begingroup
        \def\and{\noexpand\protect\noexpand\and}%
        \def\usekomafont##1{}
        \def\institute##1{\noexpand\protect\noexpand\institute{##1}}
        \def\organization##1{\noexpand\protect\noexpand\organization{##1}}
        \def\organisation##1{\noexpand\protect\noexpand\organisation{##1}}
        \def\group##1{\noexpand\protect\noexpand\group{##1}}
        \def\affil##1{\noexpand\protect\noexpand\affil{##1}}
        \def\email##1{\noexpand\protect\noexpand\email{##1}}
        \def\@contentsfile{\jobname.pdf}
        \newsavebox{\TR@devnull}%
        \def\record##1##2{
          \sbox{\TR@devnull}{##2}%
          \ifdefvoid##2{}{\addtocontents{prc}{\protect##1{##2}}}}
        \record{\title}{\@title}
        \record{\subtitle}{\@subtitle}
        \record{\author}{\@author}
        \record{\event}{\@eventtitle}
        \record{\principalInvestigator}{\@principalInvestigator}
        \record{\papernumber}{\@papernumber}
        \record{\affiliation}{\@affiliation}
        \record{\file}{\@contentsfile}
      \endgroup
      \if@filesw
        \expandafter\newwrite\csname tf@prc\endcsname
        \immediate\openout \csname tf@prc\endcsname \jobname.prc\relax
      \fi
    }
  }{}
  \let\TR@firsttitle@maketitle\maketitle
  \renewcommand*\maketitle{
    \ifthenelse{\boolean{TR@firsttitleseen}}{%
      \TR@contrib@maketitle%
      }{
        \TR@firsttitle@maketitle%
        \clearheadinfo%
        \booltrue{TR@firsttitleseen}}}
    % we switch to title seen also when people do not use \maketitle
    \xapptocmd{\tableofcontents}{\booltrue{TR@firsttitleseen}}{}{%
      \TR@warning@noline{Cannot patch \string\tableofcontents}}

  \let\TR@firsttitle@author\author
  \renewcommand*\author{
    \ifthenelse{\boolean{TR@firsttitleseen}}%
    {\TR@contrib@author}%
    {\TR@firsttitle@author}}

  \AtEndOfClass{
    \let\TR@firsttitle@keywords\keywords
    \renewcommand*\keywords{%
      \ifthenelse{\boolean{TR@firsttitleseen}}%
      {\TR@contrib@keywords}%
      {\TR@firsttitle@keywords}}
  }

  \providecaptionname{english}{\andname}{and}
  \providecaptionname{english}{\lastandname}{\unskip, and}
  \providecaptionname{german}{\andname}{und}
  \providecaptionname{german}{\lastandname}{und}
  \providecaptionname{ngerman}{\andname}{und}
  \providecaptionname{ngerman}{\lastandname}{und}

  \def\TR@authcount#1{\setcounter{auco}{#1}\setcounter{@auth}{1}}
  \pretocmd{\tableofcontents}{%
    \let\authcount\TR@authcount%
    \def\lastand{\ifnum\value{auco}=2\relax
        \unskip{} \andname\
      \else
        \unskip \lastandname\
      \fi}%
    \def\and{\csname\endcsname\stepcounter{@auth}\relax
      \ifnum\value{@auth}=\value{auco}%
        \lastand
      \else
        \unskip,
      \fi}%
  }{}{%
    \TR@warning@noline{Cannot patch \string\tableofcontents}}

  \newcommand*\TR@contrib@maketitle{\newpage
      \phantomsection
      \ifthenelse{\boolean{TR@chapters}}%
        {\refstepcounter{chapter}}%
        {}
      \stepcounter{section}%
      \setcounter{section}{0}%
      \setcounter{subsection}{0}%
      \setcounter{figure}{0}
      \setcounter{table}{0}
      \setcounter{equation}{0}
      \setcounter{footnote}{0}%
      \begingroup
        \parindent=\z@
        \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
        \newpage
      \global\@topnum\z@
      \TR@contrib@@maketitle
      \ifthenelse{\boolean{TR@chapters}}%
        {\thispagestyle{\chapterpagestyle}}%
        {\thispagestyle{empty}}%
      \@thanks
      \ifthenelse{\boolean{TR@inproceedings}}{\TR@recordmetadata}{}
      \def\\{\unskip\ \ignorespaces}%
      \def\thanks##1{\unskip{}}%
      \if!\the\toctitle!\relax
        \protected@xdef\@toctitle{\@title}%
      \else
         \protected@xdef\@toctitle{\the\title}%
      \fi
      \if!\the\titlerunning!\else
        \edef\@title{\the\titlerunning}\fi
      \ifx\@author\empty\relax%
        \xdef\@runninghead{\ignorespaces\@title}
      \else
        \if!\the\tocauthor!\relax
          {\def\and{\noexpand\protect\noexpand\and}%
            \protected@xdef\@tocauthor{\@author}}%
        \else
          {\def\\{\noexpand\protect\noexpand\newline}%
          \protected@xdef\scratch{\the\tocauthor}}%
          \protected@xdef\@tocauthor{\scratch}%
        \fi
        \protected@xdef\@tocprincipalInvestigator{\@principalInvestigator}
        \setbox0=\vbox{\@eventtitle}%
        \protected@xdef\@tocevent{\@eventtitle}
        %
        \TR@contrib@@processmetadata
        %
        \if!\the\authorrunning!
          \value{@affil}=\value{@auth}%
          \setcounter{@auth}{1}%
        \else
          \edef\@author{\the\authorrunning}%
        \fi
        \gdef\@runninghead{\unskip\ignorespaces\@author: \@title}
      \fi
      {\def\affil##1{}
      \global\setbox\authrun=\hbox{\usekomafont{pagehead}\@author}%
      \global\setbox\headrun=\hbox{\usekomafont{pagehead}\@runninghead}}%
      \ifdim\wd\headrun>\hsize
        \TR@warning{Title and author names too long for running head. Please supply
          a shorter form with \string\titlerunning\space and
          \string\authorrunning\space prior to \string\maketitle}%
        \xdef\@runninghead{Authors/Title Suppressed Due to Excessive Length}%
      \fi
      \xdef\@runninghead{\copy\headrun}
      \xdef\@author{\copy\authrun}
      \ifthenelse{\boolean{TR@chapters}}%
        {\addchapmark{\@runninghead}}%
        {\xdef\TR@titlemark{\@runninghead}%
          \xdef\TR@authormark{\@author}}%
    \endgroup
    \setcounter{footnote}{\fnnstart}%
    \clearheadinfo%
    \relax%
    \ignorespaces}
  \newcommand*\TR@contrib@@processmetadata{%
    \begingroup
    \def\\{\unskip\ \ignorespaces}%
    \def\thanks##1{\unskip{}}%
    \def\and{\noexpand\protect\noexpand\and}%
    \ifdefvoid\@tocevent{}{%
      \ifx\@lastevent\@tocevent\relax%
      \else%
      \global\let\@lastevent\@tocevent
        \phantomsection
        \addcontentsline{toc}{event}{\@tocevent}
      \fi}
    \ifdefvoid\@tocprincipalInvestigator{}{
      \ifx\@lastprincipalInvestigator\@tocprincipalInvestigator\relax%
      \else%
        \global\let\@lastprincipalInvestigator\@tocprincipalInvestigator%
        \phantomsection
        \addcontentsline{toc}{principalInvestigator}{\@tocprincipalInvestigator}%
      \fi}
    \ifdefvoid\@toctitle{}{%
        \phantomsection
      \addcontentsline{toc}{title}{\@toctitle}}
    \ifdefvoid\@tocauthor{}{%
      \phantomsection
      \addtocontents{toc}{\noexpand\protect\noexpand\authcount{\the\c@auco}}%
      \addcontentsline{toc}{author}{\@tocauthor}}
    \ifdefvoid\@tocaffiliation{}{%
      \addcontentsline{toc}{affiliation}{\@tocaffiliation}}
    \endgroup}
  \newcommand*\TR@contrib@@maketitle{\newpage
    \def\lastand{\ifnum\value{@affil}=2\relax
        \unskip{} \andname\
       \else
         \unskip \lastandname\
       \fi}%
     \def\and{\stepcounter{@auth}\relax
       \ifnum\value{@auth}=\value{@affil}%
         \lastand
       \else
         \unskip,
       \fi}%
     \begin{center}%
       \let\newline\\
       {\Large \bfseries\boldmath
         \pretolerance=10000
         \@title \par}\vskip .8cm
       \if!\@subtitle!\else {\large \bfseries\boldmath
         \vskip -.65cm
         \pretolerance=10000
         \@subtitle \par}\vskip .8cm\fi
       \setbox0=\vbox{\setcounter{@auth}{1}\def\and{\stepcounter{@auth}}%
         \def\thanks##1{}\@author}%
       \global\value{@affil}=\value{@auth}%
       \global\value{auco}=\value{@auth}%
       \setcounter{@auth}{1}%
       {\lineskip .5em
         \noindent\ignorespaces
         \@author\vskip.35cm}
       {\small\affiliationtext}
     \end{center}}
  \newcommand*\TR@contrib@author[1]{\gdef\@author{#1}}
  \newcommand*\TR@contrib@keywords[1]{}
  \ifthenelse{\boolean{TR@chapters}\AND\boolean{TR@proceedings}}%
    {\renewcommand*\thesection{\@arabic\c@section}
      \renewcommand*\thefigure{\@arabic\c@figure}
      \renewcommand*\thetable{\@arabic\c@table}
      \renewcommand*\theequation{\@arabic\c@equation}
      \@addtoreset{equation}{chapter}
      \BeforePackage{hyperref}{%
        \newcommand*\theHequation{\theHsection.\arabic{equation}}%
        \newcommand*\theHchapter    {\arabic{chapter}}%
        \newcommand*\theHfigure     {\theHchapter.\arabic{figure}}%
        \newcommand*\theHtable      {\theHchapter.\arabic{table}}%
        \newcommand*\theHsection    {\theHchapter.\arabic{section}}%
        \newcommand*\theHsubsection   {\theHsection.\arabic{subsection}}
        \newcommand*\theHsubsubsection{\theHsubsection.\arabic{subsubsection}}
        \newcommand*\theHparagraph    {\theHsubsubsection.\arabic{paragraph}}
        \newcommand*\theHsubparagraph {\theHparagraph.\arabic{subparagraph}}
        \newcommand*\theHtheorem      {\theHsection.\arabic{theorem}}
        \newcommand*\theHthm          {\theHsection.\arabic{thm}}}}%
    {}
  \AtBeginDocument{\setcounter{tocdepth}{0}}%
  \AfterPackage{listings}{\lstset{numberbychapter=true}}
  \ifthenelse{\boolean{TR@proceedings}}%
    {\AfterPackage{listings}{
        \AtBeginDocument{
          \def\thelstlisting{\@arabic\c@lstlisting}%
          \def\theHlstnumber{\ifx\lst@@caption\@empty \lst@neglisting
                                                 \else \theHlstlisting \fi%
                                                 .\thelstnumber}}}}%
    {}
    \@ifundefined{abstract}{%
      \newenvironment{abstract}{}{}}{}%
    \renewenvironment{abstract}{%
      \ifthenelse{\boolean{TR@firsttitleseen}}{
        \list{}{%\advance\topsep by0.35cm\relax
          \setlength{\topsep}{0pt}%
          \setlength{\leftmargin}{2em}%
          \setlength{\rightmargin}{\leftmargin}%
          \setlength{\listparindent}{\parindent}%
          \setlength{\itemindent}{\parindent}%
          \setlength{\parsep}{\parskip}%
          \usekomafont{abstract}%
          }\item[]\noindent\ignorespaces%
      }{%
        \TR@error{Proceedings should not have \MessageBreak
          abstracts. Please remove it.}{}%
      }%
    }%
    {\ifthenelse{\boolean{TR@firsttitleseen}}{\endlist}{}}
  %for compat with swathesis
  \let\supervisors\@gobble
  \let\statements\relax
}{}
\ifthenelse{\boolean{TR@collection}}%
  {%
   \let\TR@contrib@author\@gobble
   \let\TR@contrib@keywords\@gobble
   \let\institute\@gobble
   \let\authorrunning\@gobble
   \let\toctitle\@gobble
   \let\tocauthor\@gobble
   \setkomafont{abstract}{\footnotesize\itshape}

   \let\@titlerunning\@empty
   \providecommand*\titlerunning{}
   \renewcommand*\titlerunning[1]{\gdef\@titlerunning{#1}}
   \providecommand*\TR@contrib@maketitle{}
   \renewcommand*\TR@contrib@maketitle{%
     \ifcsempty{@titlerunning}%
       {\expandafter\chapter\expandafter{\@title}}%
       {\expandafter\chapter\expandafter[\expandafter\@titlerunning\expandafter]\expandafter{\@title}}%
     \edef\@templ{lbl:chapter-\thechapter}%
     \expandafter\label\expandafter{\@templ}%
      \typeout{^^J^^JSet label "\@templ" for contribution "\@title"^^J^^J}
      \clearheadinfo}}%
    {}
\setcounter{secnumdepth}{\subsubsectionnumdepth}
\newcommand*\keywords[1]{
  \AfterPreamble{
    \begingroup
    \appto\pdfstringdefPreHook{\def\\{\space\ignorespaces}}
    \hypersetup{pdfkeywords={#1}}
    \endgroup}}
\ifthenelse{\boolean{luatex}}{}{
  \RequirePackage{hyphsubst}
  \HyphSubstLet{ngerman}{ngerman-x-latest}
}
\RequirePackage{babel}
\newcommand*\TR@lang{}\let\TR@lang\@empty
\AfterPackage{hyperref}%
  {\patchcmd{\pdfstringdef}%
    {\csname HyPsd@babel@}
    {\let\bbl@info\@gobble\csname HyPsd@babel@}
    {}{}}
{
  \def\@l#1{\equal{\languagename}{#1}}
  \def\@L#1{\gdef\TR@lang{#1}}
\ifthenelse{\@l{afrikaans}}{\@L{af}}{}
\ifthenelse{\@l{bahasa}\OR\@l{indonesian}\OR\@l{indon}\OR%
  \@l{bahasai}\OR\@l{bahasam}\OR\@l{malay}\OR\@l{meyalu}}{\@L{id}}{}
\ifthenelse{\@l{basque}}{\@L{eu}}{}
\ifthenelse{\@l{breton}}{\@L{br}}{}
\ifthenelse{\@l{bulgarian}}{\@L{bg}}{}
\ifthenelse{\@l{catalan}}{\@L{ca}}{}
\ifthenelse{\@l{croatian}}{\@L{hr}}{}
\ifthenelse{\@l{czech}}{\@L{cs}}{}
\ifthenelse{\@l{danish}}{\@L{da}}{}
\ifthenelse{\@l{dutch}}{\@L{nl}}{}
\ifthenelse{\@l{english}\OR\@l{USenglish}\OR\@l{american}\OR%
  \@l{UKenglish}\OR\@l{british}\OR\@l{canadian}\OR%
  \@l{australian}\OR\@l{newzealand}}{\@L{en}}{}
\ifthenelse{\@l{esperanto}}{\@L{eo}}{}
\ifthenelse{\@l{estonian}}{\@L{et}}{}
\ifthenelse{\@l{finnish}}{\@L{fi}}{}
\ifthenelse{%
  \@l{french}\OR\@l{francais}\OR\@l{canadien}\OR\@l{acadian}}{\@L{fr}}{}
\ifthenelse{\@l{galician}}{\@L{gl}}{}
\ifthenelse{\@l{german}\OR\@l{germanb}\OR\@l{ngerman}\OR%
  \@l{ngermanb}\OR\@l{austrian}\OR\@l{naustrian}}{\@L{de}}{}
\ifthenelse{\@l{greek}\OR\@l{polutonikogreek}}{\@L{el}}{}
\ifthenelse{\@l{hebrew}}{\@L{he}}{}
\ifthenelse{\@l{magyar}\OR\@l{hungarian}}{\@L{hu}}{}
\ifthenelse{\@l{icelandic}}{\@L{is}}{}
\ifthenelse{\@l{interlingua}}{\@L{ia}}{}
\ifthenelse{\@l{irish}}{\@L{ga}}{}
\ifthenelse{\@l{italian}}{\@L{it}}{}
\ifthenelse{\@l{latin}}{\@L{la}}{}
\ifthenelse{\@l{samin}}{\@L{se}}{}
\ifthenelse{\@l{norsk}}{\@L{no}}{}
\ifthenelse{\@l{nynorsk}}{\@L{nn}}{}
\ifthenelse{\@l{polish}}{\@L{pl}}{}
\ifthenelse{%
  \@l{portuges}\OR\@l{portuguese}\OR\@l{brazilian}\OR\@l{brazil}}{\@L{pt}}{}
\ifthenelse{\@l{romanian}}{\@L{ro}}{}
\ifthenelse{\@l{russian}}{\@L{ru}}{}
\ifthenelse{\@l{scottish}}{\@L{gd}}{}
}
\ifthenelse{\boolean{luatex}}{%
  \RequirePackage{luatexbase}
  \RequirePackage[final]{microtype}[2013/05/23]
}{
  \RequirePackage[final,babel=true]{microtype}[2013/05/23]
}
\ifthenelse{\boolean{luatex} \or \boolean{xetex}}{%
  \RequirePackage{fontspec}[2013/05/20]
}{}
\RequirePackage[osf,sc]{mathpazo}
\ifthenelse{\boolean{luatex} \or \boolean{xetex}}{%
  \@ifpackagelater{fontspec}{2014/06/01}{%
    \setmainfont{texgyrepagella}[ExternalLocation,%
        Numbers={Proportional,OldStyle},%
        UprightFont= *-regular,%
        BoldFont=*-bold,%
        ItalicFont=*-italic,%
        BoldItalicFont=*-bolditalic,%
        ]
  }{%
    \setmainfont[ExternalLocation,%
        Numbers={Proportional,OldStyle},%
        UprightFont= *-regular,%
        BoldFont=*-bold,%
        ItalicFont=*-italic,%
        BoldItalicFont=*-bolditalic,%
        Ligatures={Common,TeX},%
        ]{texgyrepagella}
  }
  \RequirePackage[scale=MatchLowercase,semibold]{sourcecodepro}
  \RequirePackage[scale=MatchLowercase,semibold,osf]{sourcesanspro}
}{
  \RequirePackage[scale=.9,semibold]{sourcecodepro}
  \RequirePackage[scale=.9,semibold,osf]{sourcesanspro}
}
\linespread{1.05} % a bit more for Palatino
\let\TR@orig@footnotesize
\let\footnotesize\small
\ifthenelse{\boolean{xetex}\OR\boolean{luatex}}{
  \microtypesetup{stretch=9,shrink=15,step=3}
}{
  \microtypesetup{stretch=9,shrink=15,step=3,tracking=smallcaps,letterspace=75}
}

\addtokomafont{disposition}{\rmfamily}
\setkomafont{title}{\rmfamily\mdseries}
\addtokomafont{descriptionlabel}{\rmfamily}
\renewcommand*\labelitemii{\normalfont\textendash}
\setfootnoterule{4cc}
\setlength{\skip\footins}{2\baselineskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Text companion fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{textcomp}
\RequirePackage{mathcomp}
\RequirePackage{relsize}

%%%
%%% Details
%%%
\KOMAoptions{
  headings=big
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page breaks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% no footnote breaks
\interfootnotelinepenalty = 1000

%% avoid widows (Hurenkinder) and orphans (Schusterjungen)
\clubpenalty = \@M
\widowpenalty = \@M

\setlength{\textfloatsep}{2\baselineskip}
\setlength{\floatsep}{\baselineskip}
\setlength{\intextsep}{2\baselineskip}

\AtEndPreamble{
  \frenchspacing
  \raggedbottom
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headers and footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\KOMAoptions{
  headsepline=false,
  footsepline=false,
}
\RequirePackage{scrlayer-scrpage}
\pagestyle{scrheadings}

\ifthenelse{\boolean{TR@chapters}}{
  \renewcommand*\chapterpagestyle{plain.scrheadings}
  \automark[chapter]{chapter}
  \automark*[section]{}
}{
  \ifthenelse{\boolean{TR@inproceedings}}{
    \lehead{\TR@titlemark}
  }{
    \lehead{\@title}
  }
  \automark*[section]{}
}

\lefoot[]{}\lofoot[]{}
\refoot[]{}\rofoot[]{}
\ifthenelse{\boolean{TR@inproceedings}}{
  \ifthenelse{\boolean{TR@inproceedingspagenumbers}}{
    \cefoot[\pagemark]{\pagemark}
    \cofoot[\pagemark]{\pagemark}
  }{
    \cefoot[]{}
    \cofoot[]{}
  }
}{
  \cefoot[\pagemark]{\pagemark}
  \cofoot[\pagemark]{\pagemark}
}

%%  \ifthenelse{\boolean{TR@proceedings}\OR\boolean{TR@contribtools}}{
%%   \lefoot[\@eventtitle]{\@eventtitle}
%%   \lofoot[\@eventtitle]{\@eventtitle}
%% }{}

 %\setkomafont{pagefoot}{}
\setkomafont{pagehead}{\itshape}
\setkomafont{pageheadfoot}{\normalcolor}
\setkomafont{pagenumber}{\normalfont}

\ifthenelse{\boolean{TR@chapters}}{
  \renewcommand*{\chapterheadstartvskip}{\vspace*{3\baselineskip}}
  \renewcommand*{\chapterheadendvskip}{\vspace*{2\baselineskip}}
}{}
\@ifpackagelater{scrbase}{2014/10/28}{%
  \AtEndPreamble{%
    \RedeclareSectionCommand[%
      beforeskip=-2\baselineskip,
      afterskip=1\baselineskip]{section}
    \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,
      afterskip=1\baselineskip]{subsection}
    \RedeclareSectionCommand[%
      beforeskip=-1\baselineskip,
      afterskip=1sp plus -1sp minus 1sp]{subsubsection}
    \RedeclareSectionCommand[%
      beforeskip=1\baselineskip]{paragraph}
    \RedeclareSectionCommand[%
      beforeskip=1\baselineskip]{subparagraph}
  }
}{
  % for sections, not so easy.
  \def\TR@patchw{\TR@warning@noline{Cannot patch sectioning command.\MessageBreak This is
      not severe.}}
  \patchcmd{\section}{-3.5ex \@plus -1ex \@minus -.2ex}{-2\baselineskip}{}{\TR@patchw}
  \patchcmd{\section}{2.3ex \@plus.2ex}{\baselineskip}{}{\TR@patchw}
  \patchcmd{\subsection}{-3.25ex\@plus -1ex \@minus -.2ex}{-\baselineskip}{}{\TR@patchw}
  \patchcmd{\subsection}{1.5ex \@plus .2ex}{\baselineskip}{}{\TR@patchw}
  \patchcmd{\subsubsection}{-3.25ex\@plus -1ex \@minus -.2ex}{-\baselineskip}{}{\TR@patchw}
  \patchcmd{\subsubsection}{1.5ex \@plus .2ex}{1sp \@plus 1sp \@minus 1sp}{}{\TR@patchw}
  \patchcmd{\paragraph}{3.25ex \@plus1ex \@minus .2ex}{\baselineskip}{}{\TR@patchw}
  \patchcmd{\subparagraph}{3.25ex \@plus1ex \@minus .2ex}{\baselineskip}{}{\TR@patchw}
}
\PassOptionsToPackage{hyphens}{url}
\PassOptionsToPackage{%
  final,%
  unicode=true,%
  plainpages=false,%
  pdfpagelabels=true,%
}{hyperref}
\AtEndPreamble{%
  \RequirePackage{hyperref}%
  \RequirePackage{hyperxmp}
}
\AtBeginDocument{%
  \hypersetup{%
    breaklinks=true,
    %pdfborder = 0 0 0,
    bookmarksnumbered = true,
    pdfsubject = {Technical Report},
    pdfkeywords = {},
    pdfcreator = {HPI},
    pdfmetalang = {en},
    pdfproducer = {\TR@ClassName - Technical Reports at the HPI},
    pdflang = {\TR@lang},
    pdfdisplaydoctitle = false,
    pdfpagemode = UseOutlines,
  }
\PassOptionsToPackage{all}{hypcap}
\AfterPackage{hyperref}{\RequirePackage{hypcap}}
\RequirePackage{accsupp}
  \ifthenelse{\boolean{TR@copyrightmark}}{%
    \hypersetup{pdfcopyright = {Copyright (c) \the\year, HPI}}}{}
}
\RequirePackage{tocbasic}
\setcounter{tocdepth}{1}
\tocbasicautomode
\setuptoc{toc}{noprotrusion}

\AfterPackage{listings}{
  \setuptoc{lol}{noprotrusion}
}

\ifthenelse{\boolean{TR@chapters}}{
  \renewcommand*\raggedchapterentry{\raggedright}
}{}
\ifthenelse{\boolean{TR@proceedings}\OR\boolean{TR@contribtools}}{}{
  \renewenvironment{abstract}{%
    \thispagestyle{plain.scrheadings}
    \null\vfil\leavevmode%
    \noindent%
    \ignorespaces%
  }{%
    \par\vfil%
    \cleardoublepage%
  }
}

\PassOptionsToPackage{style=numeric,sortcites}{biblatex}
\AfterPackage{biblatex}{
  \setcounter{biburllcpenalty}{7000}
  \setcounter{biburlucpenalty}{8000}
  \@ifpackagelater{biblatex}{2016/03/01}
    {\ExecuteBibliographyOptions{giveninits=true}}
    {\ExecuteBibliographyOptions{firstinits=true}}
  \@ifpackagelater{biblatex}{2016/09/10}%
    {\@ifpackagelater{biblatex}{2017/12/19}%
      {\ExecuteBibliographyOptions{urldate=iso,seconds=true}}%
      {\ExecuteBibliographyOptions{urldate=edtf,seconds=true}}}%
    {\ExecuteBibliographyOptions{urldate=iso8601}}
  \ExecuteBibliographyOptions{
    url=false,%
    abbreviate=false,%
    maxnames=20,%
  }
  \PreventPackageFromLoading[\message{%
    ^^J^^JERROR: You tried to load  the cite package that is not compatible
    with biblatex.^^J^^J%
  }]{cite}
}
\AtEndPreamble{
  \ltx@ifpackageloaded{biblatex}{}{
    \bibliographystyle{plain}
  }
}
\ifthenelse{\boolean{TR@chapters}}{%
  \global\let\@auto@bibname\refname
  \global\let\bibname\refname
  \defcaptionname{ngerman}{\bibname}{\refname}
  \defcaptionname{german}{\bibname}{\refname}
  \defcaptionname{english}{\bibname}{\refname}
}{}
\IfFileExists{mathtools.sty}%
  {\RequirePackage{mathtools}}%
  {\RequirePackage{amsmath}}
\RequirePackage{amssymb}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{grffile}
\AtEndPreamble{
  \ltx@ifpackageloaded{float}{}{% mock float
    \providecommand*\floatname[2]{\@namedef{fname@#1}{#2}}
    \providecommand*\floatplacement[2]{\@namedef{fps@#1}{#2}}
    \floatplacement{figure}{htbp}
    \floatplacement{table}{htp}
  }
  \setlength{\abovecaptionskip}{.5\baselineskip}
  \setlength{\belowcaptionskip}{.5\baselineskip}
}
\AfterPackage{float}{
  \def\@float@HH#1{%
    \TR@error{The [H] specifier for floats is forbidden for
      the hpitr class.}{}}
  \floatstyle{komabelow}
}
\setcapindent{1em}
\addtokomafont{captionlabel}{\bfseries}
\PassOptionsToPackage{ruled}{algorithm2e}

\providecommand*\TR@listingfont{}
\ifthenelse{\boolean{xetex}}{%
  \newcommand*\TRlistingfont[1]{\gdef\TR@listingfont{#1\addfontfeature{Mapping=}}}%
}{%
  \ifthenelse{\boolean{luatex}}{%
    \newcommand*\TRlistingfont[1]{\gdef\TR@listingfont{#1\addfontfeature{RawFeature={-tlig;-trep}}}}%
  }{
    \newcommand*\TRlistingfont[1]{\gdef\TR@listingfont{#1}}}
}{}
\TRlistingfont{\ttfamily\small}

\AfterPackage{verbatim}{
  \renewcommand*\verbatim@font{\TR@listingfont}
}
\AfterPackage{listings}{
  \AtEndPreamble{
    \lstset{%
      basicstyle=\TR@listingfont,
      floatplacement=htbp,
      captionpos=t,
      abovecaptionskip=.5\baselineskip,
      belowcaptionskip=.5\baselineskip,
      upquote=true,
      showstringspaces=false,
      inputencoding=utf8,
    }
    \lst@AddToHook{Init}{\let\ttdefault\f@family}
  }
}

\RequirePackage{color}
\PassOptionsToPackage{table,svgnames,dvipsnames*,x11names}{xcolor}
\AfterPackage{xcolor}{%
  \definecolors{Aquamarine,Black,Blue,BlueViolet,Brown,CadetBlue,%
    CornflowerBlue,Cyan,DarkOrchid,ForestGreen,Fuchsia,Goldenrod,Gray,%
    Green,GreenYellow,Lavender,LimeGreen,Magenta,Maroon,MidnightBlue,%
    NavyBlue,Orange,OrangeRed,Orchid,Plum,Purple,Red,RoyalBlue,Salmon,%
    SeaGreen,SkyBlue,SpringGreen,Tan,Thistle,Turquoise,Violet,%
    VioletRed,White,Yellow,YellowGreen}}
\RequirePackage{xcolor}
\ifthenelse{\boolean{TR@proceedings}}{
  \RequirePackage{pdfpages}
  \ifthenelse{\boolean{xetex}}{}{\pdfinclusioncopyfonts = 1}
  \includepdfset{pagecommand={\thispagestyle{plain.scrheadings}}}
}{}
\ifthenelse{\boolean{TR@todotools}}{%
  \RequirePackage[obeyDraft,colorinlistoftodos]{todonotes}
  \newcommand*\todosec{\par\noindent\todo[inline]}
  \newcommand*\secmissing{\par\noindent\todo[color=red,inline,size=\Large]}
  \newcommand\todolist[2]{%
    \par\noindent%
    \todo[inline,color={red!100!green!50},caption={#1}]{%
      \begin{minipage}{\linewidth}%
        \begin{itemize}
          #2%
        \end{itemize}
      \end{minipage}
    }%
  }
  \newcommand\todoauthor[2][\empty]{
    \expandafter\newcommand\csname #2\endcsname[2][\empty]{%
      \todo[color=#1,##1]{#2: ##2}}}
}{}
\ifthenelse{\boolean{@draft}}{%
  \RequirePackage{blindtext}
  \errorcontextlines=999
  \RequirePackage{eso-pic}
  \newkomafont{draftline}{\small\sffamily}
  \newsavebox{\TR@draftPageLine}
  \AddToShipoutPicture{%
    \AtPageUpperLeft{%
      \raisebox{-\height}[\height][0pt]{\usebox{\TR@draftPageLine}}}%
    \AtPageLowerLeft{%
      \raisebox{\depth}[\height][0pt]{\usebox{\TR@draftPageLine}}}%
  }
  \AddToShipoutPicture{
    \begingroup
    \setlength{\@tempdima}{.5pt}%
    \setlength{\@tempdimb}{\dimexpr\paperwidth-1.75pt\relax}%
    \setlength{\@tempdimc}{\dimexpr\paperheight-1.5pt\relax}%
    \thicklines%
    \put(\LenToUnit{\@tempdima},\LenToUnit{\@tempdima}){%
      \framebox(\LenToUnit{\@tempdimb},\LenToUnit{\@tempdimc}){}}%
    \endgroup
  }
  \AtBeginDocument{
    \hypersetup{
      colorlinks = true,
      linkcolor=MidnightBlue,%
      citecolor=MidnightBlue,%
      urlcolor=MidnightBlue,%
    }
    \def\TR@draftInfo{%
      {\usekomafont{draftline}
      Draft Draft Draft%
      \hspace*{4cm}\today\hspace*{4cm}%
      Draft Draft Draft%
    }}
    \sbox{\TR@draftPageLine}{%
      \colorbox{black!10}{%
        % enlarge box vertically by 1/6 lines
        \raisebox{0pt}%
        [\dimexpr .166\baselineskip + \height]%
        [\dimexpr .166\baselineskip + \depth]{%
          \makebox[\paperwidth]{\color{black!50}\TR@draftInfo}}}}
  }
  \ifthenelse{\boolean{TR@todotools}}{
    \AtEndDocument{\listoftodos}}{}
}{
  \let\blindtext\relax
  \let\Blindtext\relax
  \let\blinddocument\relax
  \let\Blinddocument\relax
}
\PreventPackageFromLoading[%
\message{%
  ^^J^^JERROR: You tried to load a package that is not to be used with this class.^^J^^J}]{%
  geometry,a4,a4wide,%
  mathptmx,helvet,courier,newtxtext,newtxmath,fourier,%
  fancyhdr,%
  ae,aecompl,zefonts,times,mathptm,pslatex,palatino,mathpple,%
  utopia,euler,%
  isolatin,umlaut,t1enc,%
  epsf,psfig,epsfig,subfig,subfigure%
  fancyheadings,scrpage,caption2,glossary,SIstyle,SIunits,%
  doublespace%
}

\csgappto{bf}{\TR@fonterror}
\csgappto{it}{\TR@fonterror}
\csgappto{sc}{\TR@fonterror}
\csgappto{rm}{\TR@fonterror}
\csgappto{sc}{\TR@fonterror}
\csgappto{sf}{\TR@fonterror}
\csgappto{sl}{\TR@fonterror}
\csgappto{tt}{\TR@fonterror}

%% Warn about global use of sloppy
\let\TR@sloppy\sloppy
\xpatchcmd{\sloppypar}{\sloppy}{\TR@sloppy}{}{}
\xpatchcmd{\@arrayparboxrestore}{\sloppy}{\TR@sloppy}{}{}
\xpatchcmd{\thebibliography}{\sloppy}{\TR@sloppy}{}{}
\AfterPackage{caption}{
  \xpatchcmd{\caption@boxrestore@mini}{\sloppy}{\TR@sloppy}{}{}
  \xpatchcmd{\caption@boxrestore}{\sloppy}{\TR@sloppy}{}{}
}
\def\sloppy{\TR@warning{You should not use \string\sloppy.
    Instead, use a sloppypar, when necessary:\MessageBreak
    \MessageBreak
    \string\begin{sloppypar}\MessageBreak
      \space\space...\MessageBreak
      \string\end{sloppypar}}%
  \TR@sloppy}
\ifthenelse{\boolean{TR@inproceedingspagenumbers}}%
  {}%
  {\setcounter{page}{5}}
\ifcsdef{frontmatter}%
  {\apptocmd{\frontmatter}%
    {\ifthenelse{\boolean{TR@inproceedingspagenumbers}}%
      {}%
      {\setcounter{page}{5}}}%
    {}%
    {\TR@warning@noline{Cannot patch \string\frontmatter}}}%
  {}
\RequirePackage{xspace,csquotes}
\ifthenelse{\boolean{luatex}\OR\boolean{xetex}}{
  \ltx@ifpackageloaded{xunicode}{
    %% http://tex.stackexchange.com/a/16995
    \DeclareUTFcharacter[\UTFencname]{x201C}{\grqq}
    \DeclareUTFcharacter[\UTFencname]{x201E}{\glqq}
  }{}
}{}
\PassOptionsToPackage{shortcuts}{extdash}
\AtEndPreamble{\RequirePackage{extdash}}
\AtEndPreamble{\RequirePackage{siunitx}}
\AfterPackage{siunitx}{%
  \sisetup{%
    binary-units,
    detect-all,
    free-standing-units,
    space-before-unit,
    use-xspace,
    unit-optional-argument,
    parse-units = false}
  \AtEndPreamble{%
    \ltx@ifpackageloaded{pgf}%
      {\SendSettingsToPgf}%
      {}
    \addto\extrasgerman{\sisetup{locale = DE}}
    \addto\extrasngerman{\sisetup{locale = DE}}
    \addto\extrasenglish{\sisetup{locale = US}}}}
\endinput
%%
%% End of file `hpitr.cls'.
