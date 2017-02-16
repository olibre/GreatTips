
Developer Toolset
=================

This chapter is about Red Hat and RPM satellite.

Add artifact repositories
-------------------------

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

Install
-------

    yum install devtoolset-4


Usage
-----

Add `slc_source` in yor `~/.bashrc` to use by default the latest `devtoolset`.

    echo 'source scl_source enable devtoolset-4' >> ~/.bashrc

Or just enable it within a sub-shell on-demand.

    scl enable devtoolset-4 bash

