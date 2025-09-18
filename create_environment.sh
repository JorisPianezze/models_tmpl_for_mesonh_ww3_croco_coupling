#!/bin/bash

# ---------------------------------------
#   Detect machine automaticaly
# ---------------------------------------

if [[ ${HOSTNAME} = 'belenos'* ]]; then

  export machine='belenos'

elif [[ ${HOSTNAME} = 'olympe'* ]]; then

  export machine='olympe'

elif [[ ${HOSTNAME} = 'nuwa' ]]; then

  export machine='nuwa'

elif [[ ${HOSTNAME} = 'LALL224858' ]]; then
 
  export machine='laptop_joris'

else

  export machine='unknown'

fi

# ---------------------------------------
#   Link environment file
# ---------------------------------------

echo ' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ '
if [ -e environment/${machine}/environment.sh ]; then
  echo '  You are running on '${machine}' with '
  echo '      following environment :          '
  echo '                                       '
  ln -sf environment/${machine}/environment.sh .
  cat environment.sh
else
  echo '  You are running on '${machine}' and'
  echo '    this machine is not tested yet   '
fi
echo ' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ '
