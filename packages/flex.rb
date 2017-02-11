require 'package'

class Flex < Package
  version '2.6.3'
  source_url 'https://github.com/westes/flex/releases/download/v2.6.3/flex-2.6.3.tar.gz'
  source_sha1 '8008eb0e4ccc634c334ac1d9e04716be2ba527a9'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/flex-2.6.3-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/flex-2.6.3-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/flex-2.6.3-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '3669cb2eb9fe05120b61fc493fe032b670213be9',
    i686:   'f6d1bbbe1c85533402620c4e41fc19c2cb24cf5e',
    x86_64: '6654f4f8f85c3a87c023624ef1a788661f7ef52e',
  })

  depends_on 'm4'
  depends_on 'bison'
  rdepends_on 'm4'

  def self.build
    system "./configure", "--with-pic"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make check"
  end
end
