#!/bin/sh

# This only works in iLab, it is to refresh and publish all docs to jevois.org


# First, make the JeVois doc so we get the tagfile for cross-linking to jevoisbase:
cd $JEVOIS_SRC_ROOT 
if [ ! -d hbuild ]; then ./rebuild-host.sh; fi
cd hbuild
make doc

# Then, extract modinfo doc for all modules:
cd ../../jevoisbase
rm -f src/Modules/*/modinfo*
if [ ! -d hbuild ]; then ./rebuild-host.sh; fi
cd hbuild
make -j 50

# Then make and publish the jevoisbase doc, which also creates its tagfile:
make docweb

# Finally make the jevois doc one more time and publish it:
cd $JEVOIS_SRC_ROOT 
cd hbuild
make docweb
