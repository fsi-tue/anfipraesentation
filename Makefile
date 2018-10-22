# Makefile für die Anfi-Präsentation

# Variablen für die Build-Ordner
TMPDIR = tmp

# Die dependencies müssen stimmen, da sonst keine rebuilds ausgeführt
# werden! "\RequirePackage{snapshot}" ist hier sehr hilfreich, am besten
# aktualisiert man das mal noch automatisch.
DEPENDENCIES = beamercolorthemebeaver.sty beamerouterthemewuerzburg.sty beamerinnerthemechamfered.sty \
anfibriefe_ws18.png fachschaft_17.jpg fsi_saeulen.graphml papierkram.jpg \
uebersicht_pi.pdf anfihefte_ws18.png fruehstueck_18.jpg fsi_saeulen.pdf sommerfest_18.png \
uebersicht_sand.pdf clubhaus.jpg fsilogo_neu.pdf keepcalm.pdf stocherkahn.jpg

# Aliases
all: presentation.pdf

presentation.pdf: presentation.tex $(DEPENDENCIES)
	if [ ! -d $(TMPDIR) ]; then mkdir $(TMPDIR); fi
	latexmk -output-directory=$(TMPDIR) -pdf -pdflatex="pdflatex" $<
	cp $(TMPDIR)/$@ $@

.PHONY: clean
clean:
	if [ -d $(TMPDIR) ]; then rm --recursive ./$(TMPDIR); fi

.PHONY: distclean
distclean: clean
	if [ -f presentation.pdf ]; then rm presentation.pdf; fi

.PHONY: info
info:
	@echo 'Build directory: $(TMPDIR)'
	@echo 'Dependencies: $(DEPENDENCIES)'

.PHONY: help
help:
	@echo 'Building targets:'
	@echo '  all            - Build the Anfi-Presentation'
	@echo 'Auxiliary targets:'
	@echo '  info           - Show the current configuration of the makefile'
	@echo '  help           - Show this help'
	@echo 'Cleaning targets:'
	@echo '  clean          - Remove the $(TMPDIR)-Directory'
	@echo '  distclean      - Remove the $(TMPDIR)-Directory and presentation.pdf (i.e. everything)'
