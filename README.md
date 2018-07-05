User guide
==========

*This is a configuration file and issue tracker for the [cluster
installation](https://github.com/EBI-predocs/research-software/blob/ebi/var/lib/portage/world) that we maintain. If you have any problems
or would like a specific tool installed, [report it here](https://github.com/EBI-predocs/research-software/issues/new). It is
public for easier issue tracking within EBI and to make custom build scripts
available to anyone who would like to use them, as agreed with [Nick
Goldman](http://www.ebi.ac.uk/about/people/nick-goldman) in July 2016.*

Setting up your environment
---------------------------

Software packages installed on the computing cluster are often outdated and
scientific software largely missing because the administrators only use
official repositories. This is why we created a shared installation based on
[Gentoo Prefix](https://wiki.gentoo.org/wiki/Project:Prefix).  Using any of the
methods below, you will be able to use the shared installed packages on the
clusters.

* [*Installed packages on ebi*](https://github.com/EBI-predocs/research-software/blob/ebi/var/lib/portage/world)
* [*Installed packages on yoda*](https://github.com/EBI-predocs/research-software/blob/yoda/var/lib/portage/world)

If you have problems (or you would like something installed) [open it as an
issue](https://github.com/EBI-predocs/research-software/issues/new) and we'll see what we can do.

### Using a pre-configured environment (preferred)

To just use the environment as it is set up, [change your Login
Shell](https://www.ebi.ac.uk/systems-srv/mp/login)
to the one below:

```bash
/nfs/software/software/prefix/bin/bash
```

Note that the change might take a while (in the order of minutes) to be applied.

### Setting up paths in the bashrc (alternative)

Alternatively, you can add the path to your cluster `~/.bashrc`. Do not set
your `LD_LIBRARY_PATH` as we are resolving library locations using
[RPATH](https://en.wikipedia.org/wiki/Rpath).

```bash
export PATH=/nfs/software/software/prefix/usr/bin:$PATH
```

### Using the software for one session only (alternative)

If you want to try out the prefix setup, use the script below to temporarily
add to your your `PATH`. This only affects your current session.

```bash
bash /nfs/software/software/prefix/startprefix
```

Managing your own software
--------------------------

Install your own software in your group's NFS folder, not in
your `$HOME` directory.  The reason for that is that your home space is limited
to 10 Gb and NFS is generally faster.

### Python packages

There are two version of python installed: 2.7 and the latest in the 3.x
series. The default executable is 2.7, and you can access 3.x using
`python-3.x` in your `$PATH`.

There is a fair amount of packages included in the general installation
(including the scientific stack `numpy`, `scipy`, `matplotlib`, `pandas`; the
scikits; `ipython` incl. notebooks, etc.)

Non-standard packages should be installed per user, which can be easily done
using `pip` (for python 2.7) or `pip3` (for python 3.x):

```bash
pip install --user *package-name*
pip3 install --user *package-name*
```

If you are developing python scripts, you should investigate using
[virtualenv](https://virtualenv.pypa.io/en/stable/) to control the packages and
python version you are using.

### R packages

R packages often change their API, break from time to time, and are generally
not that stable. This is why there is no central installation of CRAN and
BioConductor, but each user should maintain their own installation. This is not
a problem because R comes with its own package manager.

Below is an example *~/.Rprofile* that sets up the user environment:

```r
# all your packages will be installed in this directory
.libPaths("~/R")

options(
# you will always want this
stringsAsFactors = FALSE,

# don't wait for X11 but display text menus; also use the EBI CRAN mirror by default
menu.graphics = FALSE,
repos = structure(c(CRAN="http://mirrors.ebi.ac.uk/CRAN/"))
)

# print the traceback of errors on non-interactive scripts
if (!interactive())
    options(error = function() {
        traceback(2)
        quit(save="no", status=1)
    })
```

### Linuxbrew

Many will know [Homebrew](http://brew.sh/) for OS-X. In short, it is a package
manager that does not require admin right. There is also
[Linuxbrew](http://linuxbrew.sh), that uses the same platform to install
software in a Linux environment.

If you need something that is not in the general software directory, using this
instead of installing by hand will save you a lot of trouble.
