#!/usr/bin/env bash

# Assumptions:
# 1. The user running this script has sudo privileges.
# 2. The host system uses apt-get to manage packages (e.g. Debian, Ubuntu)
# 3. sudo is installed in the host system.

# Get the absolute path to the directory containing this script. Source: https://stackoverflow.com/a/246128.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Include common functions and constants.
source "${SCRIPT_DIR}"/common.sh

# Hack to make the script ask for sudo password before printing any steps.
sudo printf ''

# Cache Git credentials for convenience.
git config --global credential.helper "cache --timeout=86400"

print_green 'Provisioning the environment...'

print_green 'Update the apt package index'
sudo apt-get --assume-yes update
exit_if_failed 'Updating the apt package index failed.'

print_green 'Install curl'
sudo apt-get --assume-yes install curl
exit_if_failed 'Installing curl failed.'

print_green 'Install software-properties-common'
sudo apt-get --assume-yes install software-properties-common
exit_if_failed 'Installing software-properties-common failed.'

# Installation of RVM through their Ubuntu Doc: https://github.com/rvm/ubuntu_rvm
print_green 'Install RVM'
sudo apt-add-repository -y ppa:rael-gc/rvm
exit_if_failed 'Adding apt repository for rvm failed.'
sudo apt-get --assume-yes update
exit_if_failed 'Updating the apt package index failed.'
sudo apt-get --assume-yes install rvm
exit_if_failed 'Installing rvm failed.'
source /etc/profile.d/rvm.sh
exit_if_failed 'Sourcing rvm.sh failed.'
sudo usermod -aG rvm $(whoami)
exit_if_failed 'Adding user to rvm group failed.'

print_green 'Install Ruby 2.5.8'
rvm install ruby-2.5.8
exit_if_failed 'Installing Ruby 2.5.8 failed.'

cd ~/.travis/travis-build
exit_if_failed 'Resetting travis-build failed.'
yes | gem install bundler
exit_if_failed 'Installing bundler failed.'
yes | bundle install --gemfile ~/.travis/travis-build/Gemfile
exit_if_failed 'Installing travis-build failed.'
bundler binstubs travis
exit_if_failed 'Installing binstubs for travis-build failed.'
cd ~
yes | travis
exit_if_failed 'Installing travis-build failed.'
~/.travis/travis-build/bin/travis endpoint --com --set-default
exit_if_failed 'Changin travis endpoint failed.'
