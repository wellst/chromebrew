require 'package'
 
class Gdbm < Package
  version '1.12-1'
  source_url 'ftp://ftp.gnu.org/gnu/gdbm/gdbm-1.12.tar.gz'
  source_sha1 '86513e8871bb376bc014e9e5a2d18a8e0a8ea2f5'
  
  def self.build
    system './configure', '--disable-static', '--enable-shared', '--with-pic'
    system 'make'
  end
  
  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make check"
  end
end
