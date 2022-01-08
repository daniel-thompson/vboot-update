INSTALL = install
INSTALL_FLAGS = --owner=root --group=root

install :
	$(INSTALL) $(INSTALL_FLAGS) vboot-update /usr/bin/vboot-update
	$(INSTALL) $(INSTALL_FLAGS) vboot-update.postinst /etc/kernel/postinst.d/zz-vboot-menu
	$(INSTALL) $(INSTALL_FLAGS) vboot-update.postinst /etc/kernel/postrm.d/zz-vboot-menu
	[ ! -e /etc/default/vboot ] && $(INSTALL) $(INSTALL_FLAGS) vboot /dev/default/vboot
