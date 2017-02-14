require 'package'

class Mapserver < Package
  version '7.0.4'
  source_url 'http://download.osgeo.org/mapserver/mapserver-7.0.4.tar.gz'
  source_sha1 '8fb13c27da5902e6d9ad50f3eba550bd90750607'

  depends_on 'gdal'
  depends_on 'libpng'
  depends_on 'libjpeg'
  depends_on 'proj4'
  depends_on 'geos'
  depends_on 'curl'
  depends_on 'libgd'
  depends_on 'libxml2'

  def self.build
    # Mapserver supports only tiff3, but we need tiff4 to use BigTIFF.
    # We use tiff4 through gdal as described at
    # http://lists.osgeo.org/pipermail/mapserver-users/2009-June/061792.html
    system "./configure CFLAGS=\" -fPIC\" --with-gdal=/usr/local/bin/gdal-config --with-ogr --with-png --with-jpeg --without-pdf --with-agg --with-proj --with-threads --with-geos=/usr/local/bin/geos-config --with-wfs --with-wmsclient --with-wfsclient --with-curl-config=/usr/local/bin/curl-config --with-xml2-config=/usr/local/bin/xml2-config"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
