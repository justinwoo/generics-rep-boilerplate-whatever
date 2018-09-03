build: generate
	pulp build
generate:
	perl perl/generics.pl > src/Types.Generated.purs
