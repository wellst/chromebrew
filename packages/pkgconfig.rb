require 'package'

class Pkgconfig < Package
  version '0.29.1'
  source_url 'http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.1.tar.gz'
  source_sha1 '271ce928f6d673cc16cbced2bfd14a5f2e5d3d37'
  binary_url ({
    armv7l: 'https://github.com/jam7/chromebrew/releases/download/binaries/pkgconfig-0.29.1-chromeos-armv7l.tar.xz',
    i686:   'https://github.com/jam7/chromebrew/releases/download/binaries/pkgconfig-0.29.1-chromeos-i686.tar.xz',
    x86_64: 'https://github.com/jam7/chromebrew/releases/download/binaries/pkgconfig-0.29.1-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    armv7l: 'b1bbb5d399f090706ffd3f1df8be17f74a6b4a06',
    i686:   'f16971838245d4bbe1643afaa84ad0d810809396',
    x86_64: '531b043c556cce25912e240844ba6d05412647d6',
  })

  # It is not possible to write buildessential here since it causes dependency loop.
  #   depends_on 'buildessential'
  # Write dependency to gcc make linuxheaders instead.
  depends_on 'gcc'
  depends_on 'make'
  depends_on 'linuxheaders'
  depends_on 'diffutils'

  rdepends_on

  def self.build
      # check lib64 on any architectures since it is not a problem to not exist lib64 directory.
      system "./configure", "--with-internal-glib", "--with-pc-path=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/local/share/pkgconfig"
      system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make", "check"
  end
end
