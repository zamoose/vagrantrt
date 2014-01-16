define trt::install (
	$wp_url = 'localhost',
	$install_path = '/var/www/html',
	$db_name = 'wordpress',
	$db_user = 'wordpress',
	$db_pass = 'wordpress',
	$db_host = 'localhost',
	$admin_user = 'wordpress',
	$admin_pw = 'wordpress',
	$multisite = false,
 ){
	 
	require wp::cli
	require mysql
	
	if !defined( Mysql::Grant[$db_name] ) {
		mysql::grant { $db_name:
			mysql_password   => $db_pass,
			mysql_db         => $db_name,
			mysql_user       => $db_user,
			mysql_host       => $db_host,
		}
	}
	if ! defined( File[$install_path] ) {
		file { $install_path:
			ensure		=> 'directory',
			owner		=> 'apache',
			group 		=> 'apache',
		}
	}
	
	# Download latest stable WordPress
	exec { "wp core download $install_path":
		command 	=> "/usr/bin/wp core download",
		cwd 		=> $install_path,
		unless 		=> "/usr/bin/test -f $install_path/wp-config-sample.php",
		require 	=> [ Class['wp::cli'], File[$install_path] ],	
	}
	# Create the wp-config.php file
	file { "${install_path}/wp-config.php":
		replace		=> 'no',
		content		=> template('wordpress/wp-config.php.erb'),
		require		=> File[$install_path],
	}

	# Perform the actual install
	exec {"wp install $install_path":
		command => $multisite ? {
			true	=> "/usr/bin/wp core multisite-install --url='$wp_url' --base='/' --title='$wp_url' --admin_email='wordpress@$wp_url' --admin_name='$admin_user' --admin_password='$admin_pw'",
			false	=> "/usr/bin/wp core install --url='$wp_url' --title='$wp_url' --admin_email='wordpress@$wp_url' --admin_name='$admin_user' --admin_password='$admin_pw'",
		},
		cwd => $install_path,
		unless		=> '/usr/bin/wp core is-installed',	
		require 	=> [ Class['wp::cli'], File[$install_path], File["${install_path}/wp-config.php"] ],
	}	
}
