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
		multisite		=> true,
		extraphp        => "<<PHP
define('FS_METHOD', 'direct');
define('WP_CACHE', 'true');
define('WP_CACHE_KEY_SALT', '${slug}1');
PHP";


	'puppettest.dev':
		wp_url	=> 'puppettest.dev',
		install_path	=> '/var/www/puppettest.dev',
		db_user	=> 'puppett',
		db_pass	=> 'puppett',
		db_name	=> 'puppett';
}
