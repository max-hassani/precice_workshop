#!/bin/bash
cd pyiron
for ds in $(ls calculation/*.tar.gz); do 
    cp ${ds} .
    cp calculation/export.csv .
    file=$(basename ${ds} .tar.gz)
    python << EOF
from pyiron_base import Project
Project("calculation").unpack("${file}")
EOF
    rm $(basename ${ds})
    rm export.csv
done
