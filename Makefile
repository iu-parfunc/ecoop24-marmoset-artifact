
TARGETS = paper


LATEX   = pdflatex -shell-escape
BIBTEX  = bibtex

all:  $(MSC_RENDERED) $(TARGETS)

$(TARGETS):
	$(LATEX) $@
	-$(BIBTEX) $@ > $(BIBTEX)_out.log
	$(LATEX) $@
	$(LATEX) $@
	$(LATEX) $@

clean:
	rm -f *.aux *.bbl *.blg *.log *.dvi *.bak *~ $(TARGETS:%=%.pdf)
