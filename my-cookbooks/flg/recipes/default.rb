include_recipe "apt"

include_recipe "memcached"
include_recipe "nginx"

lib_dir = 'lib'
node["php"]["configure_options"] = %W{
  --prefix=#{node["php"]["prefix_dir"]}
  --with-libdir=#{lib_dir}
  --with-config-file-path=#{node["php"]['conf_dir']}
  --with-config-file-scan-dir=#{node["php"]['ext_conf_dir']}
  --with-pear
  --enable-fpm
  --with-fpm-user=#{node["php"]['fpm_user']}
  --with-fpm-group=#{node["php"]['fpm_group']}
  --with-zlib
  --with-openssl
  --with-kerberos
  --with-bz2
  --with-curl
  --enable-ftp
  --enable-zip
  --enable-exif
  --with-gd
  --enable-gd-native-ttf
  --with-gettext
  --with-gmp
  --with-mhash
  --with-iconv
  --enable-sockets
  --enable-soap
  --with-xmlrpc
  --with-libevent-dir
  --with-mcrypt
  --enable-mbstring
  --with-mysql
  --with-mysql-sock
  --with-sqlite3
  --with-pdo-mysql
  --with-pdo-sqlite
  --with-mysqli
}
include_recipe "php::source"
