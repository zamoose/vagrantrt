class { "mysql":
	root_password	=> "blank",
}

mysql::grant { 'wordpress':
	mysql_privileges => 'ALL',
	mysql_password   => 'wordpress',
	mysql_db         => 'wordpress',
	mysql_user       => 'wordpress',
	mysql_host       => 'localhost',
}

mysql::grant { 'wordpress1':
	mysql_privileges => 'ALL',
	mysql_password   => 'wordpress2',
	mysql_db         => 'wordpress2',
	mysql_user       => 'wordpress2',
	mysql_host       => 'localhost',
}
