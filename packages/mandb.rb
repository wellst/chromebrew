require 'package'

class Mandb < Package
  version '2.7.6.1'
  source_url 'http://download.savannah.gnu.org/releases/man-db/man-db-2.7.6.1.tar.xz'
  source_sha1 '919dcb34d604faac9b18a38ead07f457d0dab501'

  depends_on 'libpipeline'
  depends_on 'pkgconfig'
  depends_on 'gdbm'
  depends_on 'groff'
  depends_on 'less'

  def self.build
    system './configure',
      '--with-systemdtmpfilesdir=/usr/local/lib/tmpfiles.d',  # we can't write to /usr/lib/tmpfiles.d
      '--disable-cache-owner',                                # we can't create the user 'man'
      '--with-pager=/usr/local/bin/less'                      # the pager is not at the default location
    system 'make'
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
    puts ""
    puts "You will have to change the default PAGER env variable to be able to use mandb:"
    puts "echo \"export PAGER=/usr/local/bin/less\" >> ~/.bashrc && . ~/.bashrc"
    puts ""
    puts "You will also have to set the MANPATH env variable:"
    puts "echo \"export MANPATH/usr/local/man:$MANPATH\" >> ~/.bashrc && ~/.bashrc"
  end
end
