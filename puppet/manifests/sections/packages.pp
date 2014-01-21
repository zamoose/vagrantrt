package { "epel-release":
	ensure		=> "present",
	provider	=> "rpm",
	source		=> "http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm",
}

# package { "httpd":
# 	ensure		=> "latest",
# 	provider	=> "yum",
# }

# package { "mysql-server":
# 	ensure		=> "latest",
# 	provider	=> "yum",		
# }

package { "php":
	ensure		=> "latest",
	provider	=> "yum",	
}

package { "php-mysql":
	ensure		=> "latest",
	provider	=> "yum",
}


package { "git":
	ensure		=> "latest",
	provider	=> "yum",
}

package { "subversion":
	ensure		=> "latest",
	provider	=> "yum",
}

package { "mercurial":
	ensure		=> "latest",
	provider	=> "yum",
}