#!/bin/bash -xe

options='false'

for dev in $options
do

  echo "Running with dev set to $dev"

  if [[ $dev == true ]]; then
    FLAGS="--destination-label=dev";
  else
    FLAGS=""
  fi

  # We now build the following ourselves, so don't need to copy them over
  # python sync.py --package glue-core --source conda-forge --destination glueviz
  # python sync.py --package glue-vispy-viewers --source conda-forge --destination glueviz
  # python sync.py --package glueviz --source conda-forge --destination glueviz

  python sync.py --package echo --source conda-forge --destination glueviz $FLAGS
  python sync.py --package fast-histogram --source conda-forge --destination glueviz $FLAGS
  python sync.py --package mpl-scatter-density --source conda-forge --destination glueviz $FLAGS

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

  # glue-wwt
  python sync.py --package ipyevents --source conda-forge --destination glueviz $FLAGS
  python sync.py --package pywwt --source conda-forge --destination glueviz $FLAGS
  python sync.py --package reproject --source conda-forge --destination glueviz $FLAGS
  python sync.py --package astropy-healpix --source conda-forge --destination glueviz $FLAGS
  python sync.py --package python_abi --source conda-forge --destination glueviz $FLAGS
  python sync.py --package readline --source conda-forge --destination glueviz $FLAGS

  # glue-medical
  python sync.py --package gdcm --source conda-forge --destination glueviz --version 2.8.4 $FLAGS
  python sync.py --package pydicom --source conda-forge --destination glueviz --version 1.0.2 $FLAGS

  # specviz + cubeviz + mosviz
  python sync.py --package specutils --source conda-forge --destination glueviz $FLAGS
  python sync.py --package spectral-cube --source conda-forge --destination glueviz $FLAGS
  python sync.py --package asteval --source conda-forge --destination glueviz $FLAGS
  python sync.py --package asdf --source conda-forge --destination glueviz $FLAGS
  python sync.py --package semantic_version --source conda-forge --destination glueviz $FLAGS
  python sync.py --package radio-beam --source conda-forge --destination glueviz $FLAGS
  python sync.py --package regions --source conda-forge --destination glueviz $FLAGS
  python sync.py --package astropy-healpix --source conda-forge --destination glueviz $FLAGS
  python sync.py --package gwcs --source conda-forge --destination glueviz $FLAGS

  # glue-jupyter
  python sync.py --package traittypes --source conda-forge --destination glueviz $FLAGS
  python sync.py --package ipywebrtc --source conda-forge --destination glueviz $FLAGS
  python sync.py --package ipyvolume --source conda-forge --destination glueviz $FLAGS
  python sync.py --package bqplot --source conda-forge --destination glueviz $FLAGS
  python sync.py --package bqplot-image-gl --source conda-forge --destination glueviz $FLAGS
  python sync.py --package ipympl --source conda-forge --destination glueviz $FLAGS
  python sync.py --package ipyvue --source conda-forge --destination glueviz $FLAGS
  python sync.py --package ipyvuetify --source conda-forge --destination glueviz $FLAGS
  python sync.py --package ipymaterialui --source conda-forge --destination glueviz $FLAGS
  python sync.py --package pythreejs --source conda-forge --destination glueviz $FLAGS
  python sync.py --package ipydatawidgets --source conda-forge --destination glueviz $FLAGS
  python sync.py --package ipyscales --source conda-forge --destination glueviz $FLAGS

  # glue-regions
  python sync.py --package regions --source conda-forge --destination glueviz $FLAGS

  # glue-vispy-viewers
  python sync.py --package vispy --source conda-forge --destination glueviz $FLAGS
  python sync.py --package freetype-py --source conda-forge --destination glueviz $FLAGS
  python sync.py --package fontconfig --source conda-forge --destination glueviz $FLAGS
  python sync.py --package libuuid --source conda-forge --destination glueviz $FLAGS

done
