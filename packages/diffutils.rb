require 'package'

class Diffutils < Package
  version '3.5'
  source_url 'ftp://ftp.gnu.org/gnu/diffutils/diffutils-3.5.tar.xz'
  source_sha1 '1169cce8eaaf7290dc087d65db7ed75de0dceb93'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/diffutils-3.5-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/diffutils-3.5-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/diffutils-3.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'a8f474673352285bb5bd232bdc991401cb25cc52',
    i686:   'eed0f829b3f9cf6097dc0092164be626c0317cff',
    x86_64: '8e28ff0569e3e8b5483756597eb22bb41a056301',
  })

  depends_on "libsigsegv"

  def self.build
    system "./configure", "--prefix=/usr/local"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
