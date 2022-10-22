VERSION="0.91.0-snapshot"

ifdef EXTRA_VERSION
 ifeq (${VERSION},$(subst -snapshot,,${VERSION}))
  EMBEDDED_VERSION="${VERSION}+${EXTRA_VERSION}"
 else
  EMBEDDED_VERSION="${VERSION}.${EXTRA_VERSION}"
 endif
else
 EMBEDDED_VERSION="${VERSION}"
endif

BOARDS =                \
	EZ/ErgoDox            \
	Keyboardio/Atreus     \
	Keyboardio/Model01    \
  Keyboardio/Model100   \
	SOFTHRUF/Splitography \
	Technomancy/Atreus

all: message output	$(foreach board,${BOARDS},${board}@build)
	:

version:
	@echo "${EMBEDDED_VERSION}"

version-tag:
	@echo "v${VERSION}"

output:
	install -d output

message:
	echo "=========================="
	echo "Building firmware sketches"
	echo "=========================="

${BOARDS}: %: %@build

%@build: BUILDDIR := $(shell mktemp -d)
%@build:
	echo "* Building $*"
	${MAKE} -s -C $* compile OUTPUT_PATH=${BUILDDIR} \
				  LOCAL_CFLAGS="-DKALEIDOSCOPE_FIRMWARE_VERSION=\\\"${EMBEDDED_VERSION}\\\""
	install -d output/$*
	if [ -e ${BUILDDIR}/*-latest.bin ]; then \
		cp -L ${BUILDDIR}/*-latest.bin output/$*/default.bin; \
	else \
		cp -L ${BUILDDIR}/*-latest.hex output/$*/default.hex; \
	fi
	rm -rf "${BUILDDIR}"
	echo

clean:
	rm -rf output
	find . -type d -name 'output' | xargs rm -rf

.SILENT:
.PHONY: ${BOARDS} clean all message version version-tag
