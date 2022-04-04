# Makefile für die Anfi-Präsentation

# Variablen für die Build-Ordner
TMPDIR = tmp

# Die dependencies müssen stimmen, da sonst keine rebuilds ausgeführt
# werden! "\RequirePackage{snapshot}" ist hier sehr hilfreich, am besten
# aktualisiert man das mal noch automatisch.
DEPENDENCIES = beamercolorthemebeaver.sty beamerouterthemewuerzburg.sty beamerinnerthemechamfered.sty \
pictures/anfibriefe_ws18.png pictures/fachschaft_17.jpg pictures/fsi_saeulen.graphml pictures/papierkram.jpg \
pictures/uebersicht_pi.pdf pictures/anfihefte_ws18.png pictures/fruehstueck_18.jpg pictures/fsi_saeulen.pdf pictures/sommerfest_18.png \
pictures/uebersicht_sand.pdf pictures/clubhaus.jpg pictures/fsilogo_neu.pdf pictures/keepcalm.pdf pictures/stocherkahn.jpg

# Aliases
all: presentation.pdf presentation_short.pdf

full: presentation.pdf
presentation.pdf: presentation.tex $(DEPENDENCIES)
	if [ ! -d $(TMPDIR) ]; then mkdir $(TMPDIR); fi
	latexmk -output-directory=$(TMPDIR) -pdf -pdflatex="pdflatex" $<
	cp $(TMPDIR)/$@ $@

short: presentation_short.pdf
presentation_short.pdf: presentation_short.tex $(DEPENDENCIES)
	if [ ! -d $(TMPDIR) ]; then mkdir $(TMPDIR); fi
	pdflatex -output-directory=$(TMPDIR) $<
	cp $(TMPDIR)/$@ $@

.PHONY: clean
clean:
	if [ -d $(TMPDIR) ]; then rm --recursive ./$(TMPDIR); fi

.PHONY: distclean
distclean: clean
	rm -f presentation.pdf presentation_short.pdf

.PHONY: info
info:
	@echo 'Build directory: $(TMPDIR)'
	@echo 'Dependencies: $(DEPENDENCIES)'

.PHONY: help
help:
	@echo 'Building targets:'
	@echo '  all            - Build the Ersti-Presentations'
	@echo '  full           - Build the full length Ersti-Presentation'
	@echo '  short          - Build the shortened Ersti-Presentation'
	@echo 'Auxiliary targets:'
	@echo '  info           - Show the current configuration of the makefile'
	@echo '  help           - Show this help'
	@echo 'Cleaning targets:'
	@echo '  clean          - Remove the $(TMPDIR)-Directory'
	@echo '  distclean      - Remove the $(TMPDIR)-Directory and presentation.pdf (i.e. everything)'
