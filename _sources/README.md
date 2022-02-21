[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/muh-hassani/precice_workshop/master?labpath=fenics_precice_heat_conduction.ipynb)

# An interface to preCICE in pyiron workflows
The workflow here uses `pyiron_continuum` to create two fenics jobs, which each solves heat conduction equations. Additionally, the job have a adapter_conf object, which defines the coupling between defined jobs using `fenics-precice` adapter. 
The configuration accepts the required json file, but additionally it can prescribe the coupling expression or coupling_data based on the type of boundary condition at the coupling boundary.   

After declaring the fenics jobs, a precice job is defined. Then the two fenics jobs are added to the newly created job. By running the precice job, the two child jobs run in parallel.

# Binder Link
To try the notebook by clicking [here](https://mybinder.org/v2/gh/muh-hassani/precice_workshop/master?labpath=fenics_precice_heat_conduction.ipynb)

### License
pyiron and this workflow are both licensed under the BSD-3-Clause license which is included in the `LICENSE` file. In addition an `CODE_OF_CONDUCT.md` file is included to foster an open and welcoming environment.
