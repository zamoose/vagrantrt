service {
	'iptables':
		ensure		=> 'stopped',
		enable		=> 'false';
	'nginx':
		ensure		=> 'running',
		enable		=> 'true';
	'php54-php-fpm':
		ensure		=> 'running',
		enable		=> 'true';
}

Package <| |> -> Service <| |>
