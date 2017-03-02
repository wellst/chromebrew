require 'package'

class P11kit < Package
  version '0.23.2'
  source_url 'https://p11-glue.freedesktop.org/releases/p11-kit-0.23.2.tar.gz'
  source_sha1 '4da0d7b47935b6cb0f321dd00358b063ae42df71'

  depends_on 'diffutils'
  depends_on 'libtasn1'
  depends_on 'libffi'

  rdepends_on 'libtasn1'
  rdepends_on 'libffi'

  def self.build
    system "./configure", "--enable-shared", "--disable-static", "--with-pic"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    # Doesn't perform tests since 2 out of 45 fail as
    # reported in https://bugs.freedesktop.org/show_bug.cgi?id=95366
    # system "make check"
  end
end
