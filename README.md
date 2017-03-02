chromebrew
==========

Package manager for Chrome OS

Supported Systems
-----------------

|  Architecture  | Supported? |
|:--------------:|:----------:|
|     x86_64     |     Yes    |
|      i686      |     Yes    |
|     armv7l     |     Yes    |

Here, I'm releasing personally modified chromebrew.  Modifications are listed at
[below](#modifications). If you are looking for the original chromebrew, please
refer [the original site](https://github.com/skycocker/chromebrew/).

Basically, I want to merge all modifications here to the original one.
So, this chromebrew often rebase to the original one to make merging
easier.

Overview
--------

Chromebooks with Chrome OS run a linux kernel - the only missing piece to use them as full-featured linux distro was gcc and make with their dependencies. Well, the piece isn't missing anymore. Say hello to chromebrew!

Prerequisites
-------------

You will need a Chromebook with developer mode enabled.

On [the ChromiumOS Wiki](https://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices) select your device and follow the instructions listed there.

Please be aware of the fact that developer mode is insecure if not properly configured.

Installation
------------
Open the terminal with Ctrl+Alt+T and type `shell`.

If this command returns `ERROR: unknown command: shell` please have a second look at the prerequisites and make sure your Chromebook is in developer mode.

Then download and run the installation script

    wget -q -O - https://raw.github.com/jam7/chromebrew/master/install.sh | bash

Usage
-----

    crew <command> <package|regex> <keep[temporary files]>

Where available commands are:
  
  * search [looks for a package]
  * download [downloads a package to `CREW_BREW_DIR` (`/usr/local/tmp/crew` by default), but doesn't install it]
  * install [installs a package along with its dependencies. You'll be prompted for confirmation]
  * remove [removes a package. Must be ran as root]
  * whatprovides [lists packages containing files matching to regex]
  * update [updates crew environment]
  * upgrade [builds a package or installed all packages along with its dependencies]
  * build [builds a package along with its dependenceies]
  * binstall [builds and isntalls a package along with its dependencies]
  
Available packages are listed in the [packages directory](https://github.com/jam7/chromebrew/tree/master/packages).

Chromebrew will wipe its `BREW_DIR` (`/usr/local/tmp/crew` by default) after installation unless you pass "keep" as the last parameter when running "crew install".

    crew install <package> keep

Modifications
-------------

Chromebrew at this repository is modified from its original, https://github.com/skycocker/chromebrew.
I'll merge these modifications to the original, but it's time consuming.

What modifications are:

  * Refactoring crew
    * Change to not use `-j` for install to avoid errors caused by race-condition (#488, #526)
    * Adding `rdepends_on` method to maintain run-time dependencies (#487, #539)
    * Add build and binstall command to build binary packages easily
    * Add check method to check the correctness of compile
    * Change the timing of `remove` to solve `no ruby` problem (#236)
    * Fix a bug of crew that is not removing `/usr/local/tmp/crew/dest` correctly
    * Change crew to abort just after errors
  * Add shell scripts to maintain binary package files (#343)
  * Provide bc binaries
  * Provide bison binaries
  * Correct bz2 version number to 1.0.6, fix symbolic link problem and (preparing to provide binaries)
  * Update curl to 7.52.1 and provide binaries
  * Provide diffutils 3.5 binaries
  * Update expat to 2.2.0 and provide binaries
  * Update gettext to 0.19.8.1 and provide binaries
  * Update git to 2.11.0 and provide binaries
  * Add check method to go
  * Provide less 481 binaries
  * Provide libsigsegv 2.10 binaries
  * Update libssh2 to 1.8.0 and provide binaries
  * Update libxml2 to 2.9.4 and provide binaries
  * Update m4 to 1.4.18 and provide binaries
  * Update make to 4.2 and provide binaries
  * Provide ncurses and ncursesw binaries
  * Provide openssl binaries
  * Provide patch binaries
  * Add perl compile and check methods
  * Provide pkgconfig binaries
  * Update python 2.7 binaries
  * Update python to 3.6 and provide binaries
  * Update readline to 7.0p3 and provide binaries
  * Update ruby to 2.4.0 and provide binaries
  * Update glibc to 2.23 and provide binaries
  * Provide xzutils binaries
  * Update zlibpkg to 1.2.11 and provide binaries

License
-------

Copyright 2013 Michal Siwek and [all the awesome contributors](https://github.com/skycocker/chromebrew/graphs/contributors)  
Copyright 2016 Kazushi (Jam) Marukawa, added ARM related packages

This project including all of its source files is released under the terms of [GNU General Public License (version 3 or later)](http://www.gnu.org/licenses/gpl.txt)

Thanks Davy for [putting pre-compiled gcc for ARM](http://davy.nyacom.net/cros-arm-dev.html).  It was the beginning of chromebrew for ARM.
