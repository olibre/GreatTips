

Remove SSH banner
=================

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


