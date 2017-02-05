require 'package'

class Libsigsegv < Package
  version '2.10-1'
  source_url 'ftp.gnu.org/gnu/libsigsegv/libsigsegv-2.10.tar.gz'
  source_sha1 'b75a647a9ebda70e7a3b33583efdd550e0eac094'

  def self.build
    system "./configure", "--enable-shared", "--disable-static", "--with-pic"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make check"
  end
end
