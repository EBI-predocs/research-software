Gentoo Prefix - Admin guide
===========================

The research software repository is powered by [Gentoo Prefix](https://wiki.gentoo.org/wiki/Project:Prefix),
which is essentially a full Gentoo distribution that is installed a directory of the host system.

This has the advantage that it does not require root privileges and can install newer software on
an existing system without having to worry about backwards compatibility because it is installed
on top of the host system.

Config files
------------

 * etc
   * bash
     * [bashrc](etc/bash/bashrc) - default bashrc, LSF setup
   * portage
     * [make.conf](etc/portage/make.conf) - global USE flags, make flags
     * [package.provided](usr/portage/profiles/prefix/linux/package.provided) - packages provided by host system
     * [package.unmask](etc/portage/package.unmask) - whitelisted masked packages
     * [package.use](etc/portage/package.use) - package-specific USE flags
     * [package.accept_keywords](etc/portage/package.accept_keywords) - unstable keywords for otherwise stable system
   * vim
     * [vimrc.local](etc/vim/vimrc.local) - default vim config
 * usr
   * portage/profiles/prefix/linux
     * [package.provided](usr/portage/profiles/prefix/linux/package.provided) - list of packages provided by the host system
   * share/vim/vim74/colors
     * [wombat.vim](usr/share/vim/vim74/colors/wombat.vim),
       [wombat256.vim](usr/share/vim/vim74/colors/wombat256.vim) - wombat color scheme
 * var
   * lib
     * layman
       * [make.conf](var/lib/layman/make.conf) - configuration of overlays
     * portage
       * [world](var/lib/portage/world) - list of all explicitly installed packages

Using portage
-------------

[Portage](https://wiki.gentoo.org/wiki/Portage) is Gentoo's package manager
that will install and update packages, keep track of dependencies, and remove packages
that are no longer needed.

The command-line tool is called emerge, and you can install packages by typing
`emerge <package name>`.

### Command-line arguments

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
