#!/bin/bash

export PORTAGE_TMPDIR=/dev/shm

emerge --sync
layman -S
emerge --update --ask --deep --newuse --with-bdeps=y @world
emerge --depclean --ask

rm -rf $PORTAGE_TMPDIR/portage

