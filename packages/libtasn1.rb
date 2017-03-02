require 'package'

class Libtasn1 < Package
  version '4.9'
  source_url 'ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-4.9.tar.gz'
  source_sha1 'c9b8148f4877ef739d3cf67de491c4c3dd5f5aca'

  # bison, diff, cmp are required at compile-time
  depends_on 'buildessential'
  depends_on 'pkgconfig'
  depends_on 'bison'
  depends_on 'diffutils'

  # nothing required at run-time
  rdepends_on

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
