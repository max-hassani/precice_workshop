#!/bin/bash

# ngl view for jupyter
jupyter nbextension install nglview --py --sys-prefix
jupyter nbextension enable nglview --py --sys-prefix

# ngl view for jupyter lab
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build
jupyter labextension install nglview-js-widgets --minimize=False
