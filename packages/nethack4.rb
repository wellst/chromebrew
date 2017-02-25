require 'package'

class Nethack4 < Package
  # "nethack4" fork of nethack with a few patches and a modern build system
  version '4.3.0-beta2'
  source_url 'http://nethack4.org/media/releases/nethack4-4.3-beta2.tar.gz'
  source_sha1 'e261c0ac618589a47e63525ed56eb17e72b14754'

  depends_on 'buildessential'
  depends_on 'ncurses'
  depends_on 'bison'
  depends_on 'flex'
  depends_on 'perl'
  depends_on 'zlibpkg'

  rdepends_on 'ncurses'

  
  def self.build
    target="build"
    system "mkdir -p " + target
    Dir.chdir target  do
      # Force to set codeset to UTF-8 since gcc supports it
      # LANG environment variable doesn't work correctly on chromebook
      system 'sed', '-i', '../aimake', '-e', '/$codeset *= */s/;/; $codeset = "UTF-8";/'

      # Build with rpath pointing at /usr/local
      system "/usr/local/bin/perl ../aimake --config-only -i /usr/local/ --directory-layout=prefix --without=gui"

      # Need -fPIC for armv7l
      # Need LC_ALL to not use ascii for encoding
      system "LC_ALL=POSIX /usr/local/bin/perl ../aimake --var CFLAGS='-g -O2 -Wall -fPIC' --var CXXFLAGS='-g -O2 -Wall -fPIC'"
    end
  end
  
  def self.install
    target="build"
    Dir.chdir target  do
      #install in destdir so package manager can keep track
      system "/usr/local/bin/perl ../aimake --install-only -i #{CREW_DEST_DIR}/usr/local/ --directory-layout=prefix --without=gui"  
    end
  end
end
