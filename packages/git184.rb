require 'package'

class Git184 < Package
  version '1.8.4'
  source_url 'https://github.com/git/git/archive/v1.8.4.tar.gz'
  source_sha1 '6b3924a5e7a05893670ca9744b7f5166cf03193b'
  binary_url ({
    armv7l: 'https://dl.dropboxusercontent.com/s/lnz5hmjv48d14f2/git-1.8.4-chromeos-armv7l.tar.xz',
    i686:   'https://dl.dropboxusercontent.com/s/g3binxopw5nfky1/git-1.8.4-chromeos-i686.tar.gz',
    x86_64: 'https://dl.dropboxusercontent.com/s/i7vs9wfk94tsrzt/git-1.8.4-chromeos-x86_64.tar.gz',
  })
  binary_sha1 ({
    armv7l: '084a3b9bb90c572e7c5b12aae485715f145053e5',
    i686:   '8c1bf4bcffb0e9c17bf20dd05981e86ea34d5d65',
    x86_64: '067cb6c36616ac30999ab97e85f3dc0e9d1d57f4',
  })

  # compile-time dependencies
  depends_on 'zlibpkg'
  depends_on 'libssh2'
  depends_on 'openssl'
  depends_on 'perl'
  depends_on 'curl'
  depends_on 'expat'
  depends_on 'gettext'
  depends_on 'python27'     # requires python2

  # run-time dependencies
  # use system zlibpkg, openssl, curl, expat
  rdepends_on 'libssh2'

  def self.build
    # need to build using single core
    system "make", "-j1", "prefix=/usr/local", "CC=gcc", "PERL_PATH=perl", "PYTHON_PATH=python2", "all"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "prefix=/usr/local", "CC=gcc", "PERL_PATH=perl", "PYTHON_PATH=python2", "install"
  end
end
