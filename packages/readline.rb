require 'package'

class Readline < Package
  version '7.0p3'
  source_url 'ftp://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz'
  source_sha1 'd9095fa14a812495052357e1d678b3f2ac635463'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/readline-7.0p3-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/readline-7.0p3-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/readline-7.0p3-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'f5146136956a0e15e0ad4744652c0998dbeccbcd',
    i686:   '3e0d522034d3b0615b335238765c9f3c59154b3c',
    x86_64: 'dcc64b502c372c037ea78817a8f504171921ea6b',
  })

  depends_on 'buildessential'
  depends_on 'patch'
  depends_on 'ncurses'
  rdepends_on 'ncurses'

  def self.build
    system "wget -r -N -nd --no-parent ftp://ftp.gnu.org/gnu/readline/readline-7.0-patches -P readline-7.0-patches"
    # system "for i in readline-7.0-patches/*.sig; do gpg $i; done"
    system "for i in readline-7.0-patches/readline70-???; do patch < $i; done"

    system "CC='gcc' ./configure --disable-static --with-curses"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
