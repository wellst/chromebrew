require 'package'

class Tcpstat < Package
  version '1.5' 

  # original source is not available, so change url to one of the mirrors (identical sha1)
  # source_url 'http://www.frenchfries.net/paul/tcpstat/tcpstat-1.5.tar.gz' 
  source_url 'https://launchpad.net/ubuntu/+archive/primary/+files/tcpstat_1.5.orig.tar.gz' 
  source_sha1 '3881edafe2a45c807a6f197792251036c599ec50'

  def self.build
    system "./configure", "--prefix=/usr/local"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
