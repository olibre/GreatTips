Great Tips, Mindsets and Practices for Coders
=============================================

*Empowering tips, mindsets and practices for happy coders about Training, Coding, Git, Unit tests, Agile, GNU/Linux installation, Markdown/Pandoc... Not the best ones because continuously evolving and any one can propose improvements.* 😉

Maintained with faireness in mind and shared in [Public Domain](#public-domain-dedication).

Also available as a [slide show](http://olibre.github.io/GreatTips/pres.html#/) (using Reveal.js).

* [Installation tips](./install)
* [Git](./git)
* [Java/Groovy/Gradle/Ant](./java)
* [C++](./cpp)
    * [Rules](cpp/rules.md)
    * [Metrics](cpp/lint.md)
    * [C++ Core Guidelines](cpp/cpp_core_guidelines.md)
* [CMake](./cmake)
* [Empoworing team members](./team)
* [Great Unit Tests](./unit-test)
* [Logging](./log)
* [Diagrams within Markdown](./markdown)


See also
========

Design / CSS
------------

* Ant Design https://pro.ant.design/
* Material Design https://material.io/
* Illustrations libres/gratuites https://dev.to/ahmed_sulaiman/13-places-to-find-beautiful-free-illustrations-580e
* 25 videos to learn CSS Grid https://cssgrid.io/
* Name all the colors in CC0 1.0 https://colornames.org/
* Simpsons https://pattle.github.io/simpsons-in-css/
* Font Awesome https://fontawesome.com/
* Material Design Icons https://materialdesignicons.com/
* Ionicons https://ionicons.com/
* CSS Theme Switcher by Reverse-Engineering https://www.youtube.com/watch?v=rXuHGLzSmSE
* Compress JPG with ImageMagick https://www.webnuz.com/article/2020-04-09/TIL%3A%20The%20Best%20Way%20to%20Compress%20JPG%20Files%20with%20ImageMagick
* HTML minimalist stylesheet https://github.com/andybrewer/mvp
* BEM Naming visual tool for CSS classes https://9elements.com/bem-cheat-sheet/


Web site architecture
---------------------

* 12 SEO practices https://ahrefs.com/blog/seo-best-practices/
* Demystifying SSR, CSR, universal and static rendering with animations
  https://dev.to/kefranabg/demystifying-ssr-csr-universal-and-static-rendering-with-animations-m7d
    * SSR = Server Side Rendering (WordPress)
    * CSR = Client Side Rendering CDN (Full JS: Vue, React, Angular)
    * Universal Rendering (Svelte, Next.js, Nuxt.js, Angular Universal)
    * Static Rendering = Markup (Hugo, Jekyll)
    * JAMStack = JS+API+Markup (Svelte/Saper, Next.js, Gatsby, VuePress, Gridsome)

&nbsp;          | SSR | CSR |Universal| Static | JAMStack
----------------|:---:|:---:|:-------:|:--------:|:--------
Requires hosting| yes | no  | yes     | no       | yes (API)|
CDN             | 👎   | 👍  | 👎      | 👍       | 👍
SEO             | 👍   | 👎  | 👍      | 👍       | depends on content from API
Initial load    | ⚡️⚡️  |  ⚡️  | ⚡️⚡️      | ⚡️⚡️⚡️      | ⚡️⚡️
Reload          | yes | no  | no      | no       | depends on the tool
Fluid UX        | 👎  | 👍   | 👍      | 👍       | 👍
Frequent updates| 👍  | 👍   | 👍      | 👎       | 👎/👍`*`

`*` To be frequently updated, JAMStack website can use APIs to retrieve content but looses SEO benefits. Approche can be hybrid: only very recent content is delivered by API, while static content is continuously re-built & delivered acroos CDN.


Security
--------

* [OWASP](https://en.wikipedia.org/wiki/OWASP) Cheat Sheet https://github.com/OWASP/CheatSheetSeries
* [Tools, resources and references to practice ethical hacking](https://github.com/sundowndev/hacker-roadmap)
* [The Hacker's Choice](https://github.com/hackerschoice) (IT Security Research Group) [Tips, Tricks & Hacks](https://github.com/hackerschoice/thc-tips-tricks-hacks-cheat-sheet)
* [hackerEnv](https://github.com/abdulr7mann/hackerEnv), automation tool that sweep IPs and scan ports, vulnerabilities and exploit them
* SpiderFoot as penetration test or to gather information about what your organisation might have exposed over the Internet https://github.com/smicallef/spiderfoot
* Spy GitHub users https://github.com/eth0izzle/shhgit


Programming
-----------

Features                            | Programming languages |
----------------------------------- | ---------------------
Fast compilation                    | V, D, Go, Delphi
Simplicity & maintainability        | V, Go, [Nim](https://nim-lang.org/), Python, [Julia](https://en.wikipedia.org/wiki/Julia_(programming_language)), Jupyter, Elm, Kotlin, Dart, Elixir
Great perf. and zero cost C interop | V, C, C++, D, Delphi, Erlang, Rust
Safety (immutability, no null, option types, free from data races) | V, Rust
Easy concurrency                    | V, Go
Easy cross compilation              | V, Go
Compile time code generation        | V, D
Small compiler with no dependency   | V
No global state                     | V
Hot code reloading                  | [V](https://vlang.io)

* Nim for Python coders https://github.com/nim-lang/Nim/wiki/Nim-for-Python-Programmers
* Compare speed of Nim, Julia and C++ https://gist.github.com/sdwfrost/7c660322c6c33961297a826df4cbc30d
* Python Cheatsheet https://github.com/gto76/python-cheatsheet
* Python-based algorithms https://github.com/TheAlgorithms/Python
* Python debugger/profiler (program flow visualizations) useful for algo learning https://github.com/CCExtractor/vardbg ([Y combinator](https://news.ycombinator.com/item?id=22170206))
* Python coloured output https://github.com/willmcgugan/rich
* Python weired behavior explained https://github.com/satwikkansal/wtfpython
* Rust intruduction (2020) https://www.softax.pl/blog/rust-lang-in-a-nutshell-1-introduction/ ([Y combinator](https://news.ycombinator.com/item?id=22176968))
* Rust quick learning https://fasterthanli.me/blog/2020/a-half-hour-to-learn-rust/
* GoFiber = Go web framework easy to learn by Node-developsers https://github.com/gofiber/fiber
* GoFrame (not a good idea to be locked with some libraries if cannot use others)  https://github.com/gogf/gf
* Go Material Design = https://github.com/fyne-io/fyne
* GetFlutter = 1000 open-source pre-build widgets library to develop both Flutter mobile app and web app https://github.com/ionicfirebaseapp/getflutter
* Playwright est une lib Node pour tester automatiquement l'UI sur différents navigateurs Chromium (dont MS-Edge), WebKit et Firefox en mode Headless (pas besoin d'un serveur graphique) sur Linux, macOS et Win https://github.com/microsoft/playwrigh
* JS Functional Programming => Learn Reactive Extensions (Rx) http://reactivex.io/learnrx/
* JS Algorithms and Data Structures https://github.com/trekhleb/javascript-algorithms
* Vue.js (30 minutes) https://www.youtube.com/watch?v=OrxmtDw4pVI
* Reproductible Builds https://reproducible-builds.org/
* Angular et Clean Architecture de Uncle Bob (Onion Architecture) https://github.com/im-a-giraffe/angular-clean-architecture

Les résultats du sondage JavaScript https://2019.stateofjs.com/overview/

* Représentation intéressante des technos sur les deux axes "connaissance" et "opinion positive/négative"
* TypeScript a le vent en poupe
* Angular est de moins en moins apprécié : énormément de réponses *I've USED it before, and would NOT use it again*
* React (et Vue) sont de plus en plus utilisés
* [Svelte](https://svelte.dev/) arrive en force aux côtés de React et Vue
* GraphQL est de plus en plus utilisé et apprécié (notamment, avec Apollo comme client)
* Par contre, plus Redux est utilisé, moins il est apprécié


Training
--------

* What I cannot create, I do not understand https://github.com/danistefanovic/build-your-own-x
* Application ideas to improve coding skills https://github.com/florinpop17/app-ideas
* Books updated from StackOverflow answers https://books.goalkicker.com/
* Freely available programming books https://github.com/EbookFoundation/free-programming-books
* Coding Interview University https://github.com/jwasham/coding-interview-university
* Learn large-scale systems design https://github.com/donnemartin/system-design-primer
* Learn and get certificats https://www.reddit.com/r/YouShouldKnow/comments/f4dtul/ysk_these_free_sites_to_educate_yourself_and_get/
* APIs for any project https://github.com/donnemartin/system-design-primer (business, anime, animals, news, finance, games...)
* Different paths to take to become a front-end, back-end, or dev-ops engineer https://github.com/kamranahmedse/developer-roadmap
* How To Interview Engineers When You're Not Technical
    - https://www.greghausheer.com/articles/how-to-interview-engineers-when-youre-not-technical
    - https://www.greghausheer.com/articles/how-to-interview-engineers-when-youre-not-technical-part-ii


Artificial Intelligeance & Machine Learning
-------------------------------------------

* Introduction to Deep Learning https://github.com/aamini/introtodeeplearning
* AutoML-Zero = mix de ML et algo génétiques https://arxiv.org/abs/2003.03384
* Twitter Newsfeed https://blog.twitter.com/engineering/en_us/topics/insights/2017/using-deep-learning-at-scale-in-twitters-timelines.html
* Twitter Ads https://blog.twitter.com/engineering/en_us/topics/insights/2019/improving-engagement-on-digital-ads-with-delayed-feedback.html
* Instagram Newsfeed https://instagram-engineering.com/lessons-learned-at-instagram-stories-and-feed-machine-learning-54f3aaa09e56
* Instagram Explore https://ai.facebook.com/blog/powered-by-ai-instagrams-explore-recommender-system/
* Facebook Deep Entity Classification https://engineering.fb.com/security/fighting-abuse-scale-2019/
* Uber Eats Recommendations
    - https://eng.uber.com/uber-eats-query-understanding/
    - https://eng.uber.com/uber-eats-recommending-marketplace/
    - https://eng.uber.com/uber-eats-graph-learning/
* Uber Maps https://eng.uber.com/nlp-deep-learning-uber-maps/
* Airbnb
    - https://medium.com/airbnb-engineering/using-machine-learning-to-predict-value-of-homes-on-airbnb-9272d3d4739d
    - https://medium.com/airbnb-engineering/listing-embeddings-for-similar-listing-recommendations-and-real-time-personalization-in-search-601172f7603e
    - https://medium.com/airbnb-engineering/learning-market-dynamics-for-optimal-pricing-97cffbcc53e3
    - https://medium.com/airbnb-engineering/categorizing-listing-photos-at-airbnb-f9483f3ab7e3
    - https://medium.com/airbnb-engineering/applying-deep-learning-to-airbnb-search-7ebd7230891f
    - https://medium.com/airbnb-engineering/discovering-and-classifying-in-app-message-intent-at-airbnb-6a55f5400a0c
* Airbnb Experiences https://medium.com/airbnb-engineering/machine-learning-powered-search-ranking-of-airbnb-experiences-110b4b1a0789
* Google http://highscalability.com/blog/2016/3/16/jeff-dean-on-large-scale-deep-learning-at-google.html
* Linkedin https://engineering.linkedin.com/blog/topic/feed-personalization
* Netflix Recommendations https://youtu.be/kY-BCNHd_dM
* Spotify Recommendations https://medium.com/s/story/spotifys-discover-weekly-how-machine-learning-finds-your-new-music-19a41ab76efe


Dev tools
---------

* `diffoscope` https://diffoscope.org/
* `icdiff` https://www.jefftk.com/icdiff
* DevTodo, command line TODO manager https://swapoff.org/devtodo.html
* Collection of .gitignore Templates https://github.com/github/gitignore
* Command line notes and tips https://github.com/jlevy/the-art-of-command-line


Dotfiles Managers
-----------------

Backup your customized configuration files (`~/.bashrc`, `~/.gitconfig`...)
and share them across the computers you use (home, work...).

### `yadm` - Easy too use

* https://yadm.io in Python
* YADM = Yet Another Dotfiles Manager
* Easy install/updgrade on Ubuntu/Debian `apt install yadm` and macOS `brew install yadm`
* Add OpenSuse RPM repository for Fedora and other RPM-based distros: https://yadm.io/docs/install
* But missing installation with `pip install --user yadm`
* Enter subshell for Git commands: `yadm enter` (`exit` to return)
* Support three template engines depending on file extension: `awk`, `j2cli` and `envtpl`
* Simple to use:
    - Keep leading dot `.` (in filename)
    - What is changed in Git repo is applyied (even removal)

### `chezmoi` - Filename prefixes as deployment operations

* https://chezmoi.io in Go
* Ubuntu/Debian/Fedora installations can rely on Snappy:
    ```
    sudo dnf install snapd                # provide "snap" command line
    sudo ln -s /var/lib/snapd/snap /snap  # prevent error: classic confinement requires snaps under /snap
    sudo snap install chezmoi --classic   # storage: 20 MB
    snap run chezmoi
    ```
* Enter subshell for Git commands: `chezmoi cd` (`exit` to return)
* Encode operations to apply during deployment as filename prefixes
* Replace leading dot `.` by `dot_`
* Require `-r` option to (recursively) add a configuration folder (silent failure even with `-v`) https://github.com/twpayne/chezmoi/issues/668
* Support template based on Go [`text/template`](https://pkg.go.dev/text/template) (append `*.tmpl`)

### `dotdrop` - Easy to hack (manual Git management)

* https://deadc0de.re/dotdrop/ in Python
* Disclamer: I do not have installed Dotdrop in the recommanded way, I do not use `dotdrop.sh` because I do not want to `git submodule` (I do not want to upgrade all installed software using `git submodule update` individually, I prefer a script doing `pip install --upgrade` for all installed user Python packages)
* Easy install/upgrade anywhere with `python3 -m pip install --user --upgrade dotdrop` (I think I do not need `dotdrop.sh`)
* Use [default Dotdrop `config.yaml` location](https://github.com/deadc0de6/dotdrop/wiki/config#location) or provide it in another way: `( cd ~/dd; dotdrop import ~/.bashrc )` or `alias dotdrop='dotdrop --cfg=~/dd/config.yaml` or `export DOTDROP_CONFIG=~/dd/config.yaml`
* Simple tool = Do not handle Git commands (manual repo management)
* Dotdrop and Git use different command names: import/add, compare/diff...
* Dotdrop drops dot: Archived filename without leading dot `.` if `keepdot:false` (default) in `~/.dd/config.yaml`
* Do not recover simple `config.yaml` errors: missing `profiles:` or empty hostname profile https://github.com/deadc0de6/dotdrop/issues/221
* Easy to hack beacause Git is not managed by `dotdrop` and because all other operations are clearly described in the `config.yaml`

### Installation of `dotdrop` to be almost `yadm`-compatible

YADM repo looking is often a convention: respect of original path/filenames.

Two almost `yadm`-compatible installations are described here:
1. Two Git repo (`dotdrop` repo + `dotfiles` sub repo)
2. The `dotfiles` repo archives itself the `~/.config/dotdrop/config.yaml`

Use same filename as YADM setting `keepdot:true` in `~/.config/dotdrop/config.yaml`:

```yaml
config:
  keepdot: true      # same filename as YADM
  dotpath: dotfiles  # set your dotfiles repo path/name
  backup: true
  banner: false
  create: true
  link_dotfile_default: nolink
  link_on_import: nolink
  longkey: false
dotfiles:
[...]
```

In order to have a dotfiles repo without `dotdrop` configuration and subfolder, use two repos:
* The `dotdrop` repo
* The `dotfiles` repo

Use `tree -a -I .git ~/.config/dotdrop/` to have a look on your dotfiles backup:

```php
$ tree -a -I .git ~/.config/dotdrop/
~/.config/dotdrop/
├── config.yaml     # above configuration file
├── .gitmodules     # main repo: ~/.config/dotdrop/
└── dotfiles        # Git submodule similar to YADM repo
    ├── .gitconfig
    ├── .bashrc
    ├── .config
    │   └── htop
    │       └── htoprc
    └── .ssh
        └── config
```

In the second installation, no need of the main `dotdrop` repo because the `~/.config/dotdrop/config.yaml` is archived within the `dotfiles` repo. After each `dotdrop import`, also perform:

    dotdrop import ~/.config/dotdrop/config.yaml
    cd ~/.config/dotdrop/dotfiles
    git add .config/dotdrop/
    git commit -m 'Update dotdrop config'


Encrypt sensitive data
----------------------

* YADM [presents](https://yadm.io/docs/encryption) [git-crypt](https://github.com/AGWA/git-crypt)
* `dotdrop` [proposes](https://github.com/deadc0de6/dotdrop/wiki/sensitive-dotfiles) gpg encryption

### Other dotfiles managers

* homeshick https://github.com/andsens/homeshick
* homesick https://github.com/technicalpickles/homesick
* rcm https://github.com/thoughtbot/rcm
* GNU Stow https://www.gnu.org/software/stow/
* bare git repo https://www.atlassian.com/git/tutorials/dotfiles

See also: https://dotfiles.github.io/utilities/

### Dotfiles manager alternative

`vcsh` Multiple Git repositories in $HOME https://github.com/RichiH/vcsh


Sandboxing
----------

* [EBox](https://docs.0install.net/tools/ebox/) uses [Zero Install](https://en.wikipedia.org/wiki/Zero_Install) (0install) to securely install software (from web sites) and runs them in a restricted environment.


Z shell - `zsh`
---------------

Most extra shell extensions are developed for `zsh`, this is the reason why to use `zsh` for you daily-used workstation. But, I do not recommend it for production servers where `dash` (or `bash`) seems to be more suitable.

To extend Zsh capabilities, you can use either use a `zsh` plugin manager or manually maintains your plusgins directly within  your `~/.zshrc`. The plugin manager will help keeping your Zsh plugins uptodate, but can slow down your Zsh startup time.

Plugin managers | Activity | Motivation
----------------|----------|---------------
[Oh-My-Zsh](https://ohmyz.sh/) | Active (2009) | Historical community-driven project collecting & maintaining hundreds plusgins & thems within [one big Git repo](https://github.com/ohmyzsh/ohmyzsh) for simplicity and having eyes rewieving/checking malware in source code.
[Prezto](https://github.com/sorin-ionescu/prezto) | Active (2013) | Created in contrast to Oh-My-Zsh, to keep only the plugin manager source code within its Git repo.
[Antigen](https://github.com/zsh-users/antigen) | Active (2013) | Written in Go to speed up the `zsh` stratup.
[`zgen`](https://github.com/tarjoilija/zgen) | Inactive | Fast plugin manager inspired by Antigen (generates a static init script) but written in Zsh to avoid installing Go dependencies when updating the plugin manager. See Nukesor's [fork](https://github.com/Nukesor/zgen) for most recent commits.
[`zplug`](https://github.com/zplug/zplug) | Active | Support all kind of plugin sources: Git repo, Oh-My-Zsh/Prezto plugins, binary artifacts...
[`zinit`](https://github.com/zdharma/zinit) | Active | Inspired by Zplug (`zinit` was formely `zplugin`) but written in C and compiling plugins to bytecode in background (Turbo mode) to be both rich-featured (like Zplug) and having a fast startup.
[Antibody](https://github.com/getantibody/antibody) | Active | Like Antigen (in Go), but aiming to be even faster: for example, Antibody loads earlier the `zsh` and does not require the `apply` statement.
[zr](https://github.com/jedahan/zr) | Active | Simple plugin manager project written in Rust that generates static init script to speed up `zsh` startup.



DevOps
------

* Pour progresser en DevOps (et pas seulement Ops) https://github.com/bregman-arie/devops-exercises
* Un outil très complet (en Java) pour builder les images docker, config K8S, tracking des issues… https://github.com/theonedev/onedev
* Permission Manager is an easy RBAC management for Kubernetes (create users, assign namespaces/permissions, and distribute Kubeconfig YAML files) https://github.com/sighupio/permission-manager
* Configure Elastic cluster https://thoughts.t37.net/designing-the-perfect-elasticsearch-cluster-the-almost-definitive-guide-e614eabc1a87


Hardware
--------

* eBook-like open hardware project  https://github.com/joeycastillo/The-Open-Book


Health & Work efficiency
------------------------

* Long cold shower https://news.ycombinator.com/item?id=22167687 (Netherlands study 2016)


Linux
-----

* Linux screen sharing https://news.ycombinator.com/item?id=22178011
* Awesome Linux software https://github.com/luong-komorebi/Awesome-Linux-Software
* TL;DR Simplified and community-driven man pages https://github.com/tldr-pages/tldr


Privacy
-------

* Do not track visitors/users => Drop all tracking, Disallow anyone to collect any data at all  https://marmelab.com/blog/2020/01/28/about-privacy.html

Popular self-hostable tools to share passwords:

* https://en.wikipedia.org/wiki/List_of_password_managers
* `pass` https://www.passwordstore.org/ Pas de service commercial, adapté à la ligne de commande, par contre, pas possible de partager un mdp entre 2 personnes seulement
* `gopass` https://www.gopass.pw/ Pas de service commercial, 100% compatible avec pass
* KeePassXC https://keepassxc.org/ Fork communautaire de KeePassX, Pas de service commercial, Extension pour browser
    En 2018, la Surveillance Self-Defense cite KeePassXC dans son manuel https://ssd.eff.org/module/creating-strong-passwords (traduit en français: https://ssd.eff.org/fr/module/créer-des-mots-de-passe-robustes)
* Passbolt https://www.passbolt.com/ Commercial, Gratuit pour les projets communautaires, Facile à héberger, on peut changer une ligne en Go pour ne pas payer
* Bitwarden https://bitwarden.com/ Commercial, L'explication sur l'hébergement semble compliqué (12 étapes)


Quikly converge to valuable API
-------------------------------

1. **Design** - Rédiger une documentation pédagogique (Markdown) à destination de l’utilisateur final, cela permet de se mettre dans la peau du client, d’itérer sur ce qu’il lui ferait plaisir, de se baser dessus dans nos échanges, et ainsi de suite jusqu’à obtenir une documentation API mature à publier sur https://docs.example.com
2. **Code** - Une fois, que nous sommes synchronisés et matures dans nos idées, on code avec des annotations afin de générer la documentation à partir du code source (OpenAPI, reDoc…). Coder c’est rencontrer des problématiques techniques auxquelles nous n’avions pas pensées, et cela nous permet d’accumuler du retour d’expérience, de gagner encore plus en maturité, et on implémente une API différente. La génération de la documentation est mise à disposition sur https://openapi.exemple.com et https://redoc.exemple.com
3. **Test** - On commence à avoir une première ébauche de l’API, on commence à mettre à jour la documentation pédagogique (Markdown), on commence à tester l’API, des premiers utilisateurs nous font des remarques… encore de nouvelles idées pour simplifier, pour clarifier… on re-code… on re-documente… on itère…
4. **Deliver** - Au final, on en a marre de toujours tout chambouler, on finalise dans l’état actuel, on stabilise, on livre ! On garde nos bonnes idées pour la version suivante :-D

JSON
----

### One JSON per line

The "JSON Lines" formats: https://jsonlines.org/on_the_web/

The mos popular is `application/x-ndjson` http://ndjson.org/

### JSON/JWT versus CBOR/CWT

Une alternative au JWT, est le CWT dont la [RFC 8392](https://www.rfc-editor.org/rfc/rfc8392.html) (may 2018) explique bien l'intérêt.

Le CWT utilise CBOR à la place de JSON, CBOR étant une variante binaire du JSON.

Il existe une dizaine de formats binaires pour JSON (comme BSON, MessagePack...), mais seul CBOR est traité dans les RFC, donc CBOR semble être mieux standardisé.

See also: [RFC 8747](https://www.rfc-editor.org/rfc/rfc8747.html) (Proof-of-Possession Key Semantics for CBOR Web Tokens).

### JSON dealing with float and 64-bit numbers

Une API qui gère des nombres 64 bits et des prix exprimés par des flottants double précision :

* Pour le CSV, pas de problème.

* Mais pour le JSON qui va être manipulé par du JavaScript, c'est plus délicat, voir l'[Appendice D de la RFC 8785](https://www.rfc-editor.org/rfc/rfc8785.html#section-appendix.d)

En attendant que tous les navigateurs web soient compatibles avec ECMAScript 2021 ([`BigInt`][]), l'API devrait prendre en charge le format I-JSON :

> The API uses a JSON subset format called ["Internet JSON"](https://tools.ietf.org/html/rfc7493) (I-JSON) in order to guaranty a better interoperability with any client software:
* UTF-8
* non-duplicated JSON member names
* time and date as string in [ISO 8601][] format (except when expressed in nanoseconds since epoch)
* binary blobs in [base64url][] (not to be confused with other [base64 variants][])
* [double-precision float][] ([IEEE 754][] binary64)
>
> However, the API uses the 64-bit signed integer type with the full range [-2⁶³, 2⁶³-1] because modern JavaScript (ECMAScript 2021) supports [`BigInt`][] type and are no more [limited][] to the [-2⁵³+1, 2⁵³-1] range.
All other popular programming languages do not have this number range limitation.
See also [RFC 8785 Appendix D](https://www.rfc-editor.org/rfc/rfc8785.html#section-appendix.d).

[base64url]:       https://tools.ietf.org/html/rfc4648#section-5
[base64 variants]: https://en.wikipedia.org/wiki/Base64#Variants_summary_table
[IEEE 754]:        https://en.wikipedia.org/wiki/IEEE_754 "Standard for Floating-Point Arithmetic"
[double-precision float]: https://en.wikipedia.org/wiki/Double-precision_floating-point_format#IEEE_754_double-precision_binary_floating-point_format:_binary64 "IEEE 754 binary64 floating-point format"
[`BigInt`]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt
[limited]:  https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#Integer_range_for_Number


Other
-----

* Database inside https://github.com/pingcap/awesome-database-learning
* I hate Regex https://github.com/geongeorge/i-hate-regex
* [The Book of Secret Knowledge](https://github.com/trimstray/the-book-of-secret-knowledge/blob/master/README.md#anger-table-of-contents), various materials and tools, manuals, cheatsheets, blogs, hacks, one-liners, cli/web tools…
* Interactive kill https://github.com/sindresorhus/fkill-cli
* Coopérative http://www.coopaname.coop/article/coopaname-cest-politique


Public Domain Dedication
========================

CC0 1.0 Universal
-----------------

[Creative Commons Zero] &emsp; *No Rights Reserved*  &emsp; ![(CC) ZERO] &nbsp; ![(0) PUBLIC DOMAIN]

[Creative Commons Zero]: https://creativecommons.org/publicdomain/zero/1.0/deed "CC0 summary for non-lawyers"
[(CC) ZERO]:             https://licensebuttons.net/l/zero/1.0/80x15.png "Logo Creative Commons Zero (CC0) 1.0"
[(0) PUBLIC DOMAIN]:     https://licensebuttons.net/p/zero/1.0/80x15.png "Logo CC0 1.0 Public Domain"

To the extent possible under law, [olibre](mailto:olibre@Lmap.org)
has waived all copyright and related or neighboring rights to [GreatPractices].
This work is published from France since 2015.
Refer to [CC0 Legal Code] or a copy in file [`COPYING`].

[CC0 Legal Code]: https://creativecommons.org/publicdomain/zero/1.0/legalcode "CC0 full legal text for lawyers"
[GreatPractices]: https://github.com/olibre/GreatPractices "GreatPractices project hosted on GitHub"
[`COPYING`]:      ./COPYING
