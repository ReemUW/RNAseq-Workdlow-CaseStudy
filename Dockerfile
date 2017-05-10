{\rtf1\ansi\deff0\nouicompat{\fonttbl{\f0\fnil\fcharset0 Courier New;}}
{\*\generator Riched20 10.0.14393}\viewkind4\uc1 
\pard\f0\fs22\lang1033 FROM jupyter/r-notebook:599db13f9123\par
\par
MAINTAINER Yash Tamta <yasht7@uw.edu>\par
\par
USER root\par
\par
# Customized using Jupyter Notebook R Stack https://github.com/jupyter/docker-stacks/tree/master/r-notebook\par
\par
\par
# R pre-requisites\par
RUN apt-get update && \\\par
    apt-get install -y --no-install-recommends \\\par
    fonts-dejavu \\\par
    gfortran \\\par
    gcc && apt-get clean && \\\par
    rm -rf /var/lib/apt/lists/*\par
\par
USER $NB_USER\par
\par
# R packages\par
\par
RUN conda config --add channels r\par
RUN conda config --add channels bioconda\par
\par
RUN conda install --quiet --yes \\\par
    'r-base=3.3.2' \\\par
    'r-irkernel=0.7*' \\\par
    'r-plyr=1.8*' \\\par
    'r-devtools=1.12*' \\\par
    'r-shiny=0.14*' \\\par
    'r-rmarkdown=1.2*' \\\par
    'r-rsqlite=1.1*' \\\par
    'r-reshape2=1.4*' \\\par
    'r-nycflights13=0.2*' \\\par
    'r-caret=6.0*' \\\par
    'r-rcurl=1.95*' \\\par
    'r-crayon=1.3*' && conda clean -tipsy\par
    \par
RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('limma')" | R --vanilla\par
RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('AnnotationDbi')" | R --vanilla\par
RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('samr')" | R --vanilla\par
RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('hugene20stprobeset.db')" | R --vanilla\par
RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('hgu133plus2.db')" | R --vanilla\par
\par
# RNA-seq packages\par
\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('airway')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('BiocStyle')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('Rsamtools')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('GenomicFeatures')" | R --vanilla\par
\par
RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('GenomicAlignments')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('BiocParallel')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('DESeq2')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('vsn')" | R --vanilla\par
\par
RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('Organism.dplyr')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('genefilter')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('AnnotationDbi')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('OrganismDbi')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('Gviz')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('sva')" | R --vanilla\par

\pard\par

\pard RUN echo "source('http://bioconductor.org/biocLite.R'); biocLite('fission')" | R --vanilla\par

\pard\par
\par
WORKDIR /home/jovyan\par
ADD . /home/jovyan\par
\par
}
 