# My super awesome Windows 10

![desktop](https://i.imgur.com/3Qf25H8.png)

# Applications

I use [BoxStarter](https://boxstarter.org/) in order to automate the installation of most of my applications. The process usually goes like this:

- Install BoxStarter with `. { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force`
- Run the BoxStarter script of this repo with `Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/NickSeagull/my-windows/master/boxstarter/System-Init.ps1 -DisableReboots`

The apps listed in this repo follow the following convention:

- ✅ The app is successfully automated with BoxStarter
- 👜 The app needs to be installed manually from the Windows store
- ⚠ The app needs to be installed manually from the Windows store

## Privacy

Yes, Windows 10 still is far behind MacOS regarding privacy. Luckily ShutUp10 exists:

**✅ [ShutUp10](https://www.oo-software.com/en/shutup10) - Privacy Issues fixer**

- ShutUp10 helps disabling all the harmful Windows privacy settings with just one click

![shutup10 screenshot](screenshots/shutup10.jpg)

## Productivity

**✅ [AutoHotKey](https://www.autohotkey.com/) - General automation**

- AHK provides a scripting language that allows you to automate most of the things in Windows. From remapping keys, to moving the mouse, you can automate everything.
- I have used AHK extensively in the past and I even created bots for online games with it (yes, I was THAT guy, but not always). You can imagine the power of this tool now.

**✅ [Todoist](https://todoist.com/) - Todo lists**

- I use Todoist because it has a nice Android app that comes with a shortcut to add to inbox.
- I'm slowly getting used to GTD, so Todoist is a nice addition for my workflow.

**✅ [Notion](https://www.notion.so/) - All organizer**

- Notion is a software masterpiece, it makes organization seem very simple
- Replaces a lot of tools like Evernote, Google Sheets, etc..
- I use it mainly to organize my personal stuff

![notion screenshot](screenshots/notion.png)

**⚠ [1password](https://1password.com/) - Password management**

- Having the same password for all the sites is a very bad practice. I learnt this once a friend's Steam account got hacked, and with it, his email, Facebook, and everything.
- Thanks to passwords managers like this one, I don't even need to remember my passwords.

**✅ [ManicTime](https://www.manictime.com/) - Time management**

- Time management is **extremely** important for me. Without it, I can get lost in some computer task for hours, without noticing. It helps me maintain my sanity by making sure that I don't overwork also, as I work remotely.
- I try to be as mindful as possible in my life, so having an app that helps me stay mindful with the computer is a plus.

![manictime screenshot](screenshots/manictime.png)

## Coding

**✅ [Visual Studio Code](https://code.visualstudio.com/) - My main code editor**

**✅ [Microsoft Terminal](https://www.microsoft.com/store/productId/9N0DX20HK701) - Terminal emulator**

**✅ [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) - Run Linux apps natively on Windows**

## Social

**👜 [Unigram](https://github.com/UnigramDev/Unigram) - A Telegram client optimized for Windows 10**

- The regular Telegram client has some issues with DPI scaling, meaning that if I move the window from my 1080p monitor to the Surface one, it'll stay with the same resolution. This doesn't happen with Unigram, and I get integrated notifications.

## Web browsing

**✅ [Brave](https://brave.com/)**

- Brave is a Chrome-compatible alternative, that is very fast and is focused on protecting your privacy.

### Brave extensions

**[Vimium](https://vimium.github.io/)**

**[1password](https://chrome.google.com/webstore/detail/1password-extension-deskt/aomjjhallfgjeglblehebfpbcfeobpgk)**

## Command Line Apps

I manage my command line tools using [Home Manager](https://github.com/rycee/home-manager)

**[`bat`](https://github.com/sharkdp/bat) - A cat(1) clone with wings**

**[`watchexec`](https://github.com/watchexec/watchexec) - Executes commands in response to file modifications**

## Operating System Extensions

**✅ [Link Shell Extension](http://schinagl.priv.at/nt/hardlinkshellext/linkshellextension.html#contact) - Context menu entry to create symlinks**

- Sometimes it is useful to create a symbolic link from a folder/file to another place. This is specially useful when dealing with configuration files that are checked in a version control system like Git.

# Preferences

## Set DNS to DNS.Watch

- Docker has issues with the default DNS provided with Windows 10, to set it to DNS.Watch's servers, [follow this guide](https://dns.watch/how-to-windows-7).
