# Bluespec System Verilog
The repository contains details of Bluespec Verilog (BSV), beginning from the installation process to various combination and sequential circuit implementations, as well as reference materials.

## Installation of Bluespec Simulator in Ubuntu
1. Install the latest Bluespec Compiler (BSC) version here [BSC](https://github.com/B-Lang-org/bsc/releases). 
2. Move the setup file to `/opt` in the Ubuntu drive using the command `sudo mv filename /opt`.
3. Unpack the `tar.gz` file using the command `sudo tar -xvzf filename`.
4. Open the folder with the same filename as the `tar.gz`. Open the `README` document and follow the steps.
5. These scripts should be executed only after placing the directory under any one of the following location `/opt`, `${HOME}/`, `/usr/share`. In this case, the directory is placed in `/opt`. Create a directory named tools, and place the bsc inside it using the command `sudo mkdir -p /opt/tools/bsc`.
6. Then move the file to the location `/opt/tools/bsc/filename` using the command `sudo mv filename /opt/tools/bsc/filename`.
7. The open the directory using `cd /opt/tools/bsc` and create a symbolic link using the command `sudo ln -s filename latest`.
## Creating a PATH Permanently
The directory contains a `bin` subdirectory, where the executables for the tools are found. To use the tools, just add that directory to the `PATH`: `export PATH="/opt/tools/bsc/latest/bin:$PATH"`.
To add the PATH permanently, follow the following steps.
1. Initially, use the following command to see all the added PATHS `echo $PATH`.
2. Then, open the bash prompt using the following command `gedit ~/.bashrc`. Here the text editor, I use is `gedit`, the user can use `vim` or `nano`.
3. Scroll to the bottom of the page, add the path `export PATH="/opt/tools/bsc/latest/bin:$PATH"`. Save and exit the bash prompt.
4. To check whether the PATH has been added correctly, again use the command `echo $PATH`. If it added successfuly, `/opt/tools/bsc/latest/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin` will be displayed.
5. Once the PATH is added, to check type `bsc`. Setup of the Bluespec compiler is done. Time to run 'Hello World'.





