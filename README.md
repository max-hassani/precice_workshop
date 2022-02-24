[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/muh-hassani/precice_workshop/master?labpath=fenics_precice_heat_conduction.ipynb)

# An interface to preCICE in pyiron workflows
[Pyiron](https://pyiron.org) is an user-friendly integrated development environment for materials science, in which all necessary steps to develop and run complex simulation workflows can be performed and combined. This includes the initial setup, the remote/interactive submission on high-performance compute clusters (HPC), the post-processing, as well as the management, mining, and visualization of the produced data. Besides the core components for the workflow management, pyiron provides a high-level unified language for multiple simulation tools. Examples are density functional theory calculations on the electronic scale with [Sphinx](http://sxrepo.mpie.de/), molecular dynamics simulations on the atomic scale with [LAMMPS](http://www.lammps.org/) or simulations of the elastoplastic response of materials on the continuum scale with [DAMASK](https://damask.mpie.de/).  

Using a Jupyter environment, pyiron worklows are easily accessible, can be shared alongside their publications, are reproducible and reusable, benefitting in particular from the interoperability between various simulation tools.  

Here, we present our recently developed pyiron job class to couple continuum scale tools using the [preCICE](https://precice.org) python API. An example of two FEniCS simulations, coupled to solve heat transfer equations, is chosen as a demonstrator to highlight the ease and flexibility of using pyiron.

## The workflow
The workflow here uses `pyiron_continuum` to create two fenics jobs, which each solves heat conduction equations. Additionally, the job have a adapter_conf object, which defines the coupling between defined jobs using `fenics-precice` adapter. 
The configuration accepts the required json file, but additionally it can prescribe the coupling expression or coupling_data based on the type of boundary condition at the coupling boundary.   

After declaring the fenics jobs, a precice job is defined. Then the two fenics jobs are added to the newly created job. By running the precice job, the two child jobs run in parallel.

## Binder Link
To try the notebook, click [here](https://mybinder.org/v2/gh/muh-hassani/precice_workshop/master?labpath=fenics_precice_heat_conduction.ipynb)

## License
pyiron and this workflow are both licensed under the BSD-3-Clause license which is included in the `LICENSE` file. In addition an `CODE_OF_CONDUCT.md` file is included to foster an open and welcoming environment.
