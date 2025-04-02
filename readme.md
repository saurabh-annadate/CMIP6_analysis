### Installing miniconda
```shell
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
# Enter | scroll down | yes | Enter | yes

conda config --set auto_activate_base false
conda list # Check if everything's working
```
### Configuring miniconda

```shell
mkdir -p ${HOME}/miniconda3/envs ${HOME}/miniconda3/pkgs
conda config --append envs_dirs ${HOME}/miniconda3/envs
conda config --append pkgs_dirs ${HOME}/miniconda3/pkgs
```


### create new env
```shell
conda create --name CMIP --file env.txt --channel conda-forge --override-channels --solver classic
conda activate CMIP
```

```shell
# to install new packages, add them to the env.txt file and run:
conda install --file env.txt --channel conda-forge --override-channels --solver classic
```

### Install Xming server

Use the Xming setup file provided with the repo and install it. It is used to visualise the netCDF files using NCVIEW.