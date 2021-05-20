# Pistorm Optimization

The goal of these scripts is to cleanup a bit the Raspbian OS automatically and make the root partition read-only so that you can power off the Amiga without worrying about SD card corruption. This will also make Pistorm emulator to start the earliest possible.
The Raspberry Pi will be reconfigured to start faster and use the full speed of the SD card.

# Prerequisite

You must partition your SD card. You can use GParted on Linux, a GParted live on an USB pen or the partition tool from Paragon if you use Windows.
You have to shrink the root partition to something like 3.5GB, and create another primary partition using the remaining space.
![Partitions](https://user-images.githubusercontent.com/28825/118687251-1618bf80-b805-11eb-9142-072d5efb29bd.png)

# What these scripts are doing

* 01-Cleanup.sh will make other .sh files executable and do some cleanup on Raspbian OS by removing unnecessary services. It will also change the Raspberry Pi settings.
* 02-Edit-Fstab.sh will only opens the nano editor, please read the below explanation before running it and learn how to modify the fstab file.
* 03-Complete-RO.sh will do the necessary actions to prepare the system to use a read-only root filesystem.
* 04-Move-emulator.sh will move the pistorm emulator you previously installed in /home/pi/pistorm to the new partition and will install it as a service to be run as soon as the OS permit.

# Usage 

Begin by pulling this repository, do this by entering the following command:

`git clone https://github.com/Neo2003/PistormOptimization.git`

Change directory to be inside the new folder:

`cd PistormOptimization`

Make the first file executable:

`chmod +x 01-Cleanup.sh`

Then execute it with sudo:

`sudo ./01-Cleanup.sh`

Before executing 02-Edit-Fstab.sh, read above

You will need to add a line in fstab, for this copy the line with "/    ext4" and past it just below, then change "-02" to "-03" and complete the line like on the following picture.


![Fstab1](https://user-images.githubusercontent.com/28825/118681842-32662d80-b800-11eb-8fd6-ba336a1b81d2.png)

Now, make the root and boot partition read-only by adding ',ro' in the parameters:

![Fstab3](https://user-images.githubusercontent.com/28825/118725685-8db01400-b830-11eb-9024-615a7491c24c.png)

Run 02-Edit-Fstab.sh to make these listed changes to the fstab:

`sudo ./02-Edit-Fstab.sh`

Once done, you can go on with the rest of the script files:

`sudo ./03-Complete-RO.sh`

`sudo ./04-Move-emulator.sh`

This last one will move the emulator to the new /mnt/Amiga we just configured and will create a service to start it.

# Safe guards

In order to allow temporary root filesystem write access, files /etc/bash.bashrc and /etc/bash.bash_logout have been updated.

After the reboot, you will be able to execute `rw` to get write access and `ro` to lock it again in read-only mode.

# End

Now that everything is properly setup, reboot and be happy with a fast startup and a safe system.

`sudo reboot`

# Author

Made by Rodrik Studio

Youtube channel: https://www.youtube.com/c/RodrikStudio
