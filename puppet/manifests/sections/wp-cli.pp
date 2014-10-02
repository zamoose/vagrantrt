$install_path = '/usr/share/wp-cli'

class { 'wp':
	user 	=> 'nginx',
}

class { 'wp::cli':
	ensure 			=> installed,
	install_path 	=> $install_path,
}

# Some extra commands that prove useful
file { '/usr/share/wp-cli/commands':
	ensure	=> "directory",
	mode		=> "0755",
}

vcsrepo {
	'/usr/share/wp-cli/commands/dictator':
		ensure	=> 'present',
		provider	=> 'git',
		source	=> 'https://github.com/danielbachhuber/dictator.git';

	'/usr/share/wp-cli/commands/theme-test':
		ensure	=> 'present',
		provider	=> 'git',
		source	=> 'https://github.com/pixline/wp-cli-theme-test-command.git';
}

# Add contributed commands to the default setup
file { '/home/vagrant/.wp-cli':
	ensure	=> 'directory',
	mode	=> '0751',
	owner	=> 'vagrant',
	group 	=> 'vagrant',
}

file { '/root/.wp-cli':
	ensure	=> 'directory',
	mode	=> '0751',
	owner	=> 'root',
	group 	=> 'root',
}

file { '/var/cache/nginx/.wp-cli':
	ensure	=> 'directory',
	mode	=> '0751',
	owner	=> 'nginx',
	group 	=> 'nginx',
}

file { '/home/vagrant/.wp-cli/config.yml':
	ensure	=> 'file',
	mode	=> '0644',
	content	=> template('wp-cli/config.yml'),
	owner	=> 'vagrant',
	group 	=> 'vagrant',
	require	=> File['/home/vagrant/.wp-cli'],
}

file { '/root/.wp-cli/config.yml':
	ensure	=> 'file',
	mode	=> '0644',
	content	=> template('wp-cli/config.yml'),
	owner	=> 'root',
	group 	=> 'root',
	require	=> File['/root/.wp-cli'],
}

file { '/var/cache/nginx/.wp-cli/config.yml':
	ensure	=> 'file',
	mode	=> '0644',
	content	=> template('wp-cli/config.yml'),
	owner	=> 'nginx',
	group 	=> 'nginx',
	require	=> File['/var/cache/nginx/.wp-cli'],
}
