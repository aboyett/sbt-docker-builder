#!/usr/bin/env sh

CREDENTIAL_FILE=${HOME}/.ivy2/.credentials

if [ -n "${ARTIFACTORY_USER}" -a -n "${ARTIFACTORY_PASSWORD}" -a -n "${ARTIFACTORY_HOST}" ] ; then
    echo -n "Creating Artifactory credentials... "
    mkdir -p ${HOME}/.ivy2
    cat > $CREDENTIAL_FILE << EOFEOFEOF
realm=Artifactory Realm
host=${ARTIFACTORY_HOST}
user=${ARTIFACTORY_USER}
password=${ARTIFACTORY_PASSWORD}
EOFEOFEOF
    echo "Done!"
else
    echo "Skipping Artifactory credential creation. \$ARTIFACTORY_USER and \$ARTIFACTORY_PASSWORD are not set."
fi
