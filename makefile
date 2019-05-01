FILES=README.md chapter1.md SUMMARY.md preface.md about-citron.md baby-steps.md basics.md control-flow.md intermission-interpreter-commands.md data-structures.md objects.md io.md exceptions.md libraryimports.md standard-library.md metafunctions.md parser-pragmas.md scratchpad.md inline-assembly-blocks.md 

all:
	pandoc --pdf-engine=xelatex --template=../../../../../../.pandoc/default.latex $(FILES) -o compiled.pdf
