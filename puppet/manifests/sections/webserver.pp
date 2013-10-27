class { "apache": }

# Ensure the docroots exist
file { 
	"/var/www/unittest.dev":
		ensure		=> "directory",
		mode		=> "0775",
		owner		=> "apache",
		group 		=> "apache",;

	"/var/www/wptest.dev":
		ensure		=> "directory",
		mode		=> "0775",
		owner		=> "apache",
		group 		=> "apache",;
	
}

apache::vhost { 
	"unittest.dev":
	docroot		=> "/var/www/unittest.dev",
	template	=> "apache/vhost.conf.erb",;

	"wptest.dev":
	docroot		=> "/var/www/wptest.dev",
	template	=> "apache/vhost.conf.erb",;
}