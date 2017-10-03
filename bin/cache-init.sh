#!/usr/bin/env sh

PKG_CACHE_DIRS=".ivy2 .sbt"

for dir in ${PKG_CACHE_DIRS} ; do
    # create cache dirs
    mkdir -p ${CACHE_DIR}/${dir}
    # setup symlinks from /drone/ to home dir for paulp wrapper
    ln -sf ${CACHE_DIR}/${dir} ${HOME}/${dir}
done
