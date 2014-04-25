class { "apache": }

# Ensure the docroots exist
# file {
# 	"/var/www/unittest.dev":
# 		ensure		=> "directory",
# 		mode		=> "0775",
# 		owner		=> "apache",
# 		group 		=> "apache",;
#
# 	"/var/www/wptest.dev":
# 		ensure		=> "directory",
# 		mode		=> "0775",
# 		owner		=> "apache",
# 		group 		=> "apache",;
#
# 	"/var/www/multitest.dev":
# 		ensure		=> "directory",
# 		mode		=> "0775",
# 		owner		=> "apache",
# 		group 		=> "apache",;
#
# 	"/var/www/puppettest.dev":
# 		ensure		=> "directory",
# 		mode		=> "0775",
# 		owner		=> "apache",
# 		group 		=> "apache",;
#
# }

# apache::vhost {
# 	"unittest.dev":
# 	docroot		=> "/var/www/unittest.dev",
# 	template	=> "apache/vhost.conf.erb",;
#
# 	"wptest.dev":
# 	docroot		=> "/var/www/wptest.dev",
# 	template	=> "apache/vhost.conf.erb",;
#
# 	"multitest.dev":
# 	docroot		=> "/var/www/multitest.dev",
# 	template	=> "apache/vhost.conf.erb",;
#
# 	"puppettest.dev":
# 	docroot		=> "/var/www/puppettest.dev",
# 	template	=> "apache/vhost.conf.erb",;
#
# }
