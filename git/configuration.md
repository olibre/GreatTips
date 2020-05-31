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
