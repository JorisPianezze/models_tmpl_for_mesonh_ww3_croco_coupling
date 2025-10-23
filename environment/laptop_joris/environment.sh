#!/bin/bash

export machine='laptop_joris'

export version_libaec='1.1.3'
export version_hdf5='1.14.6'
export version_netcdf_c='4.9.3'
export version_netcdf_fortran='4.6.1'
export version_oasis='5.2'
export version_mesonh='5-7-2'
export version_croco='2.1.0'
export version_ww3='7.14'
export version_xios='3.0-trunk'

export CC=mpicc
export FC=mpif90

export NETCDF_CONFIG=/home/piaj/03_workdir/2B_devel_MNH_CROCO_XIOS/models_TUTORIAL/libraries/build_netcdf-${version_netcdf_fortran}/bin/nf-config
export OASISDIR=/home/piaj/03_workdir/2B_devel_MNH_CROCO_XIOS/models_TUTORIAL/oasis3-mct_5.2/build_oa3-mct
export XIOS_DIR=/home/piaj/03_workdir/2B_devel_MNH_CROCO_XIOS/models_TUTORIAL/xios-3.0-trunk
export XIOS_DIR_OASIS=/home/piaj/03_workdir/2B_devel_MNH_CROCO_XIOS/models_TUTORIAL/xios-3.0-trunk_oasis3-mct_5.2
