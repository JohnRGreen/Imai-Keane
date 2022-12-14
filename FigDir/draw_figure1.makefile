ALL_FIGURE_NAMES=$(shell cat draw_figure1.figlist)
ALL_FIGURES=$(ALL_FIGURE_NAMES:%=%.pdf)

allimages: $(ALL_FIGURES)
	@echo All images exist now. Use make -B to re-generate them.

FORCEREMAKE:

-include $(ALL_FIGURE_NAMES:%=%.dep)

%.dep:
	mkdir -p "$(dir $@)"
	touch "$@" # will be filled later.

draw_figure1-figure0.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "draw_figure1-figure0" "\def\tikzexternalrealjob{draw_figure1}\input{draw_figure1}"; convert -density 300 -transparent white "draw_figure1-figure0.pdf" "draw_figure1-figure0.png"

draw_figure1-figure0.pdf: draw_figure1-figure0.md5
draw_figure1-figure1.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "draw_figure1-figure1" "\def\tikzexternalrealjob{draw_figure1}\input{draw_figure1}"

draw_figure1-figure1.pdf: draw_figure1-figure1.md5
