require 'package'

class Ncurses < Package
  version '6.0-2'
  source_url 'ftp://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.0.tar.gz'
  source_sha1 'acd606135a5124905da770803c05f1f20dd3b21c'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/ncurses-6.0-2-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/ncurses-6.0-2-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/ncurses-6.0-2-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '2d3f1782bc368eb3475e50e855fc5eaab8cb4ce9',
    i686:   'b5e125e8043d453b7c796545a79b92334eeb7351',
    x86_64: 'c1cc6199d00974d898a53e79e5e0bf9c26097191',
  })

  depends_on "diffutils"
  depends_on "ncursesw"
  rdepends_on "ncursesw"

  def self.build
    system './configure',
	    '--prefix=/usr/local',
	    '--without-normal',
	    '--with-shared',
	    '--with-cxx-shared',
	    '--without-debug'
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
