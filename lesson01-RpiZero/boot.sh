sudo qemu-system-arm \
-bios ./kernel.img \
-cpu arm1176 -m 256 \
-M versatilepb \
-no-reboot \
-serial stdio 
