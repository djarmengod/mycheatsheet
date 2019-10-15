
## namespace related
### lsns
	lsns lists information about all the currently accessible namespaces or about the given namespace.  The namespace identifier is an inode number. If you have util-linux v2.28 or above you can use lsns



## systemd related:
```
systemctl enable, systemctl disable: marks (unmarks) the unit for autostart at boot time (in a unit-specific manner, described in its [Install] section);

systemctl mask, systemctl unmask: disallows (allows) all and any attempts to start the unit in question (either manually or as a dependency of any other unit, including the dependencies of the default boot target). Note that marking for autostart in systemd is implemented by adding an artificial dependency from the default boot target to the unit in question, so "mask" also disallows autostarting.
```

## netfilter related

## dev/null
The /dev/null file is a special system device file that discards anything and everything written to it, and when used as the input file, returns End Of File immediately.


## Popular Linux Distros
1. Fedora --> RHEL --> CentOS, Oracle Linux
2. Debian --> ubuntu, BOSS (Bharat Operating System Solutions)
3. OpenSUSE --> SUSE Linux Enterprise
4. ChromeOS --> Based on Chromium OS that only runs on Chromebooks, Chromeboxes and tablet computers.

## Package Format:
1. Fedora and its derivativesSUSE and its derivatives - rpm (Red Hat Package Manager /etc/yum and /etc/yum.repos.d)
2. Debian and its derivatives - deb (Advanced Package Tool - /etc/apt)
3. SUSE and its derivatives - rpm (Red Hat Package Manager /etc/yum and /etc/yum.repos.d)

## Package Management Clients:
1. Fedora and its derivatives - RPMS - yum (Yellowdog Updater, Modified)
2. Debian and its derivatives - APTs - apt-get
3. Suse and its derivatives - RPMs - zypper
