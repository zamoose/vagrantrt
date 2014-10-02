# class { 'nginx': }
file {
    '/etc/nginx/global':
        ensure      => 'directory',
        owner       => 'root',
        group       => 'root',
        mode        => '0755';

    '/etc/nginx/global/wordpress.conf':
        content     => template('nginx/global/wordpress.conf'),
        owner       => 'root',
        group       => 'root',
        mode        => '0644',
        require     => File['/etc/nginx/global'],
        notify      => Service['nginx'];

    '/etc/nginx/global/restrictions.conf':
        content     => template('nginx/global/restrictions.conf'),
        owner       => 'root',
        group       => 'root',
        mode        => '0644',
        require     => File['/etc/nginx/global'],
        notify      => Service['nginx'];

    '/etc/nginx/conf.d/php-upstream.conf':
        content     => template('nginx/conf.d/php-upstream.conf'),
        owner       => 'root',
        group       => 'root',
        mode        => '0644',
        notify      => Service['nginx'];
}
