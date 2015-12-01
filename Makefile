PREFIX = /var/www/taiga/
INSTALL_DIR = $(DESTDIR)$(PREFIX)

all: clean taiga

taiga:
	test -f /tmp/stable.tar.gz || wget -P /tmp \
		https://github.com/taigaio/taiga-front-dist/archive/stable.tar.gz
	mkdir -p /tmp/taiga-front
	tar -xvzf /tmp/stable.tar.gz -C /tmp/taiga-front --strip-components 1
	cp -r /tmp/taiga-front .

installdirs:
	test -d $(INSTALL_DIR) || mkdir -p $(INSTALL_DIR)

install: installdirs
	cp -r taiga-front $(INSTALL_DIR)

clean:
	rm -rf taiga-front
	rm -f /tmp/stable.tar.gz
	rm -rf /tmp/taiga-front

