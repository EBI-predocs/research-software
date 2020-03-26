EBI Research Software
==========

#### What's in this repository?

This repository contains a collection of instructions, configuration files and tips to manage software installations on the [EBI computing clusters](https://sysinf.ebi.ac.uk). 
It also serves as an issue tracker to get help from fellow EBI students and researchers - if you have any problems or would like a specific tool installed, [report it here](https://github.com/EBI-predocs/research-software/issues/new).
This repository is public for easier issue tracking within EBI and to make custom build scripts available to anyone who would like to use them, as agreed with [Nick Goldman](http://www.ebi.ac.uk/about/people/nick-goldman) in July 2016.

#### What about the Prefix software?

Previously, we used to maintain a shared software
installation based on [Gentoo Prefix](https://wiki.gentoo.org/wiki/Project:Prefix).
Due to various reasons, including the difficulty to maintain it and the emergence of better and simpler alternatives, this software installation has not been updated since early 2018.
The software is however still available on the EBI cluster and can be set up following the instructions at the end of this document, but beware that some packages will be outdated or not work at all.
Therefore, it is recommended to install and manage your own software, for which we provide some advice and instruction in the first section below.


Managing your own software
--------------------------

Remember! Install your own software in your group's `NFS` folder (for example in `/nfs/research/<group>/<user>/software`) and not in
your `$HOME` directory. 
The reason for that is that your home space is limited to 10GB only and `NFS` storage is generally faster.

### Conda (recommended)

[Conda](https://docs.conda.io) is a popular open source package and environment management system that runs seamlessly across platforms (Windows, macOS and Linux) and does not require admin rights. 
It has grown a lot in the recent years, specially for bioinformatics software through the [Bioconda channel](https://bioconda.github.io/).

To install Conda download the installer script from [here](https://docs.conda.io/en/latest/miniconda.html) and follow the instructions [here](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html).
Miniconda is a reduced version, while Anaconda contains hundreds of packages. Choose the Python 3.7 version, as this is just the python version Conda is written in and has nothing to do with the version of python you can use, both allow simultaneous installations of python 2 and python 3:

New packages can be installed using:

```bash
conda install <package-name>
```

Or updated using:

```bash
conda update <package-name>
```

Nowadays, almost all popular software tools can be installed using Conda, just search for "conda install" and the name of the package on Google.
One important thing to know are *Conda channels*, which are sort of compiled lists of software packages, including different versions. The Conda channel for bioinformatics tools is called [Bioconda](https://bioconda.github.io/) and contains most tools you might need like `bwa` or `blast`, among many others.

Another very useful featue of Conda are environments. In short, Conda environments help you keep software dependencies required by different projects separate by creating isolated software installations. Read more about them [here](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html).


### Linuxbrew

Many will know [Homebrew](http://brew.sh/) for OS-X, a package manager that is host system idependent and does not require admin right.
There is also [Linuxbrew](http://linuxbrew.sh), now renamed *Homebrew for Linux*, that uses the same platform to install software in a Linux environment.

Follow the installation instructions [here](https://docs.brew.sh/Homebrew-on-Linux). 
Beware that the default installation location is `~/.linuxbrew`, so it might cause problems with storage in your home directory if you install too many packages.

New packages can be installed using:

```bash
brew install <package-name>
```

Or updated using:

```bash
brew upgrade <package-name>
```

Just like with Conda, almost all popular software tools can be installed using Homebrew, just search for "brew install" and the name of the package on Google.
You can have both Conda and Linuxbrew installed in your system, but make sure which version of the software you are using by checking which location is first in your `$PATH` or the location of the binary:

```bash
which python
```

### Other useful software tools

#### Workflow managers

Do you feel like you have scripts all over the place and you don't remember in what order you should run them? You probably are in need of a workflow manager. 

Workflow managers are software tools that allow you to create reproducible and scalable data analyses by specifying modular computing blocks of defined inputs, outputs and operations to perform.
This way, you can organize every step in a pipeline that can be scaled to as many computing nodes as you can, run as many times as you want and exported to other platforms (cool, right?).

There are many workflow managers available, two of the most popular for scientific computing are:

- [Snakemake](https://snakemake.readthedocs.io) (recommended): written in Python and nicely integrated in Conda.
- [Nextflow](https://www.nextflow.io): backend in Java but simple instructions and nicely integrated with Singularity containers. 

Brice Letcher and Paul Saary have run a Snakemake workshop at EMBL and EBI predoc courses. The course ran at the EBI is available [here](https://bricoletc.github.io/WMS_teaching/index.html).


#### Software Containers 

A container is a standard unit of software that packages up code and all its dependencies so the application runs in any computing environment.
The two most popular software container tools are [Docker](https://docs.docker.com/) and [Singularity](https://www.sylabs.io/docs/).

[Michael Hall](https://github.com/mbhall88) has provided a useful guide on [how to use biocontainers](docs/using_biocontainers.pdf) and co-ran the [Introduction to Singularity course](https://git.embl.de/grp-bio-it/singularity-training-2019) as part of the [BioIT project in Heidelberg](https://bio-it.embl.de), where you can find other courses and learning materials.


Setting up the Prefix environment
---------------------------

Some time ago EBI Predocs created a shared installation based on
[Gentoo Prefix](https://wiki.gentoo.org/wiki/Project:Prefix) to overcome outdated or missing software packages on the EBI computing cluster. 
The software has not been updated since early 2018 and is currently only available on the EBI cluster (not in Yoda).
Below are the instructions to setup the environment to be able to use the shared installed packages:

* [*Installed packages on ebi*](https://github.com/EBI-predocs/research-software/blob/ebi/var/lib/portage/world)
* [*Installed packages on yoda*](https://github.com/EBI-predocs/research-software/blob/yoda/var/lib/portage/world) (not currently working)

If you have problems (or you would like something installed) [open it as an
issue](https://github.com/EBI-predocs/research-software/issues/new).

#### Using a pre-configured environment (preferred)

To just use the environment as it is set up, [change your
login shell](https://www.ebi.ac.uk/systems-srv/mp/account/)
to the one below:

```bash
/nfs/software/software/prefix/bin/bash
```

Note that the change might take a while (in the order of minutes) to be applied.

#### Setting up paths in the bashrc (alternative)

Alternatively, you can add the path to your cluster `~/.bashrc`. Do not set
your `LD_LIBRARY_PATH` as we are resolving library locations using
[RPATH](https://en.wikipedia.org/wiki/Rpath).

```bash
export PATH=/nfs/software/software/prefix/usr/bin:$PATH
```

#### Using the software for one session only (alternative)

If you want to try out the prefix setup, use the script below to temporarily
add to your your `PATH`. This only affects your current session.

```bash
bash /nfs/software/software/prefix/startprefix
```

#### Python packages

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
[virtualenv](https://virtualenv.pypa.io/en/stable/) to control the packages and python version you are using.

#### R packages

R packages often change their API, break from time to time, and are generally not that stable. 
This is why there is no central installation of CRAN and BioConductor, but each user should maintain their own installation. 
This is not a problem because R comes with its own package manager.

Below is an example *~/.Rprofile* that sets up the user environment:

```r
# all your packages will be installed in this directory
.libPaths("~/R")

options(
# you will always want this
stringsAsFactors = FALSE,

# don't wait for X11 but display text menus
menu.graphics = FALSE
)

# print the traceback of errors on non-interactive scripts
if (!interactive())
    options(error = function() {
        traceback(2)
        quit(save="no", status=1)
    })
```
