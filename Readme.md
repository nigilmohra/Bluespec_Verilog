# Installation of Bluespec Compiler (BSC)
This report contains the installation procedure to setup the Bluespec Compiler (BSC) on Ubuntu 24.04. The latest version of the Ubuntu Linux Distribution can be installed from here [Download Ubuntu Desktop | Ubuntu](https://ubuntu.com/download/desktop)

## Steps

-[-] Install the tape archive (TAR) of the Bluespec Compiler (BSC) here [GitHub | BSC | Releases](https://github.com/B-Lang-org/bsc/releases) 

Save the download in any one of the following locations: `/opt`, `${HOME}/` or `/usr/share`. If the file is downloaded to other locations, use the following command to move it to the suggested folders: `sudo mv filename /opt`

Unpack the archive using the command: `sudo tar -xvzf filename`

Further installation instructions to add the path can be found in the `README.txt`

Create a directory named `tools` using the command: `sudo mkdir -p /opt/tools/bsc` 

Move the unpacked `BSC` file inside the directory using the command: `sudo mv filename /opt/tools/bsc/filename`

Navigate to the directory in the terminal using the command: `cd /opt/tools/bsc` and create a symbolic link using the command: `sudo ln -s filename latest`

To add the `bin` subdirectory to the `PATH` open the configuration file for the Bash shell environment using the command: `gedit ~/. bashrc`. Any one of the following text editor of choice can be used `vim` and `nano`

At the bottom of the configuration file, add the following path: `export PATH="/opt/tools/bsc/latest/bin:$PATH"`. Save and exit.

To check whether the `PATH` has been added correctly, use the command `echo $PATH`. Successful inclusion of the path will prompt the following output in the terminal window 
```
/opt/tools/bsc/latest/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin
```








