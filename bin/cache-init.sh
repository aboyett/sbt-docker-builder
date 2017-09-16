#!/usr/bin/env sh

# setting $HOME to "/drone" allows all .sbt and .ivy2 dependencies to be cached
# paulp sbt wrapper *always* downloads the sbt launcher to ~/.sbt/...
# otherwise we could do nicer overrides of just the ivy and sbt dirs.
REAL_HOME="${HOME}"
HOME="${DRONE_DIR}"

CACHE_DIRS=".ivy2 .sbt"

for dir in ${CACHE_DIRS} ; do
    # create cache dirs
    mkdir -p ${HOME}/${dir}
    # setup symlinks from /drone/ to real home dir for paulp wrapper
    ln -sf ${HOME}/${dir} ${REAL_HOME}/${dir}
done
