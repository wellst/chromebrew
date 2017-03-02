require 'package'

class Imagemagick < Package
  version '7.0.4-7'
  source_url 'https://github.com/ImageMagick/ImageMagick/archive/7.0.4-7.tar.gz'
  source_sha1 'b8ea1b821eddf94d6ba174278b797a6b020ffc73'
  
  depends_on 'pkgconfig'

  def self.build
    system "./configure CFLAGS=\" -fPIC\" --without-python"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
