Git configuration
=================

User name and e-mail
--------------------

Before any commit, first configure your identity.

    git config --global user.name "Joe Jackson"
    git config --global user.email "jjackson@example.com"

- `user.name` in format "FirstName LastName"
- `user.email` your official email

The above commands do the same as directly editing the file `~/.gitconfig`

```ini
$ cat ~/.gitconfig
[user]
name  = Joe Jackson
email = jjackson@example.com
```
If you use different names accross your Git repository, configure it for each Git repository after clonning it:

    git config --local user.name "Joe Jackson"
    git config --local user.email "jjackson@example.com"


Core
====

```ini
[core]
	editor = vim
	autocrlf = input
	whitespace = fix,-indent-with-non-tab,trailing-space,cr-at-eol
```

Text editor
-----------

Default editor is `nano`. Set your favorite editor:

    git config --global core.editor vim   # or emacs/gedit/kate/geany/nano/...

Above command line is same as putting the following lines in `~/.gitconfig`:

```ini
[core]
editor = vim
```

Default editor is used on `git commit myfile` or `git rebase -i`


Line endings
------------

Always Unix line endings, but preserve wrong line endings if already pushed.
See also [GitHub help](https://help.github.com/articles/dealing-with-line-endings#platform-all).
    
* on Linux/macOS/...
    
        git config --global core.autocrlf input
    
* on Windows
    
        git config --global core.autocrlf true

Result on Linux and macOS:

```ini
[core]
autocrlf = input  # preserve CRLF when file has been created on Windows
```


Colors optimized for dark background
====================================

```ini
[color]
	ui = true      # Use colors in terminal
	branch = auto
	diff = auto
	status = auto
	showbranch = auto

[color "branch"]
	current = yellow bold
	local = green bold
	remote = cyan bold

[color "diff"]
	meta = yellow bold
	frag = magenta bold
	old = red bold
	new = green bold
	whitespace = red reverse

[color "status"]
	added = green bold
	changed = yellow bold
	untracked = red bold
```

Push, Pull, Rebase
==================

Append in your `~/.gitconfig`

```ini
[push]                 # https://git-scm.com/docs/git-config#Documentation/git-config.txt-pushdefault
default = simple       # "git push" without argument pushes the current branch to the remote branch with the same name

[pull]                 # https://git-scm.com/docs/git-config#Documentation/git-config.txt-pullrebase
# rebase = merges      # "git pull" uses rebase instead of merge, but preserves existing local merges
rebase = interactive

[rebase]
stat      = true       # show a diffstat of what changed upstream since the last rebase
autoStash = true       # git stash   +   git pull --rebase   +   git stash pop
missingCommitsCheck = warn  # git rebase -i will print a warning if some commits are removed

[rerere]
enabled = true         # Make Git automatically record and re-apply conflicts resolution
autoupdate = true      # Automatically add to index auto-resolved conflicts

[fetch]
prune = true           # Delete local branches that have been deleted on remote repo

[gui]
pruneDuringFetch = true
```

Push, Pull, Rebase
==================

Install Vimdiff, Meld, KDiff3 or Kompare.
Also install [git-interactive-rebase-tool](https://github.com/MitMaro/git-interactive-rebase-tool).

```ini
[diff]
mnemonicPrefix = true  # Improve "git diff" output of source/target
renames = true         # and detect renames
tool    = vimdiff # meld #kdiff3
guitool = meld #kdiff3 #kompare
algorithm = patience

[sequence]
editor = interactive-rebase-tool

# Below merge/diff from http://stackoverflow.com/a/34119867/938111

[merge]
conflictstyle = diff3
tool = meld

[mergetool "meld"]
# Choose one of these 2 lines (not both)
cmd = meld "$LOCAL" "$MERGED" "$REMOTE" --output "$MERGED"
#md = meld "$LOCAL" "$BASE"   "$REMOTE" --output "$MERGED"

[difftool]
prompt = false

# [difftool "kdiff3"]
# cmd = kdiff3 $LOCAL $REMOTE --output $MERGED

# [difftool "meld"]
# cmd = meld "$LOCAL" "$REMOTE"
```

Aliases
=======

```ini
[log]
abbrevCommit = true    # Make "git log" show abbreviated SHA1

[alias]

# Shortcut for status command
st = status -sb

# Show improved logs (colors, branch graphs...)
l   = log --graph --oneline --decorate
lo  = log --graph --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad %ar)%Creset' --date=short --ignore-space-change --ignore-blank-lines
lof = log --graph --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad %ar)%Creset' --date=short --ignore-space-change --ignore-blank-lines --follow --find-copies-harder
hist = log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short

# Amend latest commit keeping the same commit message
oops = commit --amend --no-edit
track-all-remote-branches = ! git branch -a | grep \"^\\s*remotes/[^>]*$\" | xargs --interactive -L1 git checkout --track

di = diff --ignore-space-at-eol --ignore-space-change --ignore-all-space --ignore-blank-lines


```

Proxy
-----

```ini
[http]
proxy = http://your-login:your-password@your-company-hostname:8080/
sslVerify = false

[https]
proxy = http://your-login:your-password@your-company-hostname:8080/
sslVerify = false
```


Git submodule hell
==================

Handling submodules may become irritating.  
Developers often want to work on branch develop (HEAD) and to quickly synchronize their stuff.  
Moreover developers may not want commiting some modified files.

The trick is to:

* configure `[rebase] autoStash = true` within the `~/.gitconfig` (see previous chapter)
* use `git submodule update --init --remote --rebase --depth 1`

ATTENTION: `autoStash=true` is a bit tricky, be sure you understand `git stash` and you know how to resolve conflicts.

Get a global picture
--------------------

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

Update a submodule to HEAD
--------------------------

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

Update superproject and all submodules
--------------------------------------

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

Check remaining stashes
-----------------------

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
