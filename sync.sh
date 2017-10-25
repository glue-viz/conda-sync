#!/bin/bash -xe

# We now build the following ourselves, so don't need to copy them over
# python sync.py --package glue-core --source conda-forge --destination glueviz
# python sync.py --package glue-vispy-viewers --source conda-forge --destination glueviz
# python sync.py --package glueviz --source conda-forge --destination glueviz

python sync.py --package fast-histogram --source conda-forge --destination glueviz
python sync.py --package mpl-scatter-density --source conda-forge --destination glueviz

# The following packages are needed by glue-geospatial and are out of date in defaults
python sync.py --package rasterio --source conda-forge --destination glueviz
python sync.py --package snuggs --source conda-forge --destination glueviz
python sync.py --package libgdal --source conda-forge --destination glueviz
python sync.py --package gdal --source conda-forge --destination glueviz
python sync.py --package libnetcdf --source conda-forge --destination glueviz
python sync.py --package proj4 --source conda-forge --destination glueviz
python sync.py --package freexl --source conda-forge --destination glueviz
python sync.py --package geos --source conda-forge --destination glueviz
python sync.py --package giflib --source conda-forge --destination glueviz
python sync.py --package json-c --source conda-forge --destination glueviz
python sync.py --package kealib --source conda-forge --destination glueviz
python sync.py --package libdap4 --source conda-forge --destination glueviz
python sync.py --package libkml --source conda-forge --destination glueviz
python sync.py --package libspatialite --source conda-forge --destination glueviz


