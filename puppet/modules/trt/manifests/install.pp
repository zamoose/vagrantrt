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
  $extraphp = false
 ) {

  require wp::cli
  require mysql

  $plugin_list = hiera_array("plugins")
  $theme_list = hiera_array("themes")
  $vhost_name = $wp_url

  # Set up the docroot
  if !defined(File[$install_path]){
    file { $install_path:
      ensure		=> "directory",
      mode		=> "0775",
      owner		=> "nginx",
      group 		=> "nginx",
      require   => Package['nginx'],
    }
  }

  # Set up the Nginx vhost
  file { "/etc/nginx/conf.d/$wp_url.conf":
      content   => template('nginx/vhost.conf.erb'),
      owner     => 'root',
      group     => 'root',
      mode      => '0644',
      require   => Package['nginx'],
      notify    => Service['nginx'],
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
    extraphp	=> $extraphp,
    require		=> [Wp::Download[$install_path], Mysql::Grant[$db_name], ],
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
  $plugin_list.each |$plugin| {
    wp::plugin { "${install_path} ${plugin}":
      slug  => $plugin,
      location  => $install_path,
      require  => Wp::Site[$install_path],
    }
  }

  # Install the standard themes roster
  $theme_list.each |$theme| {
    wp::theme { "${install_path} ${theme}":
      slug  => $theme,
      ensure    => "installed",
      location  => $install_path,
      require  => Wp::Site[$install_path],
    }
  }

  wp::command { "$install_path theme-test install $data":
    location    => "${install_path}",
    command     => "theme-test install --data=$data --plugin=skip --option=skip --require=/usr/share/wp-cli/commands/theme-test/wp-cli-theme-test-command.php"
  }

  # Symlink in the synced directory so that we can easily put theme review files in place
  file { "${install_path}/wp-content/themes/trt-themes":
    ensure	=> link,
    target	=> "/mnt/trt_data/themes",
    require	=> Wp::Site[$install_path],
  }
}
