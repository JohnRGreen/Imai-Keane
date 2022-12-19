# Computational Methods Semester Project

This GitHub repository implements a reproduction of the 2004 paper by Susumu Imai and Michael P. Keane, " Intertemporal Labor Supply and Human Capital Accumulation." This is my semester project for Chris Carroll's course in [computational methods](https://link-url-here.org), and uses a simplified version of the architecture used in Carroll's [Buffer Stock Theory](https://github.com/econ-ark/BufferStockTheory) project.  For now this is just a reproduction, but the goal is ultimately to turn this into a full replication of the paper.

## Requirements
- Ubuntu 22.04
- Python 3.11
- TeX Live 2021 or 2022

## Usage

1. Clone the repository
2. Run "reproduce.sh"
3. A PDF of the paper as well as a set of accompanying slides will be saved in LaTeX folder

## LaTeX tools used in the paper:
- Tikz to make figures
- Paperpile to track sources and create a BibTex file
- Natbib to create a bibliography and cite sources
- Parts of the paper included as subfiles as well as printed using "input"
- File structure is organized using "econtexPaths" and "econtexRoot" to enable Overleaf compilation; these are defined, along with a few other tools, in the "TeXtools" folder
- Tables, figures, and equations are created separately and included as subfiels, images, and printed using "input"