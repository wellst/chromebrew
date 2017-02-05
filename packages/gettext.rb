require 'package'

class Gettext < Package
  version '0.19.8.1'
  source_url 'ftp://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz'
  source_sha1 'e0fe90ede22f7f16bbde7bdea791a835f2773fc9'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/gettext-0.19.8.1-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/gettext-0.19.8.1-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/gettext-0.19.8.1-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'e7d6c3e6ee43554dc9d163179ce4c75c2791549b',
    i686:   '9fb04566607094cd55cf5026ddf99fd7f640a4cf',
    x86_64: '8c1f9662385cc1d349a679460f25b7bdf01d7f8e',
  })

  depends_on 'diffutils'
  depends_on 'ncurses'
  depends_on 'libxml2'
  rdepends_on 'ncurses'
  rdepends_on 'libxml2'

  def self.build
    system "./configure", "--enable-shared", "--disable-static", "--with-pic"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make check"
  end
end
