Gentoo Prefix
=============

Portage
-------

### Config files

 * Make config file: [make.conf](etc/portage/make.profile/make.conf)
 * System-wide USE flags: [make.conf](etc/portage/make.profile/make.conf)
 * Package specific USE flags: [package.use](etc/portage/package.use)
 * Packages provided by the host system: [package.provided](etc/portage/package.provided)

### Using emerge

Install a package with custom use flags:

    USE="flag1 -flag2" emerge something

Overwrite system files:

    FEATURES="-collision-detect -protect-owned" emerge =repo/pkg-version

Accept custom license:

    ACCEPT_LICENSE="*" or "@FREE"

### Layman (overlay manager)

source $EPREFIX/var/lib/layman/make.conf


### Manually building packages

All package files and patches are in

    $EPREFIX/usr/portage/*

To build a package manually, the commands are:

    # edit the .ebuild file...
    ebuild R-3.0.2.ebuild manifest
    ebuild R-3.0.2.ebuild clean
    ebuild R-3.0.2.ebuild configure # configure only
    ebuild R-3.0.2.ebuild merge     # all steps, install after

Non-Gentoo patches
------------------

### portage
/nfs/research2/saezrodriguez/mike-software/usr/lib/portage/pym/portage/process.py
518/522 gid, groupstuff: pass

### shell bashrc

Setting up *PATH*, *LD_LIBRARY_PATH* in [etc/bash/bashrc](etc/bash/bashrc).
This file is automatically executed for the prefix bash (and also sets up the
LSF config). Otherwise, add the three lines below to the user bashrc:

    export EPREFIX=/nfs/research2/saezrodriguez/mike-software
    export PATH=$EPREFIX/usr/bin:$EPREFIX/sbin:$EPREFIX/bin:$PATH
    export LD_LIBRARY_PATH=$EPREFIX/usr/lib:$LD_LIBRARY_PATH


### vim

Files for setting up vim:

 * [vimrc.local](etc/vim/vimrc.local)
 * [wombat](usr/share/vim/vim74/colors/)

Installed plugins:

    emerge app-vim/youcompleteme

### BLAS/LAPACK
link .pc files to PKGCONFIG dir, LAPACK= env var for scipy

stable packages
etc/portage/make.profile/make.defaults
~amd64-linux -> w/o ~


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


