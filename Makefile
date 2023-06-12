CUE_FILES=$(wildcard ./snippets/*/*.cue)
JSON_FILES=$(patsubst ./%.cue,./%.json,$(CUE_FILES))

.PHONY: all
all: $(JSON_FILES)

%.json: %.cue
	cue eval ./snippets/.snippets.cue $< --out json -f -o $@
