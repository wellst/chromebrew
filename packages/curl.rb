require 'package'

class Curl < Package
  version '7.52.1'
  source_url 'https://curl.haxx.se/download/curl-7.52.1.tar.bz2'
  source_sha1 'aa9f2300096d806c68c7ba8c50771853d1b43eb4'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/curl-7.52.1-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/curl-7.52.1-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/curl-7.52.1-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '7f654e59404a541b7761b8dba505cbd37971e168',
    i686:   'a53b6b88f0f9a92d3f9948cc98303603cd02d8f8',
    x86_64: '5c92a5474959b202059ac8a37f5b3094c6e2404e',
  })

  depends_on 'openssl'
  depends_on 'zlibpkg'
  depends_on 'libssh2'
  depends_on 'groff'

  rdepends_on 'libssh2'

  def self.build
    system "./configure", "--disable-static"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make test"
  end
end
