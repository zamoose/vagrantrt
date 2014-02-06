$install_path = '/usr/share/wp-cli'

class { wp::cli:
	ensure => installed,
	install_path => $install_path,
	version => '0.13',
}

exec { 'wp package index':
	command	=> "$install_path/composer.phar config repositories.wp-cli composer http://wp-cli.org/package-index/",
	cwd		=> $install_path,
}

exec{'wp theme-test installation':
	command	=> "$install_path/composer.phar require pixline/wp-cli-theme-test-command=dev-master",
	cwd		=> $install_path,
	require	=> Exec['wp package index'],
}