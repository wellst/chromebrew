require 'package'

class M4 < Package
  version '1.4.18'
  source_url 'ftp://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz'
  source_sha1 '228604686ca23f42e48b98930babeb5d217f1899'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/m4-1.4.18-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/m4-1.4.18-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/m4-1.4.18-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '4b418105801b9d106f696cc5b12527c35ec9a469',
    i686:   '51da17f7c128b79bded069a95e8fe5457bd3caf4',
    x86_64: 'e8b7b570def9e84db3db050ad348d2011e7c3c68',
  })

  depends_on 'libsigsegv'

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
