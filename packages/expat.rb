require 'package'

class Expat < Package
  version '2.2.0'
  source_url 'https://sourceforge.net/projects/expat/files/expat/2.2.0/expat-2.2.0.tar.bz2/download'
  source_sha1 '8453bc52324be4c796fd38742ec48470eef358b3'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/expat-2.2.0-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/expat-2.2.0-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/expat-2.2.0-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'c7f6a4dd1d86c0d70ca629e79970bb5e42b11700',
    i686:   '1bc29363757b205a9ef4fa00b5822cf10e73075e',
    x86_64: '7e5223002c6f08c82df14fcc79f7e825ba5a1a71',
  })

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
