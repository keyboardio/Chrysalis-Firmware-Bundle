all: Technomancy/Atreus/firmware \
     EZ/ErgoDox/firmware

%/firmware:
	@${MAKE} -C $* build
