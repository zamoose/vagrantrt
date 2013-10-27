class { wp::cli:
	ensure => installed,
	install_path => '/usr/share/wp-cli',
	version => '0.12.1',
}

# Install WordPress 1 (Theme Unit Test data)
exec {"wp install /var/www/unittest.dev":
	command => "/usr/bin/wp core install --base='unittest.dev' --title='unittest.dev' --admin_email='wordpress@unittest.dev' --admin_name='wordpress' --admin_password='wordpress'",
	cwd => '/var/www/unittest.dev',
	require => [ Class['wp::cli'], File['/var/www/unittest.dev'] ],
}

# Install WordPress 2 (WPTest.io data)
exec {"wp install /var/www/wptest.dev":
	command => "/usr/bin/wp core install --base='wptest.dev' --title='wptest.dev' --admin_email='wordpress@wptest.dev' --admin_name='wordpress' --admin_password='wordpress'",
	cwd => '/var/www/unittest.dev',
	require => [ Class['wp::cli'], File['/var/www/wptest.dev'] ],
}

# Install WordPress 3 (Multisite)
exec {"wp install /var/www/multitest.dev":
	command => "/usr/bin/wp core multisite-install --base='multitest.dev' --title='multitest.dev' --admin_email='wordpress@multitest.dev' --admin_name='wordpress' --admin_password='wordpress'",
	cwd => '/var/www/multitest.dev',
	require => [ Class['wp::cli'], File['/var/www/multitest.dev'] ],
}
