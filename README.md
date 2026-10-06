# General Report Template
This LaTeX report template is intended for general use, though it has been slightly tailored to academic writing.

## How To Use
Simply copy the contents of this repository into your working directory or use the magic green "Use this Template" button on GitHub, then start writing! To compile locally, use:
```
latexmk -pdf report.tex
```
To clean up the generated files, run:
```
latexmk -c report.tex
```

## Requirements
Up-to-date [TeX Live](https://www.tug.org/texlive/) to run `pdflatex` and `biber`. Note the use of `biber`, indicating the references are handled using [BibLaTeX](https://ctan.org/pkg/biblatex?lang=en).

## Additional Notes
As a LaTeX user myself, I have included packages that I commonly find myself using. These include:
1. [Physics2](https://mirrors.mit.edu/CTAN/macros/latex/contrib/physics2/physics2.pdf) Great package for typesetting math.
2. [Derivative](https://mirrors.ibiblio.org/pub/mirrors/CTAN/macros/latex/contrib/derivative/derivative.pdf) Great for differential equations.
3. [cleveref](https://ctan.org/pkg/cleveref?lang=en) Great for cross referencing and auto-attaching titles. Ex. `\cref{fig:example}` becomes "Figure 1" in the document.
4. [tgpagella](https://ctan.org/pkg/tex-gyre-pagella) A font I happened to like.

These packages are not mandatory to compile, so feel free to edit or remove as you see fit.

## Acknowledgements
The class file for the template was made through the inspiration in:
1. Argonne National Laboratory's `anlreport.cls` file. The source file is not public, but the lab has an [Overleaf account](https://www.overleaf.com/org/anl#overview). No copyright infringement intended, and no proprietary or controlled material was taken.
2. [ARFC report template](https://github.com/arfc/report-template)
   
