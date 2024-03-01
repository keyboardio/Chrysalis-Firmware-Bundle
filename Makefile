VERSION="0.92.3-snapshot"

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
	Keyboardio/Atreus     \
	Keyboardio/Model01    \
  	Keyboardio/Model100

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
	(cd ${KALEIDOSCOPE_DIR} && make setup && make update)

update:
	git submodule update --init --recursive
	(cd ${KALEIDOSCOPE_DIR} && make update)


pull-kaleidoscope: setup
	(cd ${KALEIDOSCOPE_DIR}  && git fetch origin && git pull origin master)
	git commit -s -m "Updated Kaleidoscope to origin/master" lib/Kaleidoscope

.env:
	echo "ARDUINO_DIRECTORIES_USER=\"${ARDUINO_DIRECTORIES_USER}\"" >.env
	echo "ARDUINO_DIRECTORIES_DATA=\"${ARDUINO_DIRECTORIES_DATA}\"" >>.env
	echo "HARDWARE_DIR=\"${HARDWARE_DIR}\"" >>.env
	echo "KALEIDOSCOPE_DIR=\"${KALEIDOSCOPE_DIR}\"" >>.env


create-snapshot:
	./tools/release create-snapshot

collect-build-info:
	./tools/collect-build-info


finalize-release:
	./tools/release finalize

update-tag-and-delete-gh-release:
	gh release delete -y ${TAG} || true
	git tag -d ${TAG} || true
	git tag ${TAG} HEAD
	git push origin ${TAG} --force

create-gh-release:
	gh release create -p \
		-t "Chrysalis Firmware Bundle $(EMBEDDED_VERSION)"\
		-F ${OUTPUT_DIR}/release-notes.md \
		${TAG}

upload-gh-release:
	gh release upload ${TAG} \
		firmware-files.tar.gz \
		${OUTPUT_DIR}/build-info.yml \
		${OUTPUT_DIR}/firmware-changelog.md

package-firmware-build:
	tar -C ${OUTPUT_DIR} -czvf firmware-files.tar.gz .


.SILENT:
.PHONY: ${BOARDS} clean all message version version-tag setup update .env
