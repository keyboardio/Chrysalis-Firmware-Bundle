all: Technomancy/Atreus/firmware \
     EZ/ErgoDox/firmware         \
     Keyboardio/Model01/firmware

%/firmware:
	@${MAKE} -C $* build
