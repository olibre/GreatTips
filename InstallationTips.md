Developer Environment Installation Guidelines
==============================================

Terminal keys and colors
------------------------

If you use PuTTY/MobaXterm/... on Windows to access your Linux VM, add in your `~/.bashrc` in order to use the [Numeric keypad](https://en.wikipedia.org/wiki/Numeric_keypad).

    export TERM=linux
    
Else you use a fast and recent X11 client (i.e. not Windows)

    export TERM=xterm-256color

    
Become a sudoer
---------------

    su  # enter root password
    visudo

Append in the bottom

    yourlogin ALL=(ALL) NOPASSWD:ALL

or if you prefer having to enter your password:

    yourlogin ALL=(ALL) ALL


Install packages
----------------

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

Enabling multicast reception
----------------------------

If your machine uses the `firewalld` (you can verify with `firewall-cmd --state`),
you need to allow the multicast IPs:

    firewall-cmd --direct --add-rule ipv4 filter IN_public_allow 1 -d <ip> -j ACCEPT
    
`<ip>` is something like 227.23.1.31.

Developer Toolset
-----------------

This chapter is about Red Hat and RPM satellite.

### Add artifact repositories

Check first

    ls -l /etc/yum.repos.d

Example of two new RPM satellites:

    cat > /etc/yum.repos.d/devtoolset-3-el7.repo
    [devtoolset-3-el7]
    name=Devtoolset 3 for Enterprise Linux 7 - $basearch
    baseurl=http://your-company-host/devtoolset-3/epel-7/$basearch/
    failovermethod=priority
    enabled=1
    gpgcheck=0

    cat > /etc/yum.repos.d/rh-java-common-epel-7.repo
    [rh-java-common-epel-7.repo]
    name=Java Common for Enterprise Linux 7 - $basearch
    baseurl=http://your-company-host/rh-java-common/epel-7/$basearch/
    failovermethod=priority
    enabled=1
    gpgcheck=0

### Install

    yum install devtoolset-4

### Usage 

Add `slc_source` in yor `~/.bashrc` to use by default the latest `devtoolset`.

    echo 'source scl_source enable devtoolset-4' >> ~/.bashrc

Or just enable it within a sub-shell on-demand.

    scl enable devtoolset-4 bash


Access VM files from Windows
----------------------------

1. Install Samba `yum install samba`
2. Enable samba in firewall `firewall-cmd --add-service=samba`
3. Add your user to the samba users database `pdbedit -a -u yourlogin` (and enter password)
4. Enable shared folder access `chcon -Rt samba_share_t /home/user/public` (Do not share folder where your `.ssh` or other sensitive data is accessible)
5. Run Samba deamon `service smb start`
6. Check if your Windows machine can access your VM share using `telnet <your-VM-hostname> 139` (if it connects the route is OK)
7. Ensure Samba deamon is well launched with `service smb status`

You can access to your remote folder from Windows using `\\<hostname>`  
(Attention: the hostname printed by the commande `hostname` may be different from the `hostname` used by your Windows machine to access it)

Synchronize Password
--------------------

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
---------------

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


Remove SSH banner
-----------------

When Git accesses the remote you see each time this annoying banner:  
<sup>(`ssh` displays the content of `/etc/issue` from the remote server)</sup>

    WARNING

    Any access or any attempt to access this machine without permission is forbidden
    and could be subject to criminal and civil penalties.

    To protect this system from unauthorised use, viruses and to ensure that the
    system is functioning properly, security systems have been installed.

    Any unauthorised attempt to stop or bypass one of these security tools is
    forbidden.

    ATTENTION

    Tout acces ou tentative d'acces non autorisee sur ce systeme est interdit
    et sujet a des poursuites penales ou civiles.

    Pour proteger ce systeme des acces frauduleux et des virus, et pour assurer son
    bon fonctionnement, des systemes de securites ont ete installes.

    Toute tentative non autorisee pour arreter ou contourner l'un de ces
    dispositifs est interdite.

To disable it add a file `~/.ssh/config` containing:

    LogLevel ERROR

Please refer to [superuser.com](http://superuser.com/a/1010687/112297) and upvote.


Git configuration
-----------------

Before clonning a Git repository, first configure your identity.

    git config --global user.name "Joe Jackson"
    git config --global user.email "jjackson@example.com"

- `user.name` must be populated with your real name in the following format "FirstName LastName"
- `user.email` must be your official company email

Set your favorite editor as the defualt editor used by Git (helfull while using `git commit myfile`).

    git config --global core.editor vim   # or emacs/nano/gedit/kate/...

Append in your `~/.gitconfig`

```ini
[color]
	ui = auto              # Use terminal color when available
[push]
	default = simple       # Make “git push” without argument push the current branch to the remote branch with the same name.
[pull]
	rebase = preserve      # Ensure “git pull” will use rebase instead of merge, preserving existing local merges
[rebase]
    autoStash = true       # 'git pull --rebase' => 'git stash' before and 'git stash pop' after
[diff]
	mnemonicPrefix = true  # Improve “git diff” output of source/target
	renames = true         # and detect renames
[log]
	abbrevCommit = true    # Make “git log” show abbreviated SHA1
[rerere]
	enabled = true         # Make Git automatically record and re-apply conflicts resolution
	autoupdate = true      # Automatically add to index auto-resolved conflicts
	
[alias]
    # Show improved logs (colors, branch graphs…)
    lo  = log --graph --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset' --relative-date --ignore-space-change --ignore-blank-lines
    lof = log --graph --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ar)%Creset' --relative-date --ignore-space-change --ignore-blank-lines --follow --find-copies-harder
    # Shortcut for status command
    st = status
    # Amend latest commit keeping the same commit message
    oops = commit --amend --no-edit
    track-all-remote-branches = ! git branch -a | grep \"^\\s*remotes/[^>]*$\" | xargs --interactive -L1 git checkout --track
    di = diff --ignore-space-at-eol --ignore-space-change --ignore-all-space --ignore-blank-lines
    
[http]
    proxy = http://your-login:your-password@your-company-hostname:8080/
    sslVerify = false
[https]
    proxy = http://your-login:your-password@your-company-hostname:8080/
    sslVerify = false

[merge]
    conflictstyle = diff3
    tool = meld
[mergetool "meld"]
    # Choose one of these 2 lines (not both)
#   cmd = meld "$LOCAL" "$MERGED" "$REMOTE" --output "$MERGED"
    cmd = meld "$LOCAL" "$BASE"   "$REMOTE" --output "$MERGED"

[diff]
    tool = meld
[difftool]
    prompt = false
[difftool "meld"]
    cmd = meld "$LOCAL" "$REMOTE"
```
        
Git submodule hell
------------------

Handling submodules may become irritating.  
Developers often want to work on branch develop (HEAD) and to quickly synchronize their stuff.  
Moreover developers may not want commiting some modified files.

The trick is to:

* configure `[rebase] autoStash = true` within the `~/.gitconfig` (see previous chapter)
* use `git submodule update --init --remote --rebase --depth 1`

ATTENTION: `autoStash=true` is a bit tricky, be sure you understand `git stash` and you know how to resolve conflicts.

### Get a global picture

    $ git status && echo ============================ && git submodule status
    On branch develop
    Your branch is up-to-date with 'origin/develop'.
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)
    
    	modified:   CMakeLists.txt
    
    Unmerged paths:
      (use "git reset HEAD <file>..." to unstage)
      (use "git add <file>..." to mark resolution)
    
    	both modified:   3rdparty/xxxx
    
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
      (commit or discard the untracked or modified content in submodules)
    
    	modified:   3rdparty/boost (modified content)
    	modified:   aa (new commits)
    	modified:   dd (new commits)
    
    ============================
     4d7fb3364b2276fe0a8bfd37e968655d763fc1a9 3rdparty/boost (boost-1.60.0-43-g4d7fb33)
     e7da0bf290e262ab2603d148d3843497b9e85be1 3rdparty/google-benchmark (remotes/origin/HEAD)
     abbf74c1ef496f4d07e8f77996f70332e07faa16 3rdparty/googletest (v1.7.0-2-gabbf74c)
     f4f461a7799aa4abf4eb86e82c3c244cbfa35e12 3rdparty/gsl (heads/master)
    U0000000000000000000000000000000000000000 3rdparty/xxxx
     bdff90a73326c5ef2e4bfb6c883f12f70ed07ed1 3rdparty/yyyy (remotes/origin/HEAD)
     6169a0b3c188124a7a7277597635298c44d32f1a 3rdparty/zzzz (1.0.2)
     b2dbf3f3ee3240671238b86941b9709d92465bb8 3rdparty/wwww (1.3-RC3-3-gb2dbf3f)
     936d31abae2043371d76dffd9f205b434b1938c9 3rdparty/vvvv (6.2.1-2-9-g936d31a)
    +d8397fd1bec111af5247fd88a513fb27b409b881 aa (heads/develop)
     d7d973b3ad4c78f4e49b85d559f1bd62d2f6528c bb (heads/master)
     07820fb22b4110262faf12b1127814455d9732fb cc (heads/develop)
    +1af853f4cfecdbb102efbcf37f7b282770ccd7fa dd (remotes/origin/HEAD)
     d96b53d8f46797fc49a1f1b8af91bcfdeb7f6af4 ee (remotes/origin/HEAD)
     a8e6c0452a123ad9319d1d1e06eb81f5b3a7eaca ff (heads/develop)
     91abb8c34e0d4bcaaf623c49d3bdfda7730d1e8e gg (heads/master)

In this above example there is a conflict about SHA1 of the submodule `3rdparty/xxxx`

### Update a submodule to HEAD

Status of the submodule before:

    $ git -C aa status
    On branch develop
    Your branch is up-to-date with 'origin/develop'.
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
    
    	modified:   src/main/CMakeLists.txt
    	modified:   src/tools/CMakeLists.txt
    	modified:   test/CMakeLists.txt
    
    no changes added to commit (use "git add" and/or "git commit -a")

Use simply `git submodule update --remote --rebase ct` using the configuration of the previous chapter in order to fetch and rebase.

If there are modified files => Git will `stash` them only during the `pull --rebase`.  
Be informed: you may have to resolve conflicts during the `rebase` or during the `stash pop`.

    $ git submodule update --remote --rebase aa
    remote: Counting objects: 22, done.
    remote: Compressing objects: 100% (22/22), done.
    remote: Total 22 (delta 18), reused 0 (delta 0)
    Unpacking objects: 100% (22/22), done.
    From git.example.com:group/aa
       d8397fd..220d0b5  develop    -> origin/develop
    Created autostash: 3339e23
    HEAD is now at d8397fd Remove warning
    First, rewinding head to replay your work on top of it...
    Fast-forwarded develop to 220d0b5055a72a9347311840007cf4eb57ede1d8.
    Applied autostash.
    Submodule path 'aa': rebased into '220d0b5055a72a9347311840007cf4eb57ede1d8'

The above command `git submodule update --remote --rebase aa` is similar to:

    $ cd aa
    $ git checkout develop
    $ git stash
    $ git pull --rebase
    $ git stash pop

### Update superproject and all submodules

This one-line command automatically `stash` & `stash pop` the actual modified files.  
(the first `git pull` automatically rebases according to `~/.gitconfig`)

    $ git pull && echo ============= && git submodule update --init --remote --rebase --depth 1
    remote: Counting objects: 2, done.
    remote: Compressing objects: 100% (2/2), done.
    remote: Total 2 (delta 1), reused 0 (delta 0)
    Unpacking objects: 100% (2/2), done.
    From git.example.com:group/superproject
       2c012af..f0d6ec5  develop    -> origin/develop
    Fetching submodule ct
    remote: Counting objects: 4, done.
    remote: Compressing objects: 100% (4/4), done.
    remote: Total 4 (delta 3), reused 0 (delta 0)
    Unpacking objects: 100% (4/4), done.
    From git.example.com:group/aa
       220d0b5..7c14ceb  develop    -> origin/develop
    Created autostash: 20a2bad
    HEAD is now at 2c012af #39042 : My commit comment
    First, rewinding head to replay your work on top of it...
    Fast-forwarded develop to f0d6ec53ba03e7e5fedf73a8d5d04d385283c5f8.
    Applied autostash.
    =============
    Created autostash: 2a23cd9
    HEAD is now at 220d0b5 My last commit comment
    First, rewinding head to replay your work on top of it...
    Fast-forwarded develop to 7c14cebe0d477ece08615087052386dca3b5c8cc.
    Applied autostash.
    Submodule path 'aa': rebased into '7c14cebe0d477ece08615087052386dca3b5c8cc'
    First, rewinding head to replay your work on top of it...
    Fast-forwarded HEAD to 1af853f4cfecdbb102efbcf37f7b282770ccd7fa.
    Submodule path 'dd': rebased into '1af853f4cfecdbb102efbcf37f7b282770ccd7fa'

### Check remaining stashes

TODO(olibre): explain conflict resolution (provide an example having a remaining stash)

    $ git stash list && git submodule foreach git stash list
    Entering '3rdparty/boost'
    Entering '3rdparty/google-benchmark'
    Entering '3rdparty/googletest'
    Entering '3rdparty/gsl'
    Entering '3rdparty/xxxx'
    Entering '3rdparty/yyyy'
    Entering '3rdparty/zzzz'
    Entering '3rdparty/wwww'
    Entering '3rdparty/vvvv'
    Entering 'aa'
    Entering 'bb'
    Entering 'cc'
    Entering 'dd'
    Entering 'ee'
    Entering 'ff'
    Entering 'gg'
    
Shortcuts
---------

Presse a key in your terminal => Execute a command

Append in you `~/.bashrc` 

```bash
## Shortcuts
export PrjRoot=~/work/superproject
# F5 => Status
bind '"\e[15~":"bash -xec \"cd ${PrjRoot} && git status && git submodule status\"\n"'
# F6 => Update
bind '"\e[17~":"bash -xec \"cd ${PrjRoot} && git pull && git submodule update --init --remote --rebase --depth 1 && git submodule foreach git stash list\"\n"'
# F7 => Compile
bind '"\e[18~":"if [ -e ${PrjRoot}/build/Makefile ]
then /usr/bin/time make -sj6 -C ${PrjRoot}/build
else mkdir -p ${PrjRoot}/build && (cd ${PrjRoot}/build && cmake .. && /usr/bin/time make -sj6)
fi\n"'
# F8 => Test
bind '"\e[19~":"(cd ${PrjRoot}/build && ctest -j6)\n"'
```
