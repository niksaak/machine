# Make .love

all: machine.love

run: machine.love
	love machine.love

.PHONY: machine.love
machine.love:
	zip -9 -r $@ main.lua conf.lua gfx/ lua/ sfx/

clean:
	@-rm -fv machine.love
