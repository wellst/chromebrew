require 'package'

class Libssh2 < Package
  version '1.8.0'
  source_url 'https://www.libssh2.org/download/libssh2-1.8.0.tar.gz'
  source_sha1 'baf2d1fb338eee531ba9b6b121c64235e089e0f5'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/libssh2-1.8.0-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/libssh2-1.8.0-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/libssh2-1.8.0-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '443b08d04e7c462f696320222077cd4a11fa878d',
    i686:   '2649d1b28c336a46690f556ee2a027c0c9fb456b',
    x86_64: 'acc29cb1fe25be242ddba7340e551b2555a2ca7c',
  })

  depends_on 'openssl'
  depends_on 'zlibpkg'
  rdepends_on

  def self.build
    system "./configure", "--with-zlib", "--with-openssl", "--with-pic", "--disable-static"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make check"
  end
end
