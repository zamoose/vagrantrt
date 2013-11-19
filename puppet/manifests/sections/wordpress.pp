class { wp::cli:
	ensure => installed,
	install_path => '/usr/share/wp-cli',
	version => '0.12.1',
}

$utpath = '/var/www/unittest.dev'
$wptpath = '/var/www/wptest.dev'
$mtpath = '/var/www/multitest.dev'

# Install WordPress 1 (Theme Unit Test data)
trt::install {
	'unittest.dev':
		wp_url			=> 'unittest.dev',
		install_path 	=> $utpath;
	
	'wptest.dev':
		wp_url			=> 'wptest.dev',
		install_path 	=> $wptpath,
		db_user 		=> 'wordpress2',
		db_pass			=> 'wordpress2',
		db_name			=> 'wordpress2';
	
	'multitest.dev':
		wp_url			=> 'multitest.dev',
		install_path 	=> $mtpath,
		db_user 		=> 'wordpress_multi',
		db_pass			=> 'wordpress_multi',
		db_name			=> 'wordpress_multi',
		multisite		=> true;
					
}

# Install WordPress 2 (WPTest.io data)

# Install WordPress 3 (Multisite)

# 
# exec { "wp download $utpath":
# 	command 	=> "/usr/bin/wp core download",
# 	cwd 		=> $utpath,
# 	unless 		=> "test -f $utpath/wp-config-sample.php",
# 	require 	=> [ Class['wp::cli'], File[$utpath] ],	
# }
# exec {"wp install $utpath":
# 	command => "/usr/bin/wp core install --base='unittest.dev' --title='unittest.dev' --admin_email='wordpress@unittest.dev' --admin_name='wordpress' --admin_password='wordpress'",
# 	cwd => $utpath,
# 	require => [ Class['wp::cli'], File[$utpath], Exec["wp download $utpath."] ],
# }

# # Install WordPress 2 (WPTest.io data)
# exec {"wp install /var/www/wptest.dev":
# 	command => "/usr/bin/wp core install --base='wptest.dev' --title='wptest.dev' --admin_email='wordpress@wptest.dev' --admin_name='wordpress' --admin_password='wordpress'",
# 	cwd => '/var/www/unittest.dev',
# 	require => [ Class['wp::cli'], File['/var/www/wptest.dev'] ],
# }
# 
# # Install WordPress 3 (Multisite)
# exec {"wp install /var/www/multitest.dev":
# 	command => "/usr/bin/wp core multisite-install --base='multitest.dev' --title='multitest.dev' --admin_email='wordpress@multitest.dev' --admin_name='wordpress' --admin_password='wordpress'",
# 	cwd => '/var/www/multitest.dev',
# 	require => [ Class['wp::cli'], File['/var/www/multitest.dev'] ],
# }
