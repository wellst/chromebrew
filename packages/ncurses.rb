require 'package'

class Ncurses < Package
  version '6.0-2'
  source_url 'ftp://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.0.tar.gz'
  source_sha1 'acd606135a5124905da770803c05f1f20dd3b21c'

  depends_on "diffutils"
  depends_on "ncursesw"

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
