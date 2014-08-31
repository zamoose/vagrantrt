$utpath = '/var/www/unittest.dev'
$wptpath = '/var/www/wptest.dev'
$mtpath = '/var/www/multitest.dev'

$sites = hiera_hash('sites')

create_resources( 'trt::install', $sites )
