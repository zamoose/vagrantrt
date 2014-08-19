$utpath = '/var/www/unittest.dev'
$wptpath = '/var/www/wptest.dev'
$mtpath = '/var/www/multitest.dev'

$sites = hiera_hash('sites')

create_resources( 'trt::install', $sites )

# $sites.each |$site, $props| {
# 	trt::install {
# 		$site:
# 		#$s = sprintf( 'Site: %s', $site )
# 		#alert($s)
# 		$props.each |$prop, $value| {
# 			#$t = sprintf( 'Property: %s Value: %s', $prop, $value)
# 			#alert($t)
# 			$prop => $value
# 		}
# 	}


	#trt::install { $site:
		# wp_url			=> $site[]
		# install_path	=> $sites['install_path'],

	# 	# Install WordPress 1 (Theme Unit Test data)
	# 	'unittest.dev':
	# 		wp_url			=> 'unittest.dev',
	# 		install_path 	=> $utpath;
	#
	# 	# Install WordPress 2 (WPTest.io data)
	# 	'wptest.dev':
	# 		wp_url			=> 'wptest.dev',
	# 		install_path 	=> $wptpath,
	# 		db_user 		=> 'wordpress2',
	# 		db_pass			=> 'wordpress2',
	# 		db_name			=> 'wordpress2';
	#
	# 	# Install WordPress 3 (Multisite)
	# 	'multitest.dev':
	# 		wp_url			=> 'multitest.dev',
	# 		install_path 	=> $mtpath,
	# 		db_user 		=> 'wordpress_multi',
	# 		db_pass			=> 'wordpress_multi',
	# 		db_name			=> 'wordpress_multi',
	# 		multisite		=> true,
	# 		extraphp        => "<<PHP
	# define('FS_METHOD', 'direct');
	# define('WP_CACHE', 'true');
	# define('WP_CACHE_KEY_SALT', '${slug}1');
	# PHP";
	#}
#}
