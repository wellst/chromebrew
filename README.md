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

  * Refactoring crew (#443)
  * Change to not use `-j` for install to avoid errors caused by race-condition (#488)
  * Adding `rdepends_on` method to maintain run-time dependencies (#487)
  * Add build and binstall command to build binary packages easily
  * Add check method to check the correctness of compile
  * Change the timing of `remove` to solve `no ruby` problem (#236)
  * Adding smart git installation to isntall.sh
  * Remove several unnecessary `-c` option from wget in install.sh (#383)
  * Fix a bug of crew that is not removing `/usr/local/tmp/crew/dest` correctly
  * Change crew to abort just after errors
  * Add shell scripts to maintain binary package files (#343)
  * Correct bz2 version number to 1.0.6, fix symbolic link problem and (preparing to provide binaries)
  * Update curl to 7.52.1 and provide binaries
  * Provide diffutils 3.5 binaries
  * Update expat to 2.2.0 and provide binaries
  * Update gettext to 0.19.8.1 and provide binaries
  * Update git to 2.11.0 and provide binaries
  * Update go to 1.7.5
  * Provide less 481 binaries
  * Provide libsigsegv 2.10 binaries
  * Update libssh2 to 1.8.0 and provide binaries
  * Update libxml2 to 2.9.4 and provide binaries
  * Change ncurses to provide only ncurses, and provide ncursesw individually (#490)
  * Provide ncurses and ncursesw binaries
  * Provide openssl binaries
  * Update perl to 5.24.1 ... (preparing to provide binaries)
  * Provide pkgconfig binaries
  * (Preparing to provide binaries)
  * Update ruby to 2.4.0 ... (preparing to provide binaries)
  * Update toolchains and provide binaries (#461)
  * Update zlibpkg to 1.2.11 and provide binaries

License
-------

Copyright 2013 Michal Siwek and [all the awesome contributors](https://github.com/skycocker/chromebrew/graphs/contributors)  
Copyright 2016 Kazushi (Jam) Marukawa, added ARM related packages

This project including all of its source files is released under the terms of [GNU General Public License (version 3 or later)](http://www.gnu.org/licenses/gpl.txt)

Thanks Davy for [putting pre-compiled gcc for ARM](http://davy.nyacom.net/cros-arm-dev.html).  It was the beginning of chromebrew for ARM.
