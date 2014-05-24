Gentoo Prefix
=============

User guide
----------

Setup instructions are available in the [config repository](https://github.com/EBI-predocs/config#setting-up-your-environment). In general, software should work out of the box.

If you have problems (or you would like something installed) open it as an issue and I'll
see what I can do.

Admin guide
-----------

### Config files

 * etc
   * bash
     * [bashrc](etc/bash/bashrc)
   * portage
     * [make.conf](etc/portage/make.profile/make.conf) - global USE flags, make flags
     * [package.provided](etc/portage/package.provided) - packages provided by host system
     * [package.unmask](etc/portage/package.unmask) - whitelisted masked packages
     * [package.use](etc/portage/package.use) - package-specific USE flags
     * [package.accept_keywords](etc/portage/package.accept_keywords) - unstable keywords for otherwise stable system
   * vim
     * [vimrc.local](etc/vim/vimrc.local) - default vim config
 * usr
   * lib/R/library/BatchJobs/etc
     * [BatchJobs_global_config.R](usr/lib/R/library/BatchJobs/etc/BatchJobs_global_config.R) - 
       BatchJobs LSF config file
   * share/vim/vim74/colors
     * [wombat.vim](usr/share/vim/vim74/colors/wombat.vim),
       [wombat256.vim](usr/share/vim/vim74/colors/wombat256.vim) - wombat color scheme
 * var
   * lib
     * layman
       * [make.conf](var/lib/layman/make.conf) - configuration of overlays
     * portage
       * [world](var/lib/portage/world) - list of all explicitly installed packages

### Using emerge

Install a package with custom use flags (preferred:
        [package.use](etc/portage/package.use) file):

    USE="flag1 -flag2" emerge something

Accept keywords (do not use this on global updates; preferred:
        [package.accept_keywords](etc/portage/package.accept_keywords) file):

    ACCEPT_KEYWORDS="**"

Overwrite system files:

    FEATURES="-collision-detect -protect-owned" emerge =repo/pkg-version

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

List available overlays:

    layman -L

Add an overlay:

    layman -a <overlay name>

Update all overlays:

    layman -S

Packages are added to the main portage tree and can be installed and updated 
using `emerge`. Explicit referencing can be done with `repo/pkg::overlay`.

### Manually building packages

All package files and patches are in [usr/portage/*](usr/portage)

To build a package manually, the commands are:

    # edit the .ebuild file...
    ebuild R-3.0.2.ebuild manifest
    ebuild R-3.0.2.ebuild clean
    ebuild R-3.0.2.ebuild configure # configure only
    ebuild R-3.0.2.ebuild merge     # all steps, install after

The full list of options is below.

    !!! clean      cleanrm    compile    config     configure  depend     
    !!! digest     fetch      fetchall   help       info       install    
    !!! manifest   merge      nofetch    package    postinst   postrm     
    !!! preinst    prepare    prerm      pretend    qmerge     rpm        
    !!! setup      test       unmerge    unpack     

EBI cluster setup
-----------------

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

### BLAS/LAPACK

Use `openblas` from the `science` overlay.

    emerge lapack-reference::science openblas lapack::science cblas::science blas::science 
    eselect cblas set openblas-threads # R has problems with openblas-int64-threads
    eselect blas set openblas-threads
    eselect lapack set reference

### Links

    ln -s /usr/bin/crontab $EPREFIX/usr/bin/crontab
    ln -s /usr/bin/finger $EPREFIX/usr/bin/finger
    ln -s /usr/bin/svn $EPREFIX/usr/bin/svn

