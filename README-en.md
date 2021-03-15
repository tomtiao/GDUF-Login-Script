# Scripts to Log In GDUF Network

[中文](README.md)

**The problems that need to be solved go beyond the original purpose of making the script.**

**Alternatively, try [Auto-Login GDUF](https://gist.github.com/tomtiao/dbc45d20b6293e1292befca8f4a82b1c) with TamperMonkey**

**This repo has been archived.**

Save your valuable time by log in the GDUF network with a single click (sort of) on the script.

## Features

- Instantly log in the GDUF network without a browser

## System Requirements

### Windows

Only tested the PowerShell script on PowerShell 5.1, which is preinstalled on Windows 10 1607 and newer.

- [Windows Management Framework 5.1](https://aka.ms/wmf5download) may be required if the script is running on an older version of Windows.

**Do not** use Shell script in Windows.

### Unix-Like (including macOS and some routers)

Only tested the Shell script on Bash in Ubuntu, Padavan and macOS.

- The script for Linux may need modification according to the output of ```ifconfig``` command, or it might not work.

- The script for macOS should be working out of the box.

- Auto-logon and auto-reconnect on disconnection are possible with the help of built-in auto script execution feature in some routers.

## Usage

### On Windows

1. Get the scripts

2. Open the script with your favored editor

3. Change the name of the adapter, username and password according to the comments

4. Save and right-click on the script and choose "Run with PowerShell"

### On Unix-Like system

- Linux

  - Do it yourself

- macOS

  1. Get the scripts

  2. Open the script with your favored editor

  3. Change the name of the adapter, username and password according to the comments

  4. Save and enter ```chmod +x <script directory>``` in the terminal to make the scripts executable

  5. Enter ```<script directory>``` to execute

- Routers Running Padavan

  1. Launch the SSH server if haven't

  2. Connect to the router

  3. Upload or copy-paste the script into the router

  4. Enter ```chmod +x <script directory>``` in the terminal to make the scripts executable

  5. Enter ```<script directory>``` to execute

  6. (Optional) Add the script to run automatically at startup of the router if you want auto-logon

  7. (Optional) Add the script to the Crontab if you want auto-reconnect on disconnection

      - Execute the script every 5 minutes: ```*/5 * * * * <script directory>```

      - Check [this interactive environment](https://crontab.guru/) to learn more about Crontab syntax

- Other Routers

  - Do it yourself

## Contributing or Feedback

- Use [Discussions](https://github.com/tomtiao/GDUF-Login-Script/discussions) for help on how to use.

- Use [Issues](https://github.com/tomtiao/GDUF-Login-Script/issues) if you find a bug or want to contribute.
