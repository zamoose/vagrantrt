service {
	"iptables":
		ensure		=> "stopped",
		enable		=> "false";
	"php-fpm":
		ensure		=> "running",
		enable		=> "true",
		require		=> Package['php-fpm'];
}