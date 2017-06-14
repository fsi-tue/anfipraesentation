# Makefile für die Anfi-Präsentation

# Variablen für die Build-Ordner
TMPDIR = tmp

# Die dependencies müssen stimmen, da sonst keine rebuilds ausgeführt
# werden! "\RequirePackage{snapshot}" ist hier sehr hilfreich, am besten
# aktualisiert man das mal noch automatisch.
DEPENDENCIES =  pictures/fsilogo_neu.pdf pictures/fachschaft.jpg \
  pictures/fsi_saeulen.pdf pictures/chf_jodel.jpg \
  pictures/sommerfest_platzhalter.png pictures/uebersicht_sand.pdf \
  pictures/uebersicht_pi.pdf pictures/keepcalm.pdf

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
	@echo '  all            - Build the Anfi-Heft'
	@echo 'Auxiliary targets:'
	@echo '  info           - Show the current configuration of the makefile'
	@echo '  help           - Show this help'
	@echo 'Cleaning targets:'
	@echo '  clean          - Remove the $(TMPDIR)-Directory'
	@echo '  distclean      - Remove the $(TMPDIR)-Directory and presentation.pdf (i.e. everything)'
