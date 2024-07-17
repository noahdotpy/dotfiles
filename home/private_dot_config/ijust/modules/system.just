# vim: set ft=make :

configure-grub-password:
  #!/usr/bin/pkexec /usr/bin/bash
  grub2-setpassword
  grub2-mkconfig -o /boot/grub2/grub.cfg

remove-grub-password:
	#!/usr/bin/pkexec /usr/bin/bash
	rm /boot/grub2/user.cfg
