define trt::install (
  $wp_url = 'localhost',
  $wp_name = 'New WordPress Site',
  $install_path = '/var/www/html',
  $db_name = 'wordpress',
  $db_user = 'wordpress',
  $db_pass = 'wordpress',
  $db_host = 'localhost',
  $admin_user = 'wordpress',
  $admin_pw = 'wordpress',
  $data = 'skip',
  $multisite = false,
  $extraphp = false,
 ){

  require wp::cli
  require mysql
  # require apache

  # Set up the docroot
  if !defined(File[$install_path]){
    file { $install_path:
      ensure		=> "directory",
      mode		=> "0775",
      owner		=> "apache",
      group 		=> "apache",;
    }
  }

  # Set up the vhost
  if !defined(Apache::Vhost[$wp_url]){
    apache::vhost { $wp_url:
      docroot		=> $install_path,
      template	=> "apache/vhost.conf.erb",;
    }
  }

  # Set up the DB
  if !defined( Mysql::Grant[$db_name] ) {
    mysql::grant { $db_name:
      mysql_password   => $db_pass,
      mysql_db         => $db_name,
      mysql_user       => $db_user,
      mysql_host       => $db_host,
    }
  }
  # Set up the install directory
  wp::download { $install_path: }
  # Set up the config file
  wp::config { $install_path:
    dbname		=> $db_name,
    dbuser	 	=> $db_user,
    dbpass		=> $db_pass,
    dbhost		=> $db_host,
    extraphp		=> $extraphp,
    require		=> Wp::Download[$install_path],
  }

  # Perform the install
  wp::site { $install_path:
    url				=> "$wp_url",
    sitename		=> "$wp_name",
    network			=> "$multisite",
    admin_user 		=> "$admin_user",
    admin_password	=> "$admin_pw",
    require			=> [ Wp::Config[$install_path], Mysql::Grant[$db_name], ],

  }
  # Install the standard plugin roster
  wp::plugin {
#		[ "developer", "theme-check", "monster-widget", "debogger", "log-deprecated-notices",
#		"debug-bar" ]:
    "${install_path} Developer":
      slug		=> "developer",
      ensure		=> "disabled",
      location	=> "$install_path",
      require		=> Wp::Site[$install_path];
    "${install_path} Theme Check":
      slug		=> "theme-check",
      location	=> "$install_path",
      require		=> Wp::Site[$install_path];
    "${install_path} Monster Widget":
      slug		=> "monster-widget",
      location	=> "$install_path",
      require		=> Wp::Site[$install_path];
    "${install_path} Debogger":
      slug		=> "debogger",
      location	=> "$install_path",
      require		=> Wp::Site[$install_path];
    "${install_path} Log Deprecated Notices":
      slug		=> "log-deprecated-notices",
      location	=> "$install_path",
      require		=> Wp::Site[$install_path];
    "${install_path} Debug Bar":
      slug		=> "debug-bar",
      location	=> "$install_path",
      require		=> Wp::Site[$install_path];

  }
  # Symlink in the synced directory so that we can easily put theme review files in place
  file { "${install_path}/wp-content/themes/trt-themes":
    ensure	=> link,
    target	=> "/mnt/trt_data/themes",
    require	=> Wp::Site[$install_path],
  }

  # wp::theme {
  # 	#[ "twentyeleven", "twentyten" ]:
  # 	# "${install_path} Twenty Eleven":
  # 	"twentyeleven":
  # 		# slug		=> "twentyeleven",
  # 		location	=> "$install_path",
  # 		ensure		=> "installed",
  # 		require		=> Wp::Site[$install_path];
  # 	# "${install_path} Twenty Ten":
  # 	"twentyten":
  # 		# slug		=> "twentyten",
  # 		location	=> "$install_path",
  # 		ensure		=> "installed",
  # 		require		=> Wp::Site[$install_path];
  # }
}
