class { wp::cli:
	ensure => installed,
	install_path => '/usr/share/wp-cli',
	version => '0.13',
}

$utpath = '/var/www/unittest.dev'
$wptpath = '/var/www/wptest.dev'
$mtpath = '/var/www/multitest.dev'

trt::install {
	# Install WordPress 1 (Theme Unit Test data)
	'unittest.dev':
		wp_url			=> 'unittest.dev',
		install_path 	=> $utpath;
	
	# Install WordPress 2 (WPTest.io data)
	'wptest.dev':
		wp_url			=> 'wptest.dev',
		install_path 	=> $wptpath,
		db_user 		=> 'wordpress2',
		db_pass			=> 'wordpress2',
		db_name			=> 'wordpress2';
		
	# Install WordPress 3 (Multisite)
	'multitest.dev':
		wp_url			=> 'multitest.dev',
		install_path 	=> $mtpath,
		db_user 		=> 'wordpress_multi',
		db_pass			=> 'wordpress_multi',
		db_name			=> 'wordpress_multi',
		multisite		=> true;
					
}