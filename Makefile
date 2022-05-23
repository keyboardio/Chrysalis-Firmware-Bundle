all: default experimental

BOARDS =                \
	EZ/ErgoDox            \
	Keyboardio/Atreus     \
	Keyboardio/Model01    \
  Keyboardio/Model100   \
	SOFTHRUF/Splitography \
	Technomancy/Atreus

default: message/default dirs   \
	$(foreach board,${BOARDS},${board}@default)

experimental: message/experimental dirs \
	$(foreach board,${BOARDS},${board}@experimental)

${BOARDS}:
	${MAKE} $@@default $@@experimental

dirs:
	install -d output

message/%:
	echo "Building $* firmware sketches" | sed -e "s,.,=,g"
	echo "Building $* firmware sketches"
	echo "Building $* firmware sketches" | sed -e "s,.,=,g"
	echo

%@default: BUILDDIR := $(shell mktemp -d)
%@default: BOARD := $(notdir $*)
%@default:
	echo Building $*...
	${MAKE} -s -C $*/default/$(notdir $*) compile \
		OUTPUT_PATH=${BUILDDIR} SKETCH_OUTPUT_DIR="default"
	install -d output/$*
	cp -L ${BUILDDIR}/*-latest.hex output/$*/default.hex
	rm -rf "${BUILDDIR}"
	echo

%@experimental: %@experimental-dircheck
	:
%@experimental-dircheck:
	if [ -d $*/experimental/$(notdir $*) ]; then \
		${MAKE} -s $*@experimental/real; \
	else \
		echo "- No experimental firmware for $* -"; echo; echo; \
	fi
%@experimental/real: BUILDDIR := $(shell mktemp -d)
%@experimental/real:
	if [ ! -d $*/experimental/$(notdir $*) ]; then exit 0; fi
	echo Building $*...
	${MAKE} -s -C $*/experimental/$(notdir $*) compile \
		OUTPUT_PATH=${BUILDDIR} SKETCH_OUTPUT_DIR="experimental"
	install -d output/$*
	cp -L ${BUILDDIR}/*-latest.hex output/$*/experimental.hex
	rm -rf "${BUILDDIR}"
	echo

clean:
	rm -rf output
	find . -type d -name 'output' | xargs rm -rf

.SILENT:
.PHONY: ${BOARDS}
