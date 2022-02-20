# pyiron workflow template
This is a template repository how you can publish your calculation with pyiron. It consists of the repository [itself](https://github.com/materialdigital/pyiron-workflow-template), a small [website](http://materialdigital.github.io/pyiron-workflow-template/) created with Jupyterbook and a [mybinder environment](https://mybinder.org/v2/gh/materialdigital/pyiron-workflow-template/HEAD?filepath=notebooks%2Fexample.ipynb) for testing the calculation. 

You can fork this repository and populate it with your own data.

## Step by step
* Move your notebooks to the repository folder and remove the example notebook `example.ipynb`.
* Update the conda `environment.yml` file with the conda dependencies required for your notebook. 
* Include the export of your pyiron database in the `pyiron/calculation` folder or in case no calculation are required you can remove the `pyiron/calculation/save.tar.gz` archive and the `pyiron/calculation/export.csv` database backup file. 
* Include additional pyiron resources in the `pyiron/resources` folder if required, otherwise the `pyiron/resources` folder can be deleted.

## Repository structure
In the following the repsoitory structure is explained in more detail: 

### notebooks 
The repository folder contains one or more jupyter notebooks. These notebooks are executed during the unit tests and included in the website for easy readablity. The example notebook `example.ipynb` should be removed before publication. 

### conda environment
The repository folder also includes the conda `environment.yml` file which defines the conda environment required to execute the notebooks in the repository folder. An existing environment can be exported using `conda env export > environment.yml` but it is recommended to reduce the environment to the minimal requirements as a large environment is less performant. Example conda `environment.yml` file: 

```
channels:
- conda-forge
dependencies:
- python
- pyiron_atomistics =0.2.8
- lammps =2021.02.10=*openmpi*_4
- nglview =2.7.7
```

### Existing calculation
The `pyiron/calculation` folder includes previous calculation results which are published with this repository. In this example the calculation were calculated and exported using:

```
from pyiron_atomistics import Project
pr = Project("old_calculation")
job = pr.create.job.Lammps(job_name="lmp_si")
job.structure = pr.create.structure.ase.bulk("Si")
job.run()
pr.pack(destination_path="save")
```

The resulting files `export.csv` and `save.tar.gz` have been copied to the `pyiron/calculation` folder.

### Additional pyiron resources 
Just like the pyiron resources folder the `pyiron/resources` folder can include additional resources like links to special executables or parameter files. In this example the `pyiron/resources` folder contains a special LAMMPS potential named `Si-quip-xml` which is required for the example notebook `example.ipynb`. 

### Jupyterbook 
The jupyterbook is build using the github action `.github/workflows/book.yml` and it is deployed to github pages using `.github/workflows/deploy.yml`. Both github actions internally use the conda environment defined in `.github/ci_support/environment.yml`. But there should be no need to modify these files.

### mybinder
Besides the conda environment in `environment.yml` the `.binder/postBuild` script is used to import the calculations stored in `pyiron/calculation` and install `NGLview` for both jupyter notebooks and jupyter lab. Finally the pyiron environment on mybinder is configured using the `.binder/.pyiron` file in this repository. Only the conda environment file `environment.yml` has to be updated by the user.

### Continous integration 
The rest of the files in the repository are used to test the environment. For continous integration the github actions are defined in `.github/workflows/notebooks.yml`. Again the conda environment file `environment.yml` is used to install all the dependencies, afterwards pyiron is configured in the test environment using `.github/ci_support/pyironconfig.py` and finally the notebooks are executed using `.github/ci_support/build_notebooks.sh`. Usually there is no need for the user to adjust any of these files other than the conda environment `environment.yml` file.

### Metadata 
In order to register the workflow in the PMD workflow store, the file `meta.json` is required. The file includes the essential metadata. The keys and their possible values are listed in the following table:

| Key | Requirement | Description|
|-----|------------|------------|
| title | Mandatory | the Label of the workflow |
| workflow_environment | Mandatory | pyiron or SimStack |
| description | Mandatory | the description of the workflow |
| authors | Mandatory | a list of authors' names and optional their email addresses e.g. ["Author One <a1@example.de>", "Author Two <a2@example.de>"] |
| release | Mandatory | version information of the release | 
| keywords | Mandatory | a list of keywords for the workflow (From a list of available keywords, making it possible to be queried via Ontology) |
| categories | Optional | a list of categories, e.g., atomistics, continuum, experimental|
| steps/codes | Optional | a list of steps/codes, e.g., LAMMPS, DAMASK, calculation of elastic modulus|
| licenses | Optional | a dictionary where the keys are the packages used in the workflow and the values are the corresponding license type. <br> e.g. 'pyiron':'BSD-3' |
| publications | Optional | a list of publications |  
| logo | Optional | path to the logo of the workflow within the repository|  

### License
pyiron and also the pyiron publication template are licensed under the BSD-3-Clause license which is included in the `LICENSE` file. In addition an `CODE_OF_CONDUCT.md` file is included to foster an open and welcoming environment.
