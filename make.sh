#!/bin/bash

set -x

#### Approach no. 1

stubname=test1

# Step 1: # This step produces test.p.tex which includes command \usepackage{animate}
doconce format pdflatex $stubname.do.txt 

# # Step 2 :# This step converts test.p.tex to test.tex which also includes command \usepackage{animate}
doconce ptex2tex $stubname.p.tex

# mv $stubname.tex $stubname-Article.tex
pdflatex $stubname-Article.tex

# Pdf based on article class is generated with animation added with the use of the command \begin{animateinline}

# # Step 3: # This creates tex files that contain \usepackage{animate}
doconce format pdflatex $stubname.do.txt
doconce ptex2tex $stubname.p.tex

mv $stubname.p.tex $stubname-Beamer.p.tex
mv $stubname.tex $stubname-Beamer.tex

# # NOTE: `doconce slides_beamer` needs .tex file as a parameter. After being processed this  file is overwritten.

# # Step 4: # This creates tex files that DOES NOT contain \usepackage{animate}, although it does contain \begin{animateinline}

doconce slides_beamer $stubname-Beamer --beamer_slide_theme=red_shadow   # this command needs .tex file 




#### Approach no. 2

stubname=test2


# # #Step 1: # This step produces test.p.tex which includes command \usepackage{animate}
doconce format pdflatex $stubname.do.txt --latex_packages=animate


# # # Step 2 :# This step converts test.p.tex to test.tex which also includes command \usepackage{animate}
doconce ptex2tex $stubname.p.tex

#  mv $stubname.tex $stubname-Article.tex
pdflatex $stubname-Article.tex

# # Pdf based on article class is generated with animation (NOTE: Animation can be seen only in Acrobat Reader)

# Step 3: # This creates tex files that contain \usepackage{animate}
doconce format pdflatex $stubname.do.txt --latex_packages=animate
doconce ptex2tex $stubname.p.tex

mv $stubname.p.tex $stubname-Beamer.p.tex
mv $stubname.tex $stubname-Beamer.tex

# NOTE: `doconce slides_beamer` needs .tex file as a parameter. After being processed this  file is overwritten.

# Step 4: # This creates tex files that DOES NOT contain \usepackage{animate}, although it does contain \begin{animateinline}

doconce slides_beamer $stubname-Beamer --beamer_slide_theme=red_shadow   # this command needs .tex file 

# test2-Beamer.tex created after this command is a beamer .tex file which includes line:
# This is latex
# \animategraphics[autoplay,loop,height=2cm]{5}{experiments/frame_}{0}{1}

# however its preamble DOES NOT contain \usepackage{animate}
