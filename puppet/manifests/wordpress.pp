$sites = hiera_hash('sites')

create_resources( 'trt::install', $sites )
