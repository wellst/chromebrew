require 'package'

class Bz2 < Package
  version '1.0.6'
  source_url 'http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz'
  source_sha1 '3f89f861209ce81a6bab1fd1998c0ef311712002'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/bz2-1.0.6-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/bz2-1.0.6-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/bz2-1.0.6-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'c0d478fe01c106830f1083a486da7c85476b1ec7',
    i686:   '7fb7c79b54b8c8593340e247a86f11185285e0dd',
    x86_64: '1e8d258e41dfb23133677bf2762fb78ba5be0056',
  })

  depends_on 'diffutils'
  rdepends_on

  def self.build
    system "make -f Makefile-libbz2_so"
  end

  def self.install
    # Modify Makefile from "ln -s $(PREFIX)/bin/xxx $(PREFIX)/bin/yyy" to
    # "ln -s xxx $(PREFIX)/bin/yyy"
    system "sed", "-i", "Makefile", "-e", "/ln -s/s:$(PREFIX)/bin/::"

    # No DESTDIR in bz2 Makefile
    system "make", "PREFIX=#{CREW_DEST_DIR}/usr/local", "install"
  end

  def self.check
    system "make", "test"
  end
end
