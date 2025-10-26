#!/bin/bash

# ###################################
#          J. Pianezze
#          (08.07.2025)
#         ~~~~~~~~~~~~~~
#   Download OASIS, Meso-NH, WW3,
#          CROCO models
#         ~~~~~~~~~~~~~~
# ###################################

source environment.sh

export download_oasis=true
export download_mesonh=true
export download_croco=true
export download_ww3=true
export download_xios=true

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Download oasis3-mct_${version_oasis}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [ ${download_oasis} = true ]; then

  if [[ ! -d oasis3-mct_${version_oasis} ]]
  then
    git clone https://gitlab.com/cerfacs/oasis3-mct.git
    cd oasis3-mct
    git checkout OASIS3-MCT_${version_oasis}
    cd ..
    mv oasis3-mct oasis3-mct_${version_oasis}
    cp environment/${machine}/compilation_oasis/make.inc oasis3-mct_${version_oasis}/util/make_dir/
    cp environment/${machine}/compilation_oasis/make.${machine} oasis3-mct_${version_oasis}/util/make_dir/
    sed -i "s|path_to_models_directory|${PWD}|g" oasis3-mct_${version_oasis}/util/make_dir/make.inc
    sed -i "s|path_to_models_directory|${PWD}|g" oasis3-mct_${version_oasis}/util/make_dir/make.${machine}
  else
    echo '  oasis3-mtc_'${version_oasis}' directory already exists -> nothing has been done.'
  fi

fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Download MNH_V${version_mesonh}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [ ${download_mesonh} = true ]; then

  if [[ ! -d MNH-V${version_mesonh} ]]
  then
    git clone https://src.koda.cnrs.fr/mesonh/mesonh-code.git
    #cd mesonh-code
    #git checkout PACK-MNH-V${version_mesonh}
    #cp ../environment/${machine}/compilation_mesonh/Makefile.MESONH.mk src/
    #cd ..
    mv mesonh-code MNH-V${version_mesonh}
  else
    echo '  MNH-V'${version_mesonh}' directory already exists -> nothing has been done.'
  fi

fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Download croco-v${version_croco}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [ ${download_croco} = true ]; then

  if [[ ! -d croco-v${version_croco} ]]
  then
    git clone https://gitlab.inria.fr/croco-ocean/croco.git
    cd croco
    git checkout v${version_croco}
    mkdir exe_CPLOA_${machine} ; cd exe_CPLOA_${machine}
    cp ../../environment/${machine}/compilation_croco/jobcomp .
    cp ../../environment/${machine}/compilation_croco/clean.sh .
    mkdir MY_SRC ; cd MY_SRC
    cp ../../../environment/${machine}/compilation_croco/MY_SRC_CPLOA/param.h .
    cp ../../../environment/${machine}/compilation_croco/MY_SRC_CPLOA/cppdefs.h .
    cd ../../../
    mv croco croco-v${version_croco}
    sed -i "s|path_to_models_directory|${PWD}|g" croco-v${version_croco}/exe_CPLOA_${machine}/jobcomp
  else
    echo '  croco-v'${version_croco}' directory already exists -> nothing has been done.'
  fi

fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Download ww3-v${version_ww3}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [ ${download_ww3} = true ]; then

  if [[ ! -d WW3-v${version_ww3} ]]
  then
    git clone https://github.com/NOAA-EMC/WW3
    cp environment/${machine}/compilation_ww3/cmplr.env WW3/model/bin/
    cp environment/${machine}/compilation_ww3/link.tmpl WW3/model/bin/
    cp environment/${machine}/compilation_ww3/w3_setup WW3/model/bin/
    cp environment/${machine}/compilation_ww3/w3_make WW3/model/bin/
    cp environment/${machine}/compilation_ww3/switch_NOOASIS WW3/model/bin/
    cp environment/${machine}/compilation_ww3/switch_OASACM_OASOCM WW3/model/bin/
    mv WW3 WW3-v${version_ww3}
  else
    echo '  WW3-v'${version_ww3}' directory already exists -> nothing has been done.'
  fi

fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Download xios-${version_xios}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [ ${download_xios} = true ]; then

  if [[ ! -d xios-${version_xios} ]]
  then
    svn co http://forge.ipsl.jussieu.fr/ioserver/svn/XIOS3/trunk xios-3.0-trunk
    cp environment/${machine}/compilation_xios/arch-${machine}.env xios-3.0-trunk/arch/
    cp environment/${machine}/compilation_xios/arch-${machine}.fcm xios-3.0-trunk/arch/
    cp environment/${machine}/compilation_xios/arch-${machine}.path xios-3.0-trunk/arch/
  else
    echo '  xios-'${version_xios}' directory already exists -> nothing has been done.'
  fi

fi
