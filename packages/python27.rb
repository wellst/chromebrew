require 'package'

class Python27 < Package
  version '2.7.13'
  source_url 'https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tar.xz' # software source tarball url
  source_sha1 '18a8f30a0356c751b8d0ea6f76e764cab13ee046'                     # source tarball sha1 sum
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/python-2.7.13-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/python-2.7.13-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/python-2.7.13-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '5a04d323f6dbaa78d76279aca22699ec7e2e542b',
    i686:   'fd04877f82c93673a9c9632923bf539887edb786',
    x86_64: 'f13b76e402e66721bfcb7a32c0790b34ac79de9a',
  })

  depends_on 'bz2'
  depends_on 'ncurses'
  depends_on 'openssl'
  depends_on 'sqlite'
  depends_on 'gdbm'
  # Please install packages what you use
  rdepends_on

  def self.build
    system "./configure", "CPPFLAGS=-I/usr/local/include/ncurses -I/usr/local/include/ncursesw", "--with-ensurepip=install"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    # Using /tmp breaks test_distutils, test_subprocess
    # Proxy setting breaks test_httpservers, test_ssl,
    # test_urllib, test_urllib2, test_urllib2_localnet
    system "TMPDIR=/usr/local/tmp http_proxy= https_proxy= ftp_proxy= make test"
  end
end
