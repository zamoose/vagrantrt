# Grab the list of repositories from Hiera
$repos = hiera_array("repositories")
# Grab the list of packages from Hiera
$packages = hiera_array("packages")

# Set up yum repositories
class { 'yum':
	extrarepo	=> $repos,
}

# Install package roster
package { $packages:
	ensure		=> "latest",
	provider	=> "yum",
}
