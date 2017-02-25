require 'package'

class Gnutls < Package
  version '3.5.9'
  source_url 'ftp://ftp.gnutls.org/gcrypt/gnutls/v3.5/gnutls-3.5.9.tar.xz'
  source_sha1 'f3f184a92f128af1c2fb29b29a4d325af65694a5'

  depends_on 'buildessential'
  depends_on 'pkgconfig'
  depends_on 'zlibpkg'
  depends_on 'libunistring'
  depends_on 'gmp'
  depends_on 'nettle'
  depends_on 'libtasn1'
  depends_on 'libffi'
  depends_on 'p11kit'
  depends_on 'libunbound'

  rdepends_on 'libunistring'
  rdepends_on 'gmp'
  rdepends_on 'nettle'
  rdepends_on 'libtasn1'
  rdepends_on 'libffi'
  rdepends_on 'p11kit'
  rdepends_on 'libunbound'

  def self.build
    system "./configure", "--enable-shared", "--disable-static", "--with-pic",
      "--with-system-priority-file=#{CREW_PREFIX}/etc/gnutls/default-priorities",
      "--with-unbound-root-key-file=#{CREW_PREFIX}/etc/unbound/root.key"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make check"
  end
end
