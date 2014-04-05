Gentoo Prefix
=============

User guide
----------

In general, software should work out of the box.

If it doesn't (or you would like something installed) open it as an issue and I'll
see what I can do.

Portage
-------

### Config files

 * etc
   * bash
     * [bashrc](etc/bash/bashrc)
   * portage
     * [make.conf](etc/portage/make.profile/make.conf) - global USE flags, make flags
     * [package.provided](etc/portage/package.provided) - packages provided by host system
     * [package.unmask](etc/portage/package.unmask) - whitelisted masked packages
     * [package.use](etc/portage/package.use) - package-specific USE flags
   * vim
     * [vimrc.local](etc/vim/vimrc.local)
 * usr
   * lib/R/library/BatchJobs/etc
     * [BatchJobs_global_config.R](lib/R/library/BatchJobs/etc/BatchJobs_global_config.R) - 
       BatchJobs LSF config file
   * share/vim/vim74/colors
     * wombat.vim, wombat256.vim - wombat color scheme
 * var
   * lib
     * layman
       * [make.conf](var/lib/layman/make.conf) - configuration of overlays
     * portage
       * [world](var/lib/portage/world) - list of all explicitly installed packages

### Using emerge

Install a package with custom use flags:

    USE="flag1 -flag2" emerge something

Overwrite system files:

    FEATURES="-collision-detect -protect-owned" emerge =repo/pkg-version

Accept keywords (do not use this on global updates):

    ACCEPT_KEYWORDS="**"

Accept custom license:

    ACCEPT_LICENSE="**" or "@FREE"

### Using eselect

Selecting specific software versions

    eselect python list      # lists all available python interpreters
    eselect python set <num> # choose interpreter <num> as default

Read prefix-specific news

    eselect news list        # list all items
    eselect news read <num>  # read item with number <num>

### Layman (overlay manager)

source $EPREFIX/var/lib/layman/make.conf

### Manually building packages

All package files and patches are in

    usr/portage/*

To build a package manually, the commands are:

    # edit the .ebuild file...
    ebuild R-3.0.2.ebuild manifest
    ebuild R-3.0.2.ebuild clean
    ebuild R-3.0.2.ebuild configure # configure only
    ebuild R-3.0.2.ebuild merge     # all steps, install after

Non-Gentoo patches
------------------

### portage

The following path is needed for [portage/process.py](usr/lib/portage/pym/portage/process.py)
because users can't set group IDs on the EBI cluster:

    --- process.py.orig  2014-03-09 15:55:17.382599199 +0000
    +++ process.py   2014-03-09 15:55:03.455078692 +0000
    @@ -515,9 +515,9 @@ def _exec(binary, mycommand, opt_name, f
        # Set requested process permissions.
        if gid:
            # Cast proxies to int, in case it matters.
    -       os.setgid(int(gid))
    +       pass
        if groups:
    -       os.setgroups(groups)
    +       pass
        if uid:
            # Cast proxies to int, in case it matters.
            os.setuid(int(uid))

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

Use openblas from the `science` overlay.

Note: below are MKL tryouts but they don't work

> link .pc files to PKGCONFIG dir, LAPACK= env var for scipy
> 
> stable packages
> etc/portage/make.profile/make.defaults
> ~amd64-linux -> w/o ~
>
> intel mkl
> copy /opt/intel/licenses/* to prefix
> systems recommends icc instead of gcc, does that make sense? (and: will it work?)

