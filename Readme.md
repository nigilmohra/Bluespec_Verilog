# Bluespec System Verilog (BSV)
This repository contains the installation procedure to setup the Bluespec Compiler (BSC) on Ubuntu 24.04. The latest version of the Ubuntu Linux Distribution can be installed from here [Download Ubuntu Desktop | Ubuntu](https://ubuntu.com/download/desktop). This repository is work in progress.

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
sudo gedit ~/.bashrc
```
Any one of the following text editor of choice can be used `vim` and `nano`

At the bottom of the configuration file, add the following path: 
```sh
export PATH="/opt/tools/bsc/latest/bin:$PATH"
``` 
Save and exit the text editor. Use the command to restart.
```sh
reboot
```

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

# 2. Simulation
It has been customary to start with a very simple example to introduce the working of any language. So, the first example program that is used to explain the flow of the BSC is a simple 'Hello World!' program.

## 2.1. BSV Program
Save the file as `Testbench.bsv`.
```verilog
module mkTestbench (Empty);

   rule rl_print_answer;
      $display ("Deep Thought says: Hello, World! The answer is 42.");
      $finish;
   endrule
endmodule
```

## 2.2. Compiling and Running
There are multiples methods to compile and run the BSV file. Here is the one of many methods to run and verify the design.

### 2.1.1. Creating the Directories
Put the `.bsv` file in a directory called `src/`. From outside `src/`, run the following shell commands. 
```sh
mkdir -p .bscdir
mkdir -p vlog
```
The `mkdir -p .bscdir` creates a directory named `.bscdir` in the current working directory. The `-p` option ensures that intermediate directories are created if they do not exist already. If `.bscdir` exists, `mkdir` will not raise an error or overwrite it.

The `mkdir -p vlog` creates a directory named `vlog` in the current working directory. Similar to the first command, `-p` ensures that vlog is created even if parent directories leading up to `vlog` do not exist. This is run only at the initial setup phase.

### 2.2.2. Running the BSV Program
Run the following to compile and elaborate the design
```sh
bsc -u -p "src:%/Libraries" -keep-fires -aggressive-conditions -show-schedule -show-range-conflict +RTS -K100M -RTS -bdir .bscdir -simdir .bscdir -info-dir .bscdir -vdir vlog -steps 10000000 -sim -g mkTestbench -o temp src/Testbench.bsv
```
**_To keep this succint explanations of the shell scripts are avoided. But the explanation of the shell command can be found on ChatGPT, just copy and paste._**

Finally to generate the binary file for simulation, run the following script
```sh
bsc -e mkTestbench -o mkTestbench_bsim +RTS -K100M -RTS -bdir .bscdir -simdir .bscdir -info-dir .bscdir -vdir vlog -sim -keep-fires
```

To execute the binary for simulation run
```sh
./mkTestbench_bsim -V
```

The `-V` tells Bluesim simulation to dump waveforms from the circuit into `dump.vcd` file. Verilog simulators also have commands to capture VCDs. **This program does not have any waveform, so run without `-V`.**

## 2.3. Result
|![image](https://github.com/user-attachments/assets/95e2acd4-3b8f-413d-b2a1-01f362f93ec6)|
|:-:|
|_Figure 2. Hello World !_|

## 2.4. Converting BSV Design to Verilog
A BSV design can be converted to Verilog using the command:
```sh
bsc -verilog -g mkTestbench Testbench.bsv
```

Note that the waveforms from both Bluesim and Verilog simulation will be the same.

# Reference
For futher information, visit [Bluespec Compiler](https://github.com/B-Lang-org/bsc)







