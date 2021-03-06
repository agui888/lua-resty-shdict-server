OPENRESTY_PREFIX=/usr/local/openresty

PREFIX ?=          /usr/local
LUA_LIB_DIR ?=     $(PREFIX)/lib/lua/$(LUA_VERSION)
INSTALL ?= install

.PHONY: all test install

all: ;

install: all
        $(INSTALL) -d $(DESTDIR)$(LUA_LIB_DIR)/resty/shdict/
        $(INSTALL) lib/resty/shdict/*.lua $(DESTDIR)$(LUA_LIB_DIR)/resty/shdict/

test: all
        PATH=$(OPENRESTY_PREFIX)/nginx/sbin:$$PATH prove -I../test-nginx/lib -r t
