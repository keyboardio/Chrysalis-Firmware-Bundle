VERSION="0.92.1-snapshot"

export ARDUINO_DIRECTORIES_USER ?= ${CURDIR}/.arduino/user
export ARDUINO_DIRECTORIES_DATA ?= ${CURDIR}/.arduino/data
export HARDWARE_DIR             ?= ${ARDUINO_DIRECTORIES_USER}/hardware/keyboardio
export KALEIDOSCOPE_DIR         ?= ${CURDIR}/lib/Kaleidoscope

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

setup:
	git submodule update --init --recursive
	(cd ${KALEIDOSCOPE_DIR} && make setup)

update:
	git submodule update --init --recursive
	(cd ${KALEIDOSCOPE_DIR} && make update)

.env:
	echo "ARDUINO_DIRECTORIES_USER=\"${ARDUINO_DIRECTORIES_USER}\"" >.env
	echo "ARDUINO_DIRECTORIES_DATA=\"${ARDUINO_DIRECTORIES_DATA}\"" >>.env
	echo "HARDWARE_DIR=\"${HARDWARE_DIR}\"" >>.env
	echo "KALEIDOSCOPE_DIR=\"${KALEIDOSCOPE_DIR}\"" >>.env

.SILENT:
.PHONY: ${BOARDS} clean all message version version-tag setup update .env
