#!/bin/bash

# set -x
path=$(dirname $0)
cd $path
DEFAULT_GIT_PATH=$(git remote -v | grep origin | awk '{print $2}' | head -1)
DEFAULT_GIT_PREFIX=$(echo $DEFAULT_GIT_PATH | awk -F /dashboard.git '{print $1}')
cd -

echo 'git remote origin:' $DEFAULT_GIT_PREFIX

if [ ! -d "./src" ]; then
  git clone $DEFAULT_GIT_PREFIX/dashboard-common.git src
fi

if [ ! -d "./containers/Cloudenv" ]; then
  git clone $DEFAULT_GIT_PREFIX/dashboard-module-cloudenv.git containers/Cloudenv
fi

if [ ! -d "./containers/Compute" ]; then
  git clone $DEFAULT_GIT_PREFIX/dashboard-module-compute.git containers/Compute
fi

if [ ! -d "./containers/Network" ]; then
  git clone $DEFAULT_GIT_PREFIX/dashboard-module-network.git containers/Network
fi

if [ ! -d "./containers/Dashboard" ]; then
  git clone $DEFAULT_GIT_PREFIX/dashboard-module-dashboard.git containers/Dashboard
fi

if [ ! -d "./containers/Storage" ]; then
  git clone $DEFAULT_GIT_PREFIX/dashboard-module-storage.git containers/Storage
fi

echo "🗃 Done"
