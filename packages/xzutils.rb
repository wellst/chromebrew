require 'package'

class Xzutils < Package
  version '5.2.3-1'
  source_url 'http://tukaani.org/xz/xz-5.2.3.tar.gz'
  source_sha1 '529638eec3597e429cc54c74551ac0a89169e841'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/xzutils-5.2.3-1-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/xzutils-5.2.3-1-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/xzutils-5.2.3-1-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '2e4781c7f3661d28915e2ec84944ac5e41e10dc0',
    i686:   'daf95d9441e8c1bdec51888934ba59f384335fcf',
    x86_64: '6efebc68123195e109adfa89523898a527c569c4',
  })

  def self.build
    system "./configure", "--prefix=/usr/local", "--disable-docs", "--enable-shared", "--disable-static", "--with-pic"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make", "check"
  end
end
