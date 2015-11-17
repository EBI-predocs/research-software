User guide
==========

Setting up your environment
---------------------------

### Using a pre-configured environment (preferred)

To just use the environment as it is set up, [change your shell](https://www.ebi.ac.uk/systems-srv/public-wiki/index.php/How_do_I_change_my_shell%3F) to

```bash
/nfs/research2/software/prefix/bin/bash
```

You can now use all the software listed in the [*world* file](var/lib/portage/world).

### Setting up paths in the bashrc (alternative)

Alternatively, you can add the path to your cluster `~/.bashrc`. **Do not** set your `LD_LIBRARY_PATH` there.

```bash
export PATH=/nfs/research2/software/prefix/usr/bin:$PATH
```

### Requesting software

If you have problems (or you would like something installed) [open it as an issue](issues/new) and we'll
see what we can do.

For software to be installed in the general directory it should be useful to more than one person.

Managing your own software
--------------------------

Install your own software in `/nfs/research2/<your_group>/<your_user>/`, not in your `$HOME` directory.
The reason for that is that your home space is limited to 10 Gb and `research2` is generally faster.

### Python packages

There are two version of python installed: 2.7 and the latest in the 3.x series. The default executable is 2.7, and you can access 3.x using `python-3.x` in your `$PATH`.

There is a fair amount of packages included in the general installation (including the scientific stack `numpy`, `scipy`, `matplotlib`, `pandas`; the scikits; `ipython` incl. notebooks, etc.)

Non-standard packages should be installed per user, which can be easily done using `pip` (for python 2.7) or `pip3` (for python 3.x).

### R packages

R packages often change their API, break from time to time, and are generally not that stable. This is why there is no central installation of CRAN and BioConductor, but euch user should maintain their own installation. This is not a problem because R comes with its own package manager.

Below is an example *~/.Rprofile* that sets up the user environment:

```r
# all your packages will be installed in this directory
.libPaths("~/R")

options(
# you will always want this
stringsAsFactors = FALSE,

# if you want to have a full traceback or post-mortem inspections of errors
#error = function() traceback(2),
#error = function() recover(),

# don't wait for X11 but display text menus; also use the EBI CRAN mirror by default
menu.graphics = FALSE,
repos = structure(c(CRAN="http://mirrors.ebi.ac.uk/CRAN/"))
)
```

### Linuxbrew

Many will know [Homebrew](http://brew.sh/) for OS-X. In short, it is a package manager
that does not require admin right. There is also [Linuxbrew](http://brew.sh/linuxbrew/),
that uses the same platform to install software in a Linux environment.

If you need something that is not in the general software directory, using this instead
of installing by hand will save you a lot of trouble.
