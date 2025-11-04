# Models ...

Link to the full documentation [here](https://jorispianezze.github.io/documentations/documentation_mesonh_ww3_croco_coupling/index.html).

## Create environment

```bash
./create_environment.sh
```

## Compile NETCDF

```bash
source environment.sh
cd libraries
./download_aec_hdf_netcdf_libraries.sh
./install_aer_hdf_netcdf_libraries.sh
```

## Compile XIOS

```bash
source environment.sh
cd xios-3.0-trunk 
./make_xios --full --arch ${machine}
```


