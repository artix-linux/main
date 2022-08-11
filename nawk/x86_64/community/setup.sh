#!/bin/sh

post_install() {
	test ! -f /usr/bin/awk && \
		ln -s /usr/bin/nawk /usr/bin/awk
	test ! -f /usr/share/man/man1/awk.1 && \
		ln -s /usr/share/man/man1/nawk.1 /usr/share/man/man1/awk.1
}

post_upgrade() {
	post_install
}

pre_remove() {
	file /usr/bin/awk | grep -q "symbolic link to nawk" && \
		rm /usr/bin/awk
	file /usr/share/man/man1/awk.1 | grep -q "symbolic link to nawk" && \
		rm /usr/share/man/man1/awk.1   
}
