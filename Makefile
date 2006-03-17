prefix = /usr
INSTALL = install

directoryassistant.1.gz:
#	python -c 'import ldap'
#	python -c 'import gobject'
	cat directoryassistant.1 | gzip -9 > directoryassistant.1.gz

install: directoryassistant.1.gz
	${INSTALL} -d -m 755 ${prefix}/share/man/man1/
	${INSTALL} -d -m 755 ${prefix}/bin/
	${INSTALL} -g 0 -o root -m 0644 directoryassistant.1.gz ${prefix}/share/man/man1/
	${INSTALL} -g 0 -o root -m 0755 directoryassistant ${prefix}/bin/

uninstall:
	rm -f ${prefix}/share/man/man1/directoryassistant.1.gz
	rm -f ${prefix}/bin/directoryassistant

clean:
	rm -f *.gz
	rm -f *~

distclean: clean
	
