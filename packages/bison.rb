require 'package'

class Bison < Package
  version '3.0.4'
  source_url 'http://mirror.keystealth.org/gnu/bison/bison-3.0.4.tar.xz'
  source_sha1 '8270497aad88c7dd4f2c317298c50513fb0c3c8e'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/bison-3.0.4-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/bison-3.0.4-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/bison-3.0.4-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '52b0d2d644ebb102d6a7c83ad56d3b17b2ffcbd7',
    i686:   'b7400029e8e202f9bdf37d00c609f2d99bb21072',
    x86_64: '85db3e6c842de5ba1203bd0c0db11223b8b4adab',
  })

  depends_on 'diffutils'
  depends_on 'm4'
  # Bison requires flex for `make check`.
  # However, writing it causes dependency loop.
  # So, users who use build/binstall install flex by hand.
  rdepends_on

  def self.build
    system './configure --prefix=/usr/local'
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make check"
  end
end
