% Installation tips of the developer environment
================================================

Terminal keys and colors
========================

If you use PuTTY/MobaXterm/... on Windows to access your Linux VM, add in your `~/.bashrc` in order to use the [Numeric keypad](https://en.wikipedia.org/wiki/Numeric_keypad).

    export TERM=linux
    
Else you use a fast and recent X11 client (i.e. not Windows)

    export TERM=xterm-256color

    
Become a sudoer
===============

    su  # enter root password
    visudo

Append in the bottom

    yourlogin ALL=(ALL) NOPASSWD:ALL

or if you prefer having to enter your password:

    yourlogin ALL=(ALL) ALL


Install packages
================

    gcc-c++ git cmake boost-devel zlib-devel gtest-devel
    lcov gcovr           # Source-code coverage
    openssl-devel        # Often required by app dependencies
    clang                # Run static analyzer, formatter...
    ccache               # Reduce build time
    samba                # Access remote files from Windows
    doxygen graphviz     # Generate source-code doc
    bash-completion      # Optional
    man-pages            # man pages for kernel/glibc/...
    man-pages-fr         # Si pas comprendre Anglais
    gedit-plugins        # Display special characters with gedit


Enabling multicast reception
============================

If your machine uses the `firewalld` (you can verify with `firewall-cmd --state`),
you need to allow the multicast IPs:

    firewall-cmd --direct --add-rule ipv4 filter IN_public_allow 1 -d <ip> -j ACCEPT
    
`<ip>` is something like 227.23.1.31.



Access your remote files from your Windows desktop
==================================================

On remote GNU/Linux server

    # Install samba
    sudo apt install samba
    sudo dnf install samba

    # Ensure firewall allows service samba
    service firewalld status
    firewall-cmd --add-service=samba

    # Add you to the samba users database
    sudo pdbedit -a -u yourlogin # then enter password

    # Decide the folder(s) to shared
    # Do not share folder where your .ssh or other sensitive data is accessible
    chcon -Rt samba_share_t /home/user/public 
    
    # Run Samba deamon
    sudo service smb start
    service smb status

On Windows desktop:

* Check if you can access to your remote shared folder using `telnet <your-VM-hostname> 139` (if it connects the route is OK)  
  If you do not have `telnet` see if you can use [PowerShell](http://stackoverflow.com/a/35624189/938111)
* Access to your remote folder using `\\<hostname>`  
  (Attention: the hostname printed on remote machine by the commande `hostname` may be different from the `hostname` used from your Windows machine to access it)


Synchronize Password
====================

Linux-based VMs are not always configured to be automatically synchronised with LDAP server.
In order to have samba access from Windows to the Linux VM,
use the command `pdbedit` to enter the same password as the Windows one. 

    $ sudo bash
    # pdbedit -u <your-LDAP-login>
    <your-LDAP-login>:178793962:<your-full-name>
    # pdbedit -u laubert -a
    new password:
    retype new password:
    Unix username:        <your-LDAP-login>
    NT username:
    Account Flags:        [U          ]
    User SID:             S-1-5-21-1074701578-1924528054-4193204041-1000
    Primary Group SID:    S-1-5-21-1074701578-1924528054-4193204041-513
    Full Name:            <your-full-name>
    Home Directory:       \\<your-VM-hostname>\<your-LDAP-login>
    HomeDir Drive:
    Logon Script:
    Profile Path:         \\<your-VM-hostname>\<your-LDAP-login>\profile
    Domain:               <YOUR-DOMAIN>
    [...]


Configure Proxy
===============

On linux machines, an authentified proxy can be configure to access public ressources on internet.

```bash
sudo yum install cntlm
```

Edit `/etc/cntlm.conf` and add:

```
Username <your-LDAP-login>
Domain OAD
Proxy 172.26.96.40:8080
```

Execute the following command:

```bash
cntlm -u <your-LDAP-login>@<YOUR-DOMAIN> -c /etc/cntlm.conf -fHv 172.26.96.40:8080
```

It displays information including lines similar to those shown here (they are false hashes of course):

```
PassLM          F24088884CAA1525DE181A69088B6BC0
PassNT          E6C2328DE92875B434CAB1C4154C605A
PassNTLMv2      1538049C3DC73B6324C38D7B43E3D9BR
```

Paste those into `/etc/cntlm.conf`. Edit `/etc/sysconfig/cntlmd` and change the last line to:

```
OPTARGS="-c /etc/cntlm.conf"
```

Then execute the following commands:

```bash
sudo mkdir /var/run/cntlm
sudo chown cntlm: /var/run/cntlm
sudo systemctl daemon-reload
sudo systemctl enable cntlm
sudo systemctl start cntlm
sudo systemctl status cntlm
```

Then check if the proxy is correctly launched

```bash
sudo netstat -tlpn | grep 3128
```

You can also add in your `~/.bashrc`

```bash
export https_proxy=127.0.0.1:3128
export http_proxy=127.0.0.1:3128
```


Shortcuts
=========

Press a key in your terminal => Execute a command

Append in you `~/.bashrc` 

```bash
## Shortcuts
PrjRoot=${HOME}/folder/project
PrjOpts="-G Ninja"  # If ninja installed (else empty)

# F5 => Update
bind '"\e[15~":" ( cd \"${PrjRoot}\" && git pull && git submodule update --init --remote --rebase && git submodule foreach git stash list )\n"'

# F6 => Status
bind '"\e[17~":" ( cd \"${PrjRoot}\" && git status && git submodule status )\n"'

# F7 => Build
bind '"\e[18~":" ( mkdir -p \"${PrjRoot}\"/build && cd $_ && cmake .. $PrjOpts && cmake --build . )\n"'

# F8 => Test
bind '"\e[19~":" ctest -j6 --build \"${PrjRoot}\"/build \n"'

# Auto-complete the command line with a previous command starting with the same characters:
"\e[A": history-search-backward
"\e[B": history-search-forward
 
# Bind the [PageUp], [Start] (and 'PageDown], [End]) to move the cursor the start (end) of the command line
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-line
"\e[6~": end-of-line
 
# Bind [Alt][Left] and [Alt][Right] to go forward/backward one word (There *is* already a binding for that: [Alt][f] and [Alt][b])
"\e\e[C": forward-word
"\e\e[D": backward-word
 
# Auto-complete with a single press of 'tab' key instead of two
set show-all-if-ambiguous on
```
