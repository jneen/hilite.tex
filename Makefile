APP := example

# LATEXMK_FLAGS += -pdf
LATEXMK_FLAGS += -view=none
LATEXMK_FLAGS += -pdfxe
LATEXMK_FLAGS += -latexoption=-shell-escape
LATEXMK_FLAGS += -latexoption=-halt-on-error
LATEXMK_FLAGS += -latexoption=-synctex=1
LATEXMK_FLAGS += -e '$$hash_calc_ignore_pattern{"tmp"}="^";'

.PHONY: all clean distclean watch

.SUFFIX: .tex .pdf

%.pdf: %.tex
	latexmk -gg $(LATEXMK_FLAGS) -output-directory=$(dir $<) $<

all: $(APP).pdf

watch:
	latexmk -pvc -gg $(LATEXMK_FLAGS) $(APP).tex

distclean:
	$(RM) $(APP).pdf

clean:
	$(RM) *~ $(APP).dvi $(APP).aux $(APP).toc $(APP).out \
	$(APP).log $(APP).pdf $(APP).ps $(APP).blg \
	$(APP).fls $(APP).lot $(APP).bbl \
	shellout/*.tmp shellout/*.tex

figs-preview:
	cd Figures && latexmk -pdfxe -pvc preview.tex -view=none -latexoption=-halt-on-error

slides-preview:
	latexmk -pvc -gg $(LATEXMK_FLAGS) slides.tex
