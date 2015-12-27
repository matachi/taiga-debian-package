PREFIX = /var/www/taiga/
INSTALL_DIR = $(DESTDIR)$(PREFIX)
NGINX_DIR = $(DESTDIR)/etc/nginx
INIT_DIR = $(DESTDIR)/etc/init
LOG_DIR = $(DESTDIR)/var/log/taiga

all: taiga

taiga:
	test -f /tmp/taiga-front.tar.gz || wget -O /tmp/taiga-front.tar.gz \
		https://github.com/taigaio/taiga-front-dist/archive/stable.tar.gz
	mkdir -p /tmp/taiga-front
	tar -xvzf /tmp/taiga-front.tar.gz -C /tmp/taiga-front --strip-components 1
	cp -r /tmp/taiga-front .
	cp files/conf.json taiga-front/dist/js
	
	test -f /tmp/taiga-back.tar.gz || wget -O /tmp/taiga-back.tar.gz \
		https://github.com/taigaio/taiga-back/archive/stable.tar.gz
	mkdir -p /tmp/taiga-back
	tar -xvzf /tmp/taiga-back.tar.gz -C /tmp/taiga-back --strip-components 1
	cp -r /tmp/taiga-back .
	
	cp files/local.py taiga-back/settings/

installdirs:
	test -d $(INSTALL_DIR) || mkdir -p $(INSTALL_DIR)
	test -d $(NGINX_DIR) || mkdir -p $(NGINX_DIR)
	test -d $(INIT_DIR) || mkdir -p $(INIT_DIR)
	test -d $(LOG_DIR) || mkdir -p $(LOG_DIR)

install: installdirs
	cp -r taiga-front $(INSTALL_DIR)
	cp -r taiga-back $(INSTALL_DIR)
	mkdir -p $(NGINX_DIR)/sites-available
	cp files/taiga.conf $(NGINX_DIR)/sites-available/taiga
	mkdir -p $(NGINX_DIR)/sites-enabled
	cp files/taiga.conf $(NGINX_DIR)/sites-enabled/taiga
	cp files/circus.conf $(INIT_DIR)
	cp files/circus.ini $(INSTALL_DIR)

clean:
	rm -rf taiga-front
	rm -f /tmp/taiga-front.tar.gz
	rm -rf /tmp/taiga-front
	
	rm -rf taiga-back
	rm -f /tmp/taiga-back.tar.gz
	rm -rf /tmp/taiga-back

