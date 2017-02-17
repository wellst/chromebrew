require 'package'

class Vim < Package
  version '8.0'
  source_url 'ftp://ftp.vim.org/pub/vim/unix/vim-8.0.tar.bz2'
  source_sha1 '1f852a99d667bd675d2f2a70e82094bdbe844108'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/vim-8.0-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/vim-8.0-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/vim-8.0-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'ac34e5a206de6a4636e8f5ece6203f193ba844ca',
    i686:   '620f77119339bbc440ec7124ee8935df04ea782b',
    x86_64: '0db9223bee48effd26c24e8e72f56ae42cfe1df9',
  })

  depends_on 'ncurses'
  depends_on 'perl'
  depends_on 'python27'
  depends_on 'ruby'
  rdepends_on 'ncurses'

  def self.build
    system './configure --prefix=/usr/local --enable-gui=no --with-features=huge --without-x --disable-nls --enable-multibyte  --with-tlib=ncurses --enable-perlinterp --enable-pythoninterp  --enable-rubyinterp --with-ruby-command=/usr/local/bin/ruby --disable-selinux'
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"

    puts "\nMake sure to put your .vim directory in a subdirectory of /usr/local so it has execute permissions"
    puts "You can then symlink to your home directory so vim can see it"
    puts "\tln -s /usr/local/vim ~/.vim"
    puts "\tln -s ~/.vim/vimrc ~/.vimrc\n\n"
  end
end
