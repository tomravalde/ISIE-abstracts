if [ `hostname` = "cv-tr608-01" ]
then
	pandoc --latex-engine=xelatex --template=/home/tr608/.pandoc/templates/abstract.latex --natbib --bibliography=/home/tr608/ImpCol/PhD/my-refs.bib -o $1.tex $1.md 
else
	pandoc --template=default.latex -o $1.tex $1.md 
fi

xelatex $1
bibtex $1
xelatex $1
xelatex $1

if [[ `uname` == 'Darwin' ]];
then
    open -a Preview paper.pdf
else
    acroread $1.pdf
fi
