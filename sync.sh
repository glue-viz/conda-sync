#!/bin/bash

python sync.py --package glue-core --source conda-forge --destination glueviz
python sync.py --package glue-vispy-viewers --source conda-forge --destination glueviz
python sync.py --package glueviz --source conda-forge --destination glueviz


