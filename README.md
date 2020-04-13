Good and Great Practices for Coders
===================================

> *Empowering practices for happy coders about Git, Unit tests, C++, Python, Java, Gradle, CMake, Agile, GNU/LInux installation, pandoc... &nbsp; Not the best or the greatest because any one can propose improvements :-)*

This documentation is maintained with faireness in mind and shared in [Public Domain](#public-domain-dedication).

View this Markdown file [in presentation format](http://olibre.github.io/GreatPractices/pres.html#/) (reveal.js).


Internal documentation
======================

* [GNU/Linux installation for coders](./install)
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



External documentation
======================


Design
------

* Ant Design https://pro.ant.design/
* Material Design https://material.io/
* Illustrations libres/gratuites https://dev.to/ahmed_sulaiman/13-places-to-find-beautiful-free-illustrations-580e
* 25 videos to learn CSS Grid https://cssgrid.io/ 


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

* Python Cheatsheet https://github.com/gto76/python-cheatsheet
* Python-based algorithms https://github.com/TheAlgorithms/Python
* Python debugger/profiler (program flow visualizations) useful for algo learning https://github.com/CCExtractor/vardbg ([Y combinator](https://news.ycombinator.com/item?id=22170206))
* Python coloured output https://github.com/willmcgugan/rich
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
* Machine Learning System designs from Facebook, Twitter, Google, Airbnb, Uber, Instagram and Netflix
    - Twitter Newsfeed https://blog.twitter.com/engineering/en_us/topics/insights/2017/using-deep-learning-at-scale-in-twitters-timelines.html
    - Twitter Ads https://blog.twitter.com/engineering/en_us/topics/insights/2019/improving-engagement-on-digital-ads-with-delayed-feedback.html
    - Instagram Newsfeed https://instagram-engineering.com/lessons-learned-at-instagram-stories-and-feed-machine-learning-54f3aaa09e56
    - Instagram Explore https://ai.facebook.com/blog/powered-by-ai-instagrams-explore-recommender-system/
    - Facebook Deep Entity Classification https://engineering.fb.com/security/fighting-abuse-scale-2019/
    - Uber Eats Recommendations
        - https://eng.uber.com/uber-eats-query-understanding/
        - https://eng.uber.com/uber-eats-recommending-marketplace/
        - https://eng.uber.com/uber-eats-graph-learning/
    - Uber Maps https://eng.uber.com/nlp-deep-learning-uber-maps/
    - Airbnb
        - https://medium.com/airbnb-engineering/using-machine-learning-to-predict-value-of-homes-on-airbnb-9272d3d4739d
        - https://medium.com/airbnb-engineering/listing-embeddings-for-similar-listing-recommendations-and-real-time-personalization-in-search-601172f7603e
        - https://medium.com/airbnb-engineering/learning-market-dynamics-for-optimal-pricing-97cffbcc53e3
        - https://medium.com/airbnb-engineering/categorizing-listing-photos-at-airbnb-f9483f3ab7e3
        - https://medium.com/airbnb-engineering/applying-deep-learning-to-airbnb-search-7ebd7230891f
        - https://medium.com/airbnb-engineering/discovering-and-classifying-in-app-message-intent-at-airbnb-6a55f5400a0c
    - Airbnb Experiences https://medium.com/airbnb-engineering/machine-learning-powered-search-ranking-of-airbnb-experiences-110b4b1a0789
    - Google http://highscalability.com/blog/2016/3/16/jeff-dean-on-large-scale-deep-learning-at-google.html
    - Linkedin https://engineering.linkedin.com/blog/topic/feed-personalization
    - Netflix Recommendations https://youtu.be/kY-BCNHd_dM
    - Spotify Recommendations https://medium.com/s/story/spotifys-discover-weekly-how-machine-learning-finds-your-new-music-19a41ab76efe


Dev tools
----------

* `diffoscope` https://diffoscope.org/
* `icdiff` https://www.jefftk.com/icdiff
* DevTodo, command line TODO manager https://swapoff.org/devtodo.html
* Collection of .gitignore Templates https://github.com/github/gitignore
* Command line notes and tips https://github.com/jlevy/the-art-of-command-line


CSS
---

* Simpsons https://pattle.github.io/simpsons-in-css/
* Font Awesome https://fontawesome.com/
* Material Design Icons https://materialdesignicons.com/
* Ionicons https://ionicons.com/
* CSS Theme Switcher by Reverse-Engineering https://www.youtube.com/watch?v=rXuHGLzSmSE


SEO
---

* 12 SEO practices https://ahrefs.com/blog/seo-best-practices/


DevOps
------

* Pour progresser en DevOps (et pas seulement Ops) https://github.com/bregman-arie/devops-exercises
* Un outil très complet (en Java) pour builder les images docker, config K8S, tracking des issues… https://github.com/theonedev/onedev
* Permission Manager is an easy RBAC management for Kubernetes (create users, assign namespaces/permissions, and distribute Kubeconfig YAML files) https://github.com/sighupio/permission-manager
* Configure Elastic cluster https://thoughts.t37.net/designing-the-perfect-elasticsearch-cluster-the-almost-definitive-guide-e614eabc1a87


Artificial Intelligeance
------------------------

* Introduction to Deep Learning https://github.com/aamini/introtodeeplearning


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
* Oh My Zsh https://github.com/ohmyzsh/ohmyzsh


Other
-----

* Database inside https://github.com/pingcap/awesome-database-learning
* I hate Regex https://github.com/geongeorge/i-hate-regex
* [The Book of Secret Knowledge](https://github.com/trimstray/the-book-of-secret-knowledge/blob/master/README.md#anger-table-of-contents), various materials and tools, manuals, cheatsheets, blogs, hacks, one-liners, cli/web tools…
* Interactive kill https://github.com/sindresorhus/fkill-cli
* Coopérative http://www.coopaname.coop/article/coopaname-cest-politique
* Respect [internaut](https://en.wikipedia.org/wiki/Internaut) privacy => Drop all tracking, Disallow anyone to collect any data at all  https://marmelab.com/blog/2020/01/28/about-privacy.html



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
