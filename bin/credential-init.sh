#!/usr/bin/env sh

# many internal projects use ~/.ivy/.credentials to store artifact repo creds
# this hackery pulls the credentials from the CI environement but ensures they
# aren't cached along with the ivy cache

SBT_CREDENTIAL_FILE=${HOME}/.ivy2/.credentials
REAL_CREDENTIAL_FILE=${REAL_HOME}/.credentials/sbt-credentials

if [ -n "${ARTIFACTORY_USER}" -a -n "${ARTIFACTORY_PASSWORD}" -a -n "${ARTIFACTORY_HOST}" ] ; then
    echo -n "Creating Artifactory credentials... "
    mkdir -p ${HOME}/.ivy2 $(dirname ${REAL_CREDENTIAL_FILE})

    ln -sf "${REAL_CREDENTIAL_FILE}" "${SBT_CREDENTIAL_FILE}"

    cat > ${REAL_CREDENTIAL_FILE} << EOFEOFEOF
realm=Artifactory Realm
host=${ARTIFACTORY_HOST}
user=${ARTIFACTORY_USER}
password=${ARTIFACTORY_PASSWORD}
EOFEOFEOF
    echo "Done!"
else
    echo "Skipping Artifactory credential creation. \$ARTIFACTORY_USER and \$ARTIFACTORY_PASSWORD are not set."
fi
