require 'package'

class Ncursesw < Package
  version '6.0-1'
  source_url 'ftp://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.0.tar.gz'
  source_sha1 'acd606135a5124905da770803c05f1f20dd3b21c'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/ncursesw-6.0-1-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/ncursesw-6.0-1-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/ncursesw-6.0-1-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'f9375e3d88fd51266bba8f9f05e24d8d514a5a62',
    i686:   'f2f4a1d24cc9c9cbff5015cda26decde4b859875',
    x86_64: '072640460027da7e6b187ca8fe36fe711edd37ca',
  })

  depends_on "diffutils"
  rdepends_on

  def self.build
    # Check ncurses doesn't conflict with ncrusesw
    if File.exist? CREW_CONFIG_PATH + "meta/ncurses.filelist"
      if `grep include/ncursesw #{CREW_CONFIG_PATH}meta/ncurses.filelist` != ''
	puts
	puts "PLEASE PERFORMS `crew upgrade ncurses` OR `sudo crew remove ncurses` FIRST"
	puts
	exit 1
      end
    end
    # Build ncursesw
    system './configure',
	    '--prefix=/usr/local',
	    '--without-normal',
	    '--with-shared',
	    '--with-cxx-shared',
	    '--without-debug',
	    '--enable-widec'
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
