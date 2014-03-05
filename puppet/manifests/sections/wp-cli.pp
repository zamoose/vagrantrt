$install_path = '/usr/share/wp-cli'

class { wp::cli:
	ensure 			=> installed,
	install_path 	=> $install_path,
	version 		=> '0.14.0',
} -> exec { 'wp package index':
	environment	=> "COMPOSER_HOME=$install_path",
	command	=> "$install_path/composer.phar config repositories.wp-cli composer http://wp-cli.org/package-index/",
	cwd		=> $install_path,
} -> exec{'wp theme-test installation':
	environment	=> "COMPOSER_HOME=$install_path",
	command	=> "$install_path/composer.phar require pixline/wp-cli-theme-test-command=dev-master",
	cwd		=> $install_path,
}