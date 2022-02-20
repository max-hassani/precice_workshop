#!/bin/bash
# pyiron config 
git clone https://github.com/pyiron/pyiron_continuum pyiron_repo
cd pyiron_repo
git checkout precice_fenics_interface
cp -r pyiron_continuum ../
cd ../
rm -r pyiron_repo

# conda install papermill
conda install -c conda-forge papermill jupyter

# execute notebooks
current_dir=$(pwd)
i=0;
for f in $(find . -name "*.ipynb" | sort -n); do
    cd $(dirname $f);
    notebook=$(basename $f);
    papermill ${notebook} ${notebook%.*}-out.${notebook##*.} -k "python3" || i=$((i+1));
    cd $current_dir;
done;

# push error to next level
if [ $i -gt 0 ]; then
    exit 1;
fi;
