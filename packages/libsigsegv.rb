require 'package'

class Libsigsegv < Package
  version '2.10-2'
  source_url 'ftp://ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.10.tar.gz'
  source_sha1 'b75a647a9ebda70e7a3b33583efdd550e0eac094'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/libsigsegv-2.10-2-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/libsigsegv-2.10-2-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/libsigsegv-2.10-2-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '234ae09fc7e2e869598e60610a92b0f012b993bf',
    i686:   '2e98e8940f4f6fc3067e64152307322f20a086ce',
    x86_64: 'b2d541f646e67dc1d50698ba1b404952279792dd',
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
