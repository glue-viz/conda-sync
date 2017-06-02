# Keeping the conda-forge and glueviz channels in sync

[![Build Status](https://travis-ci.org/glue-viz/conda-sync.svg?branch=master)](https://travis-ci.org/glue-viz/conda-sync)

The main glue conda packages are built on conda-forge:

* https://github.com/conda-forge/glue-core-feedstock
* https://github.com/conda-forge/glue-vispy-viewers-feedstock
* https://github.com/conda-forge/glueviz-feedstock

However, we don't want users to necessarily have to add conda-forge as a channel since there are a lot of channels there, and some could cause incompatibilities with the defaults channel. Since the glue packages are pure-Python, we can easily just copy the builds from conda-forge to the glueviz channel and tell users to use the glueviz channel instead.

This repository includes a ``sync.py`` script that uses the anaconda.org API to make sure that all glue packages in [conda-forge](https://anaconda.org/conda-forge) are present in the [glueviz](https://anaconda.org/glueviz) conda channel. Users can then install glue with::

    conda install -c glueviz glueviz
