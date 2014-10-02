# Grab the list of repositories from Hiera
$repos = hiera_array("repositories")
# Grab the list of packages from Hiera
$packages = hiera_array("os-packages")

# alert($repos)
# alert($packages)

# Set up yum repositories
class { 'yum':
	extrarepo	=> $repos,
}

# Install package roster
package { $packages:
	ensure		=> "latest",
	provider	=> "yum",
}

# Require that all Yum repositories have been
# enabled before trying to add any packages
Yumrepo <| |> -> Package <| |>
