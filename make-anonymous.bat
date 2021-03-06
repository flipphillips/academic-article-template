@echo off
if "%1"=="" GOTO MissingFile

:Compile
echo Making anonymous %1
REM Note:
REM  - apa6.csl is the syntax for APA6 reference formatting.
REM  - Pandoc variables is explained here: https://pandoc.org/MANUAL.html
pandoc "%1" -o "%~n1-anonymous.pdf" --template=svm-latex-anon-ms.tex --csl=apa6.csl --latex-engine=xelatex --number-sections --filter pandoc-citeproc -r markdown+simple_tables+table_captions+yaml_metadata_block -s -S -N -V geometry:margin=1in
GOTO End

:MissingFile
echo Use: make-anonymous [file.md]
echo    file.md ..... File name of markdown document.

:End
