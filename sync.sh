#!/bin/bash -xe

# We now build the following ourselves, so don't need to copy them over
# python sync.py --package glue-core --source conda-forge --destination glueviz
# python sync.py --package glue-vispy-viewers --source conda-forge --destination glueviz
# python sync.py --package glueviz --source conda-forge --destination glueviz

# The following packages are needed by glue-geospatial and are out of date in defaults
python sync.py --package rasterio --source conda-forge --destination glueviz
python sync.py --package snuggs --source conda-forge --destination glueviz
