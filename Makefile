all: default experimental

default: message/default dirs \
	EZ/ErgoDox@default          \
	Technomancy/Atreus@default  \
	Keyboardio/Model01@default

experimental: message/experimental dirs \
	EZ/ErgoDox@experimental               \
	Keyboardio/Model01@experimental       \
	Technomancy/Atreus@experimental

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
