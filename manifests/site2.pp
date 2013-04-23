

node /^node2/ {

include sources::persistent2

exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

		#ensure git is installed
	package { 'git':
		ensure 		=> 'present',
	}

	#ensure yum is installed
	package { 'yum':
		ensure 		=> 'present',
	}

	#ensure vim is installed
	package { 'vim':
		ensure 		=> 'present',
	}

        #ensure sshpass is installed
	package { 'sshpass':
		ensure 		=> 'present',
	}

	#ensure drbd8-utils is installed
	package { 'drbd8-utils':
		ensure 		=> 'present',
	}

        #ensure apache2 is installed
	package { 'apache2':
		ensure 		=> 'present',
	}

        #ensure xfsprogs is installed
	package { 'xfsprogs':
		ensure 		=> 'present',
	}

        #ensure heartbeat is installed
	package { 'heartbeat':
		ensure 		=> 'present',
	}

        #ensure corosync is installed
	package { 'corosync':
		ensure 		=> 'present',
	}

        #ensure pacemaker is installed
	package { 'pacemaker':
		ensure 		=> 'present',
	}


	#ensure cman is installed
	package { 'cman':
		ensure 		=> 'present',
	}

exec { "hosts-update1":
    command => "/bin/echo '192.168.1.12    node2 node2 precise64' >> /etc/hosts"
}

exec { "hosts-update2":
    command => "/bin/echo '10.1.1.31       node1 node1 precise64' >> /etc/hosts"
}

exec { "hosts-update3":
    command => "/bin/echo '10.1.1.32       node2 node2 precise64' >> /etc/hosts"
}

Exec["hosts-update1"] -> Exec["hosts-update2"] -> Exec["hosts-update3"]



}
