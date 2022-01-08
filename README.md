vboot-update
============

A simple script to integrate depthcharge (and its vboot library) with
Linux distributions.

Introduction
------------

Depthcharge is a bootloader designed for production devices running
ChromeOS. Given its role in securing Chromebooks, depthcharge has a
focused minimalist design without unwanted frippery such as convenient
distro integration!

Perhaps the ideal way to add distro support is to have depthcharge load
a more powerful bootloader such as u-boot or Linuxboot (or at least a
custom kernel and the u-root userspace that Linuxboot uses). This idea
is not mine and it even appears in the [Chromium OS documentation](https://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/custom-firmware).

Chainloading something more powerful would be awesome, and would even
be EBBR compliant and therefore able to boot generic distros. However
it would also be a good chunk of work... so in the mean time I present
vboot-update: cheap, cheerful but (almost) certainly better than
nothing!

vboot-update integrates with Debian-style kernel postinst/postrm scripts
to allow a bootable partition to be automatically updated when a new
kernel is installed. This will be entirely rainbows and unicorns if the
new kernel boots correctly. However currently vboot-update doesn't used
the partition flags to provide any safety net. If the new kernel does
not boot then it is necessary to boot from alternative media in order to
fix things.

Quickstart
----------

1. `apt install lz4 vboot-utils u-boot-tools`
2. `make install`
3. Edit `/etc/default/vboot` as needed. Use the contents of `examples/`
   to help with this.
4. Install a .deb packaged kernel (or use `make install` from the Linux
   build system to install one). vboot-update will always select the
   kernel with the highest version number.

License
-------

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but **without any warranty**; without even the implied warranty of
**merchantability** or **fitness for a particular purpose**.  See
the GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Credits
-------

`vboot-update` reuses several chunks of code from `u-boot-menu` by
Riku Voipio (and before that by Daniel Baumann).

TODO
----

 * [ ] Add support for VBOOT_VERSION so we can override the enabled kernel.
 * [ ] Add backup support (to make it easy to restore bootability)
 * [ ] Add initrd support
 * [ ] Investigate whether we can use boot-once flags and systemd services
   to allow automatic recovery after installing a non-booting kernel.

