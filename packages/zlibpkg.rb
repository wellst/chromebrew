require 'package'

class Zlibpkg < Package
  version '1.2.11'
  source_url 'http://www.zlib.net/zlib-1.2.11.tar.gz'
  source_sha1 'e6d119755acdf9104d7ba236b1242696940ed6dd'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/zlibpkg-1.2.11-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/zlibpkg-1.2.11-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/zlibpkg-1.2.11-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '195db0418f70b593e7a3d6530309fbd1b2f3200d',
    i686:   'a7a12709e1b016bbd2e3c8aa0969addf129bc4c6',
    x86_64: 'ae78cdddb2b74a4fa87b79fc04345d5213ab1a43',
  })

  def self.build
    system "./configure"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make check"
  end
end
