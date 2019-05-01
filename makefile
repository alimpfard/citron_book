FILES=README.md SUMMARY.md dedication.md preface.md about-citron.md baby-steps.md basics.md control-flow.md intermission-interpreter-commands.md data-structures.md objects.md io.md exception.md library-imports.md standard-library.md meta-functions.md parser-pragmas.md scratchpad.md inline-assembly-blocks.md 

all:
	pandoc --pdf-engine=xelatex --template=../../../../../../.pandoc/default.latex $(FILES) -o compiled.pdf
