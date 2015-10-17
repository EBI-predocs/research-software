User guide
==========

To use the software in this repository, change your shell to `/nfs/research2/software/prefix/bash` or add `/nfs/research2/software/prefix/usr/bin` to your `$PATH`. Detailed setup instructions are available in the [config repository](https://github.com/EBI-predocs/config#setting-up-your-environment). In general, software should work out of the box.

For a list of what is installed see the [world file](var/lib/portage/world).

If you have problems (or you would like something installed) open it as an issue and we'll
see what we can do.

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
