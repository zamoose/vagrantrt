# class { 'php': }
file {
    '/opt/rh/php54/root/etc/php-fpm.d/www.conf':
        content     => template('php/www.conf');
}
