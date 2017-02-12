require 'package'
 
class Sqlite < Package
  version '3.16.2'
  source_url 'http://www.sqlite.org/2017/sqlite-autoconf-3160200.tar.gz'
  source_sha1 '64ca578ad44a94115b1db0406740e14288f74bb8'

  def self.build
    system "./configure", "--disable-static", "--enable-shared", "--with-pic"
    system "make"
  end
  
  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
