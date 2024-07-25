# Bluespec System Verilog (BSV)
This report contains the installation procedure to setup the Bluespec Compiler (BSC) on Ubuntu 24.04. The latest version of the Ubuntu Linux Distribution can be installed from here [Download Ubuntu Desktop | Ubuntu](https://ubuntu.com/download/desktop)

# 1. Installation
## 1.1. Installing the Bluespec Compiler (BSC)
Install the tape archive (TAR) of the Bluespec Compiler (BSC) here [GitHub | BSC | Releases](https://github.com/B-Lang-org/bsc/releases) 

Save the download in any one of the following locations: `/opt`, `${HOME}/` or `/usr/share`. If the file is downloaded to other locations, use the following command to move it to the suggested folders: 
```sh
sudo mv filename /opt
```

Unpack the archive using the command: 
```sh
sudo tar -xvzf filename
```

Further installation instructions to add the path can be found in the `README.txt`. The same is explained here, create a directory named `tools` using the command: 
```sh
sudo mkdir -p /opt/tools/bsc
``` 

Move the unpacked `BSC` file inside the directory using the command: 
```sh
sudo mv filename /opt/tools/bsc/filename
```

Navigate to the directory in the terminal using the command: 
```sh
cd /opt/tools/bsc
``` 

Create a symbolic link using the command: 
```sh
sudo ln -s filename latest
```

## 1.2. Adding the Path
To add the `bin` subdirectory to the `PATH` open the configuration file for the Bash shell environment using the command: 
```sh
gedit ~/. bashrc
```
Any one of the following text editor of choice can be used `vim` and `nano`

At the bottom of the configuration file, add the following path: 
```sh
export PATH="/opt/tools/bsc/latest/bin:$PATH"
``` 
Save and exit.

## 1.3. Installation Check
To check whether the `PATH` has been added correctly, use the command 
```sh
echo $PATH
```

Successful inclusion of the path will prompt the following output in the terminal window 
```sh
/opt/tools/bsc/latest/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin
```
|![image](https://github.com/user-attachments/assets/f29dcacb-604c-46a0-b636-43e727208b9a)|
|:-:|
|_Figure 1. Successful Installation_ |

# Reference
For futher information, visit [Bluespec Compiler](https://github.com/B-Lang-org/bsc)







