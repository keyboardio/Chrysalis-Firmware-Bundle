all: default experimental

BOARDS =                \
	EZ/ErgoDox            \
	Keyboardio/Model01    \
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

%@default:
	${MAKE} -C $*/default build
	install -d output/$*
	cp -L $*/default/output/*/*-latest.hex output/$*/default.hex

%@experimental:
	${MAKE} -C $*/experimental build
	install -d output/$*
	cp -L $*/experimental/output/*/*-latest.hex output/$*/experimental.hex

clean:
	rm -rf output
	find . -type d -name 'output' | xargs rm -rf

.SILENT:
.PHONY: ${BOARDS}
