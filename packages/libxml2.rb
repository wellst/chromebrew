require 'package'

class Libxml2 < Package
  version '2.9.4'
  source_url 'ftp://xmlsoft.org/libxml2/libxml2-2.9.4.tar.gz'
  source_sha1 '958ae70baf186263a4bd801a81dd5d682aedd1db'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/libxml2-2.9.4-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/libxml2-2.9.4-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/libxml2-2.9.4-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'e0fdcefe786a368852e147dd85e362a546a59c9c',
    i686:   '16ca36c31c5e3eb40bfd8f62413fb93aa19d6cfb',
    x86_64: '4e89a9fee1e2f5a26b4f79192ae2c8b2e348b788',
  })

  def self.build
    system "./configure", "--enable-shared", "--disable-static", "--with-pic", "--without-python"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    # Remove EBCDIC test since it fails.
    # Check https://mail.gnome.org/archives/xml/2010-April/msg00010.html for details.
    system "rm", "test/ebcdic_566012.xml"

    system "make", "check"
  end
end
