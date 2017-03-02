require 'package'

class Python < Package
  version '3.6.0'
  source_url 'https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz'
  source_sha1 '120d536ee14a3153fc2435838c0f27c2e25cd29c'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/python-3.6.0-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/python-3.6.0-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/python-3.6.0-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: '175fa6619a196f362d8a3dad604c9a6f147a24fd',
    i686:   '998f275466d7970eb3cad39d3c0a12743476543e',
    x86_64: '48ca2e6fa6c7508702cb3ac3d965f3cf787006f7',
  })

  depends_on 'bz2'
  depends_on 'xzutils'
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
    # Chromebook doesn't allow SIGHUP, so disable SIGHUP test
    system "sed", "-i", "Lib/test/test_asyncio/test_events.py", "-e", "/Don't have SIGHUP/s/win32/linux/"
    system "sed", "-i", "Lib/test/test_asyncio/test_subprocess.py", "-e", "/Don't have SIGHUP/s/win32/linux/"

    # Chromebook returns EINVAL for F_NOTIFY DN_MULTISHOT, so disable test_fcntl_64_bit
    system "sed", "-i", "Lib/test/test_fcntl.py", "-e", '/ARM Linux returns EINVAL for F_NOTIFY DN_MULTISHOT/s/$/\
    @unittest.skipIf(platform.system() == '"'Linux'"', "Chromeos returns EINVAL for F_NOTIFY DN_MULTISHOT")/'

    # Using /tmp breaks test_distutils, test_subprocess
    # Proxy setting breaks test_httpservers, test_ssl,
    # test_urllib, test_urllib2, test_urllib2_localnet
    system "TMPDIR=/usr/local/tmp http_proxy= https_proxy= ftp_proxy= make test"
  end
end
