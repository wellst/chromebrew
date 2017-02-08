require 'package'

class Make < Package
  version '4.2'
  source_url 'ftp://ftp.gnu.org/gnu/make/make-4.2.tar.bz2'
  source_sha1 'd78b84a219b4c16593544f541dff7eb765ce3d74'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/make-4.2-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/make-4.2-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/make-4.2-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '99e399dd9cb021a66dc3859bac584a7f2cf0b006',
    i686:   '9e1ac96fce5fbf1c2fdb7d8cf62b37ad74aad7e4',
    x86_64: 'abefd35472b85de1f3e1af7c445f7a4576e46ca9',
  })

  def self.build
    system "./configure"
    system "./build.sh"
  end

  def self.install
    system "./make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    # Give it several tries since output-sync fails rarely
    system "./make check || ./make check || ./make check"
  end
end
