require 'package'

class Texinfo < Package
  version '6.3'
  source_url 'ftp://ftp.gnu.org/gnu/texinfo/texinfo-6.3.tar.xz'
  source_sha1 '64568f2791d1309aaccc22e63758458fd249ec8b'

  depends_on 'gettext'
  depends_on 'perl'
  depends_on 'ncurses'
  rdepends_on 'perl'
  rdepends_on 'ncurses'

  def self.build
    # installing necessary perl modules
    system 'cpan', 'install', 'Locale::Messages', 'Text::Unidecode', 'Unicode::EastAsianWidth'

    # configure and make
    system './configure',
        '--with-external-Text-Unidecode',
        '--with-external-Unicode-EastAsianWidth'
    # Disable libintl perl since the latest libintl-perl breaks tests
    #     '--with-external-libintl-perl',
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make check"
  end
end
