#!/usr/bin/env sh

CI_CREDENTIAL_SENTINEL="${HOME}/.ci-creds-stamp"
SBT_CREDENTIAL_FILE=${HOME}/.credentials/sbt-credentials

# setup credentials and touch sentinel file
if [ ! -f "${CI_SETUP_SENTINEL}" ] ; then
    if [ -n "${ARTIFACTORY_USER}" -a -n "${ARTIFACTORY_PASSWORD}" -a -n "${ARTIFACTORY_HOST}" ] ; then
        echo -n "Creating Artifactory credentials... "
        mkdir -p $(dirname ${SBT_CREDENTIAL_FILE})

        cat > ${SBT_CREDENTIAL_FILE} << EOFEOFEOF
realm=Artifactory Realm
host=${ARTIFACTORY_HOST}
user=${ARTIFACTORY_USER}
password=${ARTIFACTORY_PASSWORD}
EOFEOFEOF
        echo "Done!"
    else
        echo "Skipping Artifactory credential creation. \$ARTIFACTORY_USER and \$ARTIFACTORY_PASSWORD are not set."
    fi

    touch ${CI_CREDENTIAL_SENTINEL}
fi

# sbt will read credentials from a file if the path is set in SBT_CREDENTIALS
# https://github.com/sbt/sbt/commit/96e5a7957c830430f85b6b89d7bbe07824ebfc4b
if [ -f "${SBT_CREDENTIAL_FILE}" ] ; then
    export SBT_CREDENTIALS=${SBT_CREDENTIAL_FILE}
fi
