require 'package'

class Patch < Package
  version '2.7'
  source_url 'http://ftp.gnu.org/gnu/patch/patch-2.7.tar.gz'
  source_sha1 '8886fe94a4cefaf42678ebeca25f4c012bd0f5dc'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/patch-2.7-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/patch-2.7-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/patch-2.7-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '38a625a146af7e85711977d053c246d8305f3d74',
    i686:   'a89a3e4a3296f8893194bbe792b9b2256597e97c',
    x86_64: 'ed7ef8836e6cafe9f01bb81c13f0d678bdd9230b',
  })

  def self.build
    system './configure --prefix=/usr/local'
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
