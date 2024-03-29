# Keeping the conda-forge and glueviz channels in sync

[![Sync conda channels](https://github.com/glue-viz/conda-sync/actions/workflows/sync.yml/badge.svg)](https://github.com/glue-viz/conda-sync/actions/workflows/sync.yml)

The main glue conda packages are built on conda-forge:

* https://github.com/conda-forge/glue-core-feedstock
* https://github.com/conda-forge/glue-vispy-viewers-feedstock
* https://github.com/conda-forge/glueviz-feedstock

However, we don't want users to necessarily have to add conda-forge as a channel since there are a lot of channels there, and some could cause incompatibilities with the defaults channel. Since the glue packages are pure-Python, we can easily just copy the builds from conda-forge to the glueviz channel and tell users to use the glueviz channel instead.

This repository includes a ``sync.py`` script that uses the anaconda.org API to make sure that all glue packages in [conda-forge](https://anaconda.org/conda-forge) are present in the [glueviz](https://anaconda.org/glueviz) conda channel. Users can then install glue with:

    conda install -c glueviz glueviz

Travis is set to run as a daily cron job (and the build only takes about a minute), and this required the ``BINSTAR_TOKEN`` environment variable to be set as a private token via the Travis settings page.

To run the sync manually, simply clone this repository and type:

    ./sync.sh
