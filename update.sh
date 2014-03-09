#!/bin/bash

export PORTAGE_TMPDIR=/dev/shm

emerge --sync
emerge --update --ask --deep --with-bdeps=y @world
emerge --depclean --ask

rm -rf $PORTAGE_TMPDIR/portage

