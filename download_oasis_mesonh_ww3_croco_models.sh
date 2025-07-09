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
    cp environment/${machine}/make.${machine} oasis3-mct_${version_oasis}/util/make_dir/
  else
    echo '  oasis3-mtc_'${version_oasis}' directory already exists.'
  fi

fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Download MNH_V${version_mesonh}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [ ${download_mesonh} = true ]; then

  if [[ ! -d MNH-V${version_mesonh} ]]
  then
    git clone https://src.koda.cnrs.fr/mesonh/mesonh-code.git
    cd mesonh-code
    git checkout PACK-MNH-V${version_mesonh}
    cd ..
    mv mesonh-code MNH-V${version_mesonh}
  else
    echo '  MNH-V'${version_mesonh}' directory already exists.'
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
    mkdir exe_${machine} ; cd exe_${machine}
    cp ../../environment/${machine}/jobcomp .
    cp ../../environment/${machine}/clean_compilation_croco.sh .
    mkdir MY_SRC ; cd MY_SRC
    cp ../../OCEAN/param.h .
    cp ../../OCEAN/cppdefs.h .
    cd ../../../
    mv croco croco-v${version_croco}
  else
    echo '  croco-v'${version_croco}' directory already exists.'
  fi

fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   Download ww3-v${version_ww3}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if [ ${download_ww3} = true ]; then

  if [[ ! -d WW3-v${version_ww3} ]]
  then
    git clone https://github.com/NOAA-EMC/WW3
    cp environment/${machine}/cmplr.env WW3/model/bin/
    cp environment/${machine}/link.tmpl WW3/model/bin/
    cp environment/${machine}/w3_setup WW3/model/bin/
    mv WW3 WW3-v${version_ww3}
  else
    echo '  WW3-v'${version_ww3}' directory already exists.'
  fi

fi
