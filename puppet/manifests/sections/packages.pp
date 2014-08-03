package { "epel-release":
	ensure		=> "present",
	provider	=> "rpm",
	source		=> "http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm",
}

package { [ "php", "php-mbstring", "php-mysql", "git", "subversion", "mercurial" ]:
	ensure		=> "latest",
	provider	=> "yum",
}
