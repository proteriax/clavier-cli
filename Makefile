clavier: lib/*.swift
	swiftc $^ -o $@
	chmod +x $@

all: clavier
