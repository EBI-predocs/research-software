gentoo-prefix
=============

r-tcltk
configure.ac:374 $EPREFIX

### portage patch for cluster
/nfs/research2/saezrodriguez/mike-software/usr/lib/portage/pym/portage/process.py
518/522 gid, groupstuff: pass

vim color scheme
vimrc @ /nfs/nobackup2/saezgrp/mike-software/gentoo/etc/vim/vimrc.local
wombat @ /nfs/nobackup2/saezgrp/mike-software/gentoo/usr/share/vim/vim74/colors/

### specific packages
rlog:
change doc dir to $EPREFIX @ebuild && ebuild file manifest
encfs:
ac_boost_path=/nfs/nobackup2/saezgrp/mike-software/gentoo/usr/ ACCEPT_KEYWORDS="**" USE="-doc" emerge encfs

### BLAS/LAPACK
link .pc files to PKGCONFIG dir, LAPACK= env var for scipy

$EPREFIX/etc/portage/make.profile/make.conf
# use the 2nd optimization level (-O3 can be unstable), 
# use pipes rather than temporary files for compilation 
# stages, and tune the binary to make use of native
# processor capabilities
CFLAGS="-O2 -pipe -march=native"
# These flags apply to C++ as well
CXXFLAGS="${CFLAGS}"

### etc/portage/make.conf
USE="cairo svg tiff gif jpeg png gzip bzip2 truetype X lapack blas python perl ruby nls ncurses readline xml bash-completion openmp -doc fortran pcre ssl sqlite threads"
# for overlay: graphviz imagemagick int64
#addd: clang
source /nfs/research2/saezrodriguez/mike-software/var/lib/layman/make.conf

### etc/portage/package.provided


PACKAGE USE FLAGS: etc/portage/package.use
dev-lang/R tk
sci-libs/mkl fftw
sci-libs/hdf5 -fortran -cxx
media-gfx/tachyon mpi

stable packages
etc/portage/make.profile/make.defaults
~amd64-linux -> w/o ~

collisions, keywords, licenses
FEATURES="-collision-detect -protect-owned" emerge =repo/pkg-version
ACCEPT_LICENSE="*" or "@FREE"

Package files and patches
usr/portage/*

### Fixing ebuilds
ebuild R-3.0.2.ebuild manifest
ebuild R-3.0.2.ebuild clean [if files left over from previous tries]
ebuild R-3.0.2.ebuild merge

### intel mkl
copy /opt/intel/licenses/* to prefix
systems recommends icc instead of gcc, does that make sense? (and: will it work?)

$EPREFIX/etc/bash/bashrc
export EPREFIX=/nfs/research2/saezrodriguez/mike-software
export PATH=$EPREFIX/usr/bin:$EPREFIX/sbin:$EPREFIX/bin
export LD_LIBRARY_PATH=$EPREFIX/usr/lib:/usr/lib

PATH=$PATH:/ebi/lsf/ebi/ppm/9.1/bin:/ebi/lsf/ebi/ppm/9.1/linux2.6-glibc2.3-x86_64/bin:/ebi/lsf/ebi/9.1/linux2.6-glibc2.3-x86_64/etc:/ebi/lsf/ebi/9.1/linux2.6-glibc2.3-x86_64/bin:/usr/kerberos/sbin:/usr/kerberos/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/ebi/lsf/ebi/ppm/9.1/linux2.6-glibc2.3-x86_64/lib:/ebi/lsf/ebi/9.1/linux2.6-glibc2.3-x86_64/lib
export LSF_BINDIR=/ebi/lsf/ebi/9.1/linux2.6-glibc2.3-x86_64/bin
export LSF_ENVDIR=/ebi/lsf/ebi/conf
export LSF_LIBDIR=/ebi/lsf/ebi/9.1/linux2.6-glibc2.3-x86_64/lib
export LSF_SERVERDIR=/ebi/lsf/ebi/9.1/linux2.6-glibc2.3-x86_64/etc


