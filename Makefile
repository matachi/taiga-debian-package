PREFIX = /var/www/taiga/
INSTALL_DIR = $(DESTDIR)$(PREFIX)

all: taiga

taiga:
	test -f /tmp/taiga-front.tar.gz || wget -O /tmp/taiga-front.tar.gz \
		https://github.com/taigaio/taiga-front-dist/archive/stable.tar.gz
	mkdir -p /tmp/taiga-front
	tar -xvzf /tmp/taiga-front.tar.gz -C /tmp/taiga-front --strip-components 1
	cp -r /tmp/taiga-front .
	
	test -f /tmp/taiga-back.tar.gz || wget -O /tmp/taiga-back.tar.gz \
		https://github.com/taigaio/taiga-back/archive/stable.tar.gz
	mkdir -p /tmp/taiga-back
	tar -xvzf /tmp/taiga-back.tar.gz -C /tmp/taiga-back --strip-components 1
	cp -r /tmp/taiga-back .

installdirs:
	test -d $(INSTALL_DIR) || mkdir -p $(INSTALL_DIR)

install: installdirs
	cp -r taiga-front $(INSTALL_DIR)
	cp -r taiga-back $(INSTALL_DIR)

clean:
	rm -rf taiga-front
	rm -f /tmp/taiga-front.tar.gz
	rm -rf /tmp/taiga-front
	
	rm -rf taiga-back
	rm -f /tmp/taiga-back.tar.gz
	rm -rf /tmp/taiga-back

