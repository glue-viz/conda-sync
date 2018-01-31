#!/bin/bash -xe

# We now build the following ourselves, so don't need to copy them over
# python sync.py --package glue-core --source conda-forge --destination glueviz
# python sync.py --package glue-vispy-viewers --source conda-forge --destination glueviz
# python sync.py --package glueviz --source conda-forge --destination glueviz

python sync.py --package fast-histogram --source conda-forge --destination glueviz
python sync.py --package mpl-scatter-density --source conda-forge --destination glueviz

python sync.py --package fast-histogram --source conda-forge --destination glueviz/label/dev
python sync.py --package mpl-scatter-density --source conda-forge --destination glueviz/label/dev

# The following packages are needed by glue-geospatial and are out of date in defaults
# python sync.py --package rasterio --source conda-forge --destination glueviz --version 0.36.0
# python sync.py --package snuggs --source conda-forge --destination glueviz
# python sync.py --package libgdal --source conda-forge --destination glueviz --version 2.1.4
# python sync.py --package gdal --source conda-forge --destination glueviz --version 2.1.4
# python sync.py --package libnetcdf --source conda-forge --destination glueviz
# python sync.py --package proj4 --source conda-forge --destination glueviz --version 4.9.3
# python sync.py --package freexl --source conda-forge --destination glueviz --version 1.0.2
# python sync.py --package geos --source conda-forge --destination glueviz --version 3.5.1
# python sync.py --package giflib --source conda-forge --destination glueviz --version 5.1.4
# python sync.py --package json-c --source conda-forge --destination glueviz --version 0.12.1
# python sync.py --package kealib --source conda-forge --destination glueviz --version 1.4.7
# python sync.py --package libdap4 --source conda-forge --destination glueviz --version 3.18.3
# python sync.py --package libkml --source conda-forge --destination glueviz --version 1.3.0
# python sync.py --package libspatialite --source conda-forge --destination glueviz --version 4.3.0a
# python sync.py --package boost --source conda-forge --destination glueviz --version 1.64.0
# python sync.py --package boost-cpp --source conda-forge --destination glueviz --version 1.64.0
# python sync.py --package poppler --source conda-forge --destination glueviz --version 0.52.0

# glue-medical
python sync.py --package gdcm --source conda-forge --destination glueviz --version 2.6.6
python sync.py --package pydicom --source conda-forge --destination glueviz --version 0.9.9 
python sync.py --package gdcm --source conda-forge --destination glueviz/label/dev --version 2.6.6
python sync.py --package pydicom --source conda-forge --destination glueviz/label/dev --version 0.9.9 


