require 'package'

class Bc < Package
  version '1.06-2'
  source_url 'http://ftp.gnu.org/gnu/bc/bc-1.06.tar.gz'
  source_sha1 'c8f258a7355b40a485007c40865480349c157292'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/bc-1.06-1-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/bc-1.06-1-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/bc-1.06-1-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'b1f8297e9e0b20b298938bb56996ca4a5a4df488',
    i686:   '4f104d0b33ab2348aa45119fb0901489348a6555',
    x86_64: '4c883827fb47514e5ef2dc0a0eea01c0a2d93419',
  })

  depends_on 'readline'
  depends_on 'flex'
  rdepends_on 'readline'

  def self.build
    # even with -O1, `echo 10 | bc -l` won't work
    system "CFLAGS=-O0 ./configure --with-readline"
    system "sed", "-i", "bc/scan.l", "-e", "/readline/s/readline, (char/readline, (const char/"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
