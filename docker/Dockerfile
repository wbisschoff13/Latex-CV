FROM texlive/texlive:latest

COPY *.cls ./
COPY fonts ./fonts/
COPY img ./img/
COPY cv ./cv/
COPY *.tex ./

RUN ["latexmk", "-pdfxe",  "-quiet", "-output-directory=out", "-aux-directory=build"]
