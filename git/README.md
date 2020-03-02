Configuration
-------------

* [`~/.gitconfig`](./configuration.md)


Commit
------

Nice example: https://github.com/tiangolo/fastapi

:memo: Update release notes  
:sparkles: Add support for OpenAPI Callbacks (#722)  
:loud_sound: Refactor logging (#781)  
:speech_balloon: Rephrase handling-errors to remove gender

Useful emojis: https://github.com/carloscuesta/gitmoji

Elegant commit message:

    :emoji: Verb summarizing the change (in some words) #123 #456 (optionnal issues)
                                                                      (blank line)
    Optionnal verbose descripption
    can use multiple lines
    * can use bullet points
    * and any *Markdown* `syntax`

* But we not care about perfect commit history
* We care about the current source code status (not about what we did last year)
* Each one is free to commit in the way they want (even poor commit message *"WIP"* if team members do not care)
* Each one is free to `git push --force` on their own feature branch
* But inform others when you `git push --force` on `master` 🙏



Branching
---------

* Simplicity: no unnecessary branches
* Only `master` and temporary feature branches (we may add `develop` and others in the future)
* Delete old branches
* Feature branch is nice for:
    * risk of regression
    * merge request (you want someone review your changes)
* But new code (new subdirectory) can be commited *in progress* in the `master` branch (if others do not care)
* And if the change is obvious (one commit) you can also do it in `master` branch (review is easy for one commit)
* Anyone is free to break these rules: Liberty and happiness is more important than constraints

See also:

* [branch](./branch.md)
* https://learngitbranching.js.org/
