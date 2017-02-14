require 'package'

class Scrollz < Package
  version '2.3'
  source_url 'http://www.scrollz.info/download/ScrollZ-2.3.tar.gz'
  source_sha1 '991e6acfdf95d84ca159a37336c2d45a624d432f'

  depends_on 'buildessential'
  depends_on 'ncurses'

  def self.build
    system "CFLAGS=-I/usr/local/include/ncurses ./configure"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
