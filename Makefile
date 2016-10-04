# filename without extenstion e.g: if we have example.tex
FILE=example

# specify where to put all build garbage
BUILD_DIR=.build
OPTIONS=-output-directory=$(BUILD_DIR) -quiet -pdf -bibtex -pdflatex="pdflatex" 

all:
	latexmk $(OPTIONS) $(FILE).tex
	mv $(BUILD_DIR)/$(FILE).pdf .

clean:
	rm -fr $(BUILD_DIR)

.PHONY: all clean
