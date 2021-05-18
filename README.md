# Pistorm Optimization

The goal is to cleanup a bit the Raspbian OS and make the root partition read-only so that you can power off the Amiga without worrying about the SD corruption, but also start the Pistorm emulator the earliest possible.

# DONT'T USE IT YET, IT'S IN PROGRESS

# Prerequisite

You must partition the SD card. You can use GParted on Linux, a GParted live on USB pen if you use Windows or the partition tool from Paragon.
You have to shrink the root partition to something like 3.5GB, and create another primary partition after the root one using the remaining space.
![Partitions](https://user-images.githubusercontent.com/28825/118687251-1618bf80-b805-11eb-9142-072d5efb29bd.png)

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

Then you will need to add the following lines at the end of the file:

`tmpfs        /tmp            tmpfs   nosuid,nodev         0       0`

`tmpfs        /var/log        tmpfs   nosuid,nodev         0       0`

`tmpfs        /var/tmp        tmpfs   nosuid,nodev         0       0`

See the above picture to see the result

![Fstab2](https://user-images.githubusercontent.com/28825/118681869-385c0e80-b800-11eb-99e3-338dfa8313d8.png)

Now run 02-Edit-Fstab.sh to make these changes listed before to the fstab:

`sudo ./02-Edit-Fstab.sh`

Once done, you can go on with the rest of the files:

`sudo ./03-Complete-RO.sh`

`sudo ./04-Move-emulator.sh`

This last one will move the emulator to /mnt/Amiga we declared in fstab and create a service to start it.

Now that everything is done, reboot and be happy with a fast startup and a safe system.

`sudo reboot`
