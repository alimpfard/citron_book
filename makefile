FILES=about-citron.md baby-steps.md basics.md chapter1.md control-flow.md data-structures.md exceptions.md expressions-and-messages.md functions.md inline-assembly-blocks.md installation.md intermission-interpreter-commands.md io.md libraryimports.md objects.md parser-pragmas.md parse-time-meta-functions.md preface.md README.md scratchpad.md standard-library.md SUMMARY.md

all:
	pandoc --pdf-engine=xelatex --template=../../../../../../.pandoc/default.latex $(FILES) -o compiled.pdf
