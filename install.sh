#!/usr/bin/env bash
set -e

# bashrc
path=`ls -1 $(pwd)/bashrc`
pushd ..
ln -s ${path}
popd
