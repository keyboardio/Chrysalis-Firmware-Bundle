all: Technomancy/Atreus/firmware

%/firmware:
	@${MAKE} -C $* build
