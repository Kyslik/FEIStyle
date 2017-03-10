MAINFILE = example.tex

# All files produced while making the document will have this basename
OUTPUTNAME = example

CWD := $(shell pwd)

# Placement of all produced files
BUILD_DIRECTORY = ./.build

# Extra options, these must be available for both pdflatex and latexmk
DEFAULT_LATEX_OPTIONS = -synctex=1 -output-directory=$(BUILD_DIRECTORY) -c-style-errors -interaction=nonstopmode -silent

# Options for glossary
GLOSSARY_OPTIONS = -q

LINE_WIDTH = error_line=240 half_error_line=160 max_print_line=240

# Command to build document
BUILD = $(LINE_WIDTH) latexmk -pdf -bibtex -jobname=$(OUTPUTNAME) $(DEFAULT_LATEX_OPTIONS) $(MAINFILE)
BUILD_AND_SHOW_PDF = $(LINE_WIDTH) latexmk -pdf -pv -bibtex -jobname=$(OUTPUTNAME) $(DEFAULT_LATEX_OPTIONS) $(MAINFILE)

# Creates first auxiliary files required to build glossary
BASIC_BUILD = $(LINE_WIDTH) pdflatex -jobname=$(OUTPUTNAME) $(DEFAULT_LATEX_OPTIONS) $(MAINFILE)

# Command to build glossary and glossarylists
# (Not using -d option due to incompatibility with some systems)
BUILD_GLOSSARY = cd $(BUILD_DIRECTORY) &&\
 makeglossaries $(GLOSSARY_OPTIONS) $(OUTPUTNAME) &&\
 cd - >/dev/null

# The last command to run      
FINALIZE = mv $(BUILD_DIRECTORY)/$(OUTPUTNAME).pdf .

PARSE_LOG = $(EDITOR) $(BUILD_DIRECTORY)/$(OUTPUTNAME).log

all: _base_ _build_
	@$(FINALIZE)

show: _base_
	@$(BUILD_AND_SHOW_PDF)
	
parselog:
	@$(PARSE_LOG)

_base_:
	@mkdir -p $(BUILD_DIRECTORY) &>/dev/null
	@$(BASIC_BUILD) &>/dev/null
	@$(BUILD_GLOSSARY)

_build_:
	@$(BUILD) &>/dev/null
	
_all: _base_ _build_

clean:
	rm -rf ./.build
