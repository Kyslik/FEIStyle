# filename without extenstion e.g: if we have example.tex
FILE=example

# specify where to put all build garbage
BUILD_DIR=.build

# set options for latexmk
LATEXMK_OPTIONS=-output-directory=$(BUILD_DIR) -quiet -pdf -bibtex -pdflatex="pdflatex" 

all: build

build:
	latexmk $(LATEXMK_OPTIONS) $(FILE).tex
	mv $(BUILD_DIR)/$(FILE).pdf .

# latexmk -output-directory=$(BUILD_DIR) -CA might be used to clean
clean:
	rm -fr $(BUILD_DIR)
	rm -f $(FILE).pdf

refresh: clean build

.PHONY: all build clean refresh
