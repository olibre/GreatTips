Git branching model and workflow
================================

This branching model ensures code consistency over the project
while multiple teams are actively developing and modifying the code.
This document specify branch naming and can be checked by remote Git hook.

Overview
--------

If you hang in the *Git* documentation, you will find out that it describes two different concepts: *workflows* and *branching models*.
A *workflow* is meant to describe how the various *Git* nodes communicate between each other.
In this page, the the centralized workflow is used: everyone is pulling and pushing to the one central Git repository.
What developers understand when they hear the word *workflow* is in fact the *branching model*.
The *branching model* describes how you structure your branches and what are the rules to merge them.
*GitFlow* is a *branching model*.

This document describes the branching model to be adopted by developers within one main Git repositories and optionaly some other Git repository synchronized using *Git submodules*.
This document does not cover *Git submodules*.
Development branches supposed to be merged at the same time in two submodules will be through two reviews, ideally by the same reviewer at the same time.

Common work is gathered in the branch `develop`. During their sprints, teams uses team branches prefixed by `dev-`.
Those branches are supposed to be regularly merged into `develop`, ideally at the end of every sprint, with the help and approval of the release manager.

![Branching Model Overview](http://olibre.github.io/CppCoding/img/branching.svg)

The mainline `develop`
----------------------

Branch `develop` is a _long-running branch_ to collect the current code produced from the teams.

This branch is supposed to be stable and deployable to test environments at any time.

Do not commit directly to `develop`, the branch shall only contain merge commits from the release manager.
Commit messages should be the default git merge commit message.

The release branches
--------------------

Release branches are _long-running_ branches using naming `release-${MAJOR}.${MINOR}`.

They represents a version of the product which already is in production or have a clearly defined functional set meant to be pushed in production.
Several releases may live together. Functional scope is not supposed to change over the life of the release branch.
When the branch is ready to be tested by validation team, the last commit is tagged with `${MAJOR}.${MINOR}.${PATCH}`.
Wether this tag is effectively validated for production or not is not covered by current naming rules.

Do not commit directly to a release branch: only merges from the mainline `develop` or from another branch containing a bugfix.
Commit messages should be the default git merge commit message.

The team branches
-----------------

Team branches are _long-running_ branches called `dev-${short_name_of_team}`.

Please avoid commiting directly to these branches, only merge commit from developers.
The `develop` branch is merged back to this branch. 
Commit messages should be the default git merge commit message.

The feature branches
--------------------

Feature branches are where the code is written by developers.

A feature branch is a _short-lived_ branch using naming `${developer_trigram}-${RM_Issue}-${short_description}`:

* `${developer_trigram}` is the lowcase 3 characters short for the developer (can be the first letter of his/her firstname followed the first and second letters of his/her lastname).
* `${ticket_issue_number}` is the issue ID describing and following the developed feature. Even small developments and bugfixes are supposed to be tracked. Branches are cheap in Git.
* `${short_description}` is a small list of lowcase english words describing the feature.

For instance `bob-40123-snapshot-start-end` would be a valid feature branch name.

A feature branch should start from where it is supposed to be merged for production.
For instance, if you write a bugfix for the `release-0.6` and the `release-0.7` as well as the mainline `develop`,
then this branch should start from the latest `release-0.6` tag.

Once merged to the team branch, this branch is supposed to be deleted.
If needed, the deleted branch could be re-created thanks to the merge commit which should contain the name of the branch.

Commit messages should follow the following pattern:

    [#${ticket_issue_number}] Short description of commit
    
    More details after a blank line
    Other lines if required

A client hook could be used to preformat this message automatically from the branch name.

Developer workflow
------------------

This section describes the workflow that the developers should use when adding features to the code base.

### 1. Code a new feature

Checkout your team branch latest version.

```
git checkout dev-myteam
git pull
```

Create a feature branch with your trigram, issue ID, and short description.
For this example, the trigram will be `bob`, and the Redmine issue `11000`:

```
git checkout -b bob-11000-my-feature
git push --set-upstream origin bob-11000-my-feature # Create branch on the remote
```

Develop, commit, and push regularly to the remote. When you are finished, you may submit a merge request. Go on the right project on *Gitlab* and select _Merge Request_ in the left menu. Hit the _Create merge request_ button at the top right of your screen.

Select the source branch, which is `bob-11000-my-feature`. Select the target branch, which is `dev-myteam`.

Hit the _Compare change_ button. Review quickly to check that it matches what you would expect, then fill in the _Title_, the _Description_, and the most important one, assign the merge request to your reviewer. Then hit _Submit merge request_.

### 2. Review the code

Go on with the reviewer and explain the whole thing. Fix things if required by the reviewer and re-push.

### 3. Clean up your development branch

Once the merged code has been validated through continunous integration, clean up you local repository:

```
git checkout dev-myteam
git pull --prune
git branch -d bob-11000-my-feature
```

Reviewer workflow
-----------------

### 1. Begin the review

Once a pull request has been assigned to you, you will receive an email with a link directly to it. Open it in your favorite browser and make sure the developer cares to be here to explain.

If there is a conflict, add a comment and invite the developer to manually merge the team branch into its own development branch beforehand. No need to close the request, it can stay open. If the developer cannot fix the conflict by himself, step to method #2 directly, as you cannot merge a conflict in Gitlab.

### 2. Read the code

As a reviewer, it is your responsibility to accept or delay the merge. If your are satisfied with the code, accept the merge with either method. If you are not, add a comment explaining why, and what the developer should to to reach an acceptable changeset.

1. Review code directly into Gitlab  
   You can review the source code in the _Changes_ tab. It displays a diff, but you can display a side-by-side diff if it happens to suit you better. If you are satisfied, click on the *Accept merge request* button. Do not delete the source branche yet.
2. Review code with another tool  
   Configure git with your prefered difftool, then read the code.
    
    ```
    git difftool dev-myteam bob-11000-my-feature
    ```
    
    If you accept to merge, do so with a forced merge, as it makes more sense for the history.
    
    ```
    git checkout dev-myteam 
    git merge --no-ff bob-11000-my-feature
    ```
    
    If a conflict happens but you did not see it beforehand, tell the developer to merge the team branch before hand and cancel the merge:
    
    ```
    git merge --abort
    ```
    
    Or if you decide to cope with the conflict together (with a good reason to do so), then proceed and commit the merge:
    
    ```
    git mergetool
    git commit
    git push
    ```

### 3. Validation

Tests should have been made by the developer, so as a reviewer, you can let the CI facility do the validation. If the code validates, you can delete the source branch and close the issue directly into Gitlab. Otherwise, prompt the developer to add a fix and merge again.

Release manager workflow
------------------------

    TODO

Git Flow
========

Vincent Driessen has pretty well defined the *"successful Git branching model"*  
http://danielkummer.github.io/git-flow-cheatsheet/

Overview:

* Default branch is `develop`.
* When neccessary developers may work on a branch `feature/xxxx`.
* Release version to QA by creating branch `release/xxxx`
* When validated merge branch `release/xxxx` to `master` and tag the version.

![branching overview](http://nvie.com/img/git-model@2x.png)


Get command `git flow`
----------------------

`git-flow` is a shell script to expand `git`.

Install on redhat:

    sudo yum install gitflow

Or visit project source code:  
https://github.com/nvie/gitflow

You may also be interested by tab-completion for all git-flow subcommands and branch names:  
https://github.com/bobthecow/git-flow-completion


General documentation on `git flow`
-----------------------------------

`git flow` help managing this branching model:

* Create branch `feature/xxxx` and when code is finished merge back this branch to `develop`
* Create branch `release/xxxx` and when code is validated merge this branch to `master`
* And more...


### Read more about interest of `git flow`:

* [Using git-flow to automate your git branching workflow](http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/) from Jeff Kreeftmeijer
* [Project wiki](https://github.com/nvie/gitflow/wiki) (FAQ and more)

### Video (screencast)

* [How to use a scalable Git branching model called git-flow](http://buildamodule.com/video/change-management-and-version-control-deploying-releases-features-and-fixes-with-git-how-to-use-a-scalable-git-branching-model-called-gitflow) from "Build a Module"
* [A short introduction to git-flow](http://vimeo.com/16018419) from Mark Derricutt
* [On the path with git-flow](http://codesherpas.com/screencasts/on_the_pa  th_gitflow.mov) from Dave Bock



Usage of `git flow`
-------------------

### Excelent documentation ***Git flow cheatsheet***:

* in English: http://danielkummer.github.io/git-flow-cheatsheet/
* in French:  http://danielkummer.github.io/git-flow-cheatsheet/index.fr_FR.html

Next sections provide first steps.

### Initialize `git flow`

1. Clean your repo (commit modified files and remove untracked files)
2. Create branch `develop` (in addition to branch `master`)
3. Configure branch `develop` as branch by default (when cloning)
4. `git flow init` and select these settings

        Branch name for production releases:         [master]
        Branch name for "next release" development:  [develop]
        Feature branches?                            [feature/]
        Release branches?                            [release/]
        Hotfix branches?                             [hotfix/]
        Support branches?                            [support/]
        Version tag prefix?                          []

5. Always be sure to be in branch `develop` before modifying files


### Create a branch for development

1. Be sure you are at the good SHA1

    ```bash
    # Example to create the branch from HEAD
    git checkout develop
    git pull
    ```

2. Create the branch `feature/xxxx` in your local repository

    ```bash
    $ git flow feature start xxxx
    Switched to a new branch 'feature/xxxx'

    Summary of actions:
    - A new branch 'feature/xxxx' was created, based on 'develop'
    - You are now on branch 'feature/xxxx'

    Now, start committing on your feature. When done, use:

         git flow feature finish xxxx
    ```

3. Push to remote

    ```bash
    $ git push --all
    Total 0 (delta 0), reused 0 (delta 0)
    To git@my-company-hostname:my-repo.git
     * [new branch]      feature/xxxx -> feature/xxxx
    ```

TODO
----

A tradeof of git-flow is the necessity to set git-flow each time a repo is cloned.  
Please share your ideas on simple way to *"git-flowify"* a repo (a script, a post-clone hook, ...)
