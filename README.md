# Pistorm Optimization

The goal is to cleanup a bit the Raspbian OS and make the root partition read-only, but also start the Pistomr emulator the earliest possible.

# Prerequisite

You must partition the SD card. You can use GParted on Linux, a GParted live on USB pen if you use Windows or the partition tool from Paragon.
You have to shrink the root partition to something like 3.5GB, and create another primary partition after the root one using the remaining space.

# What these scripts are doing

* 01-Cleanup.sh will make other .sh file executable and do some cleanup on Raspbian OS by removing unnecessary services.
* 02-Edit-Fstab.sh will only open the editor, please read bellow before running it to learn how to modify the fstab.
* 03-Complete-RO.sh will do the necessary actions to prepare the system to use a read-only root filesystem.
* 04-Move-emulator.sh will move the pistorm emulator you previously installed in /home/pi/pistorm to the new partition and will install it as a service to be run as soon as the OS permit.

# What is left to be done manualy (to be completed)

* /boot/confit.txt
* /boot/cmdline.txt

# Usage 

To begin, you will need to pull this repository, do this by entering the following command:

`git clone https://github.com/Neo2003/PistormOptimization.git`

Then make the first file executable:

`chmod +x 01-Cleanup.sh`

Then execute it with sudo:

`sudo ./01-Cleanup.sh`

Before running 02-Edit-Fstab.sh, read above

You will need to add a line in fstab, for this copy the line with "/  ext4" and past it above, then change "-02" by "-03" and complete the line like on the picture bellow.


![Fstab1](https://user-images.githubusercontent.com/28825/118681842-32662d80-b800-11eb-8fd6-ba336a1b81d2.png)

Then you will need to add the following line at the end of the file:

`tmpfs        /tmp            tmpfs   nosuid,nodev         0       0`

`tmpfs        /var/log        tmpfs   nosuid,nodev         0       0`

`tmpfs        /var/tmp        tmpfs   nosuid,nodev         0       0`

See the above picture to see the result

![Fstab2](https://user-images.githubusercontent.com/28825/118681869-385c0e80-b800-11eb-99e3-338dfa8313d8.png)
