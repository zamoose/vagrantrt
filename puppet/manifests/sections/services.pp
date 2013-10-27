# service { "httpd":
# 	ensure		=> "running",
# 	enable		=> "true",
# }

# service { "mysqld":
# 	ensure		=> "running",
# 	enable		=> "true",
# }

service { "iptables":
	ensure		=> "stopped",
	enable		=> "false",
}