require 'package'

class Libunbound < Package
  version '1.6.1'
  source_url 'https://www.unbound.net/downloads/unbound-1.6.1.tar.gz'
  source_sha1 '41369fcfd37844b02b7293b37ec78e69f0db34c7'

  depends_on 'flex'
  depends_on 'bison'
  depends_on 'gawk'
  depends_on 'expat'
  rdepends_on 'expat'

  def self.build
    system "./configure", "--enable-shared", "--disable-static", "--with-pic"

    # flex 2.6.3 requires -P option to rename yylex and other funcions
    system "sed", "-i", "Makefile", "-e", '/$(LEX) -t $(srcdir)\/util\/configlexer.lex/s:-t:-t -Pub_c_:'

    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make test"
  end
end
