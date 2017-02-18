

VirtualBox
==========

VirtualBox is a Virtual Machine Monitor (hypervisor) running on Windows/Linux/Mac.
For example, VirtualBox can:

* Host a Windows VM on Linux
* Host a Linux VM on Windows

Installation
------------

* Windows: https://www.virtualbox.org/wiki/Downloads
* Linux

        sudo apt install virtualbox

Guest-Additions
---------------

The **Guest-Additions** improves the user experience: drag-and-drop and better mouse integration.
You do not need to install it because it is now part of a the default installation.

Extension Pack
--------------

The VirtualBox [Extension Pack](https://en.wikipedia.org/wiki/VirtualBox#VirtualBox_Extension_Pack) implements the USB 2 & 3 and Remote Desktop protocols. But its end-user license ([PUEL](https://www.virtualbox.org/wiki/VirtualBox_PUEL)) forbids free professional use (only commercial license).

Please do **NOT** install it because you may not need USB 2 & 3 and Remote Desktop protocols.

Increase the size of a disk image
----

See http://superuser.com/a/1147292/112297

Access network
--------------

To enable access network, the VM may be set in **NAT** mode.
Run also the following command from host:

        VBoxManage modifyvm "VM name" --natdnshostresolver1 on

Increase network throughput
---------------------------

If the throughput from the VM is slower than the host.  

* in the network settings of the VM,  
  change the "Adaptater type" of the interfaces  
  to "Paravirtualized Network (virtio-net)".

Reduce the size of a VirtualBox filesystem
------------------------------------------

This section aims to reduce the file having the extension `*.vdi`.

1. Nullify the free space

    * Linux guest

            sudo dd if=/dev/zero of=/deleteme bs=4M; sudo rm /deleteme

    * Windows guest (download SDelete: http://technet.microsoft.com/en-us/sysinternals/bb897443)

            sdelete.exe C: -z

2. Shutdown the guest VM

3. Compact the disk file

    * Linux host

            vboxmanage modifyhd <path_to_disk.vdi> --compact

    * Windows guest (download SDelete: http://technet.microsoft.com/en-us/sysinternals/bb897443)

            "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" modifyhd <path_to_disk.vdi> --compact

Perl
====

Linux
-----

    sudo apt install perl

Windows
-------

Tree main projects provide Perl for Windows:

1. **Strawberry Perl**

   100% Open Source Perl for Windows.

   Exactly the same as Perl on Linux
   including CPAN modules
   without the need for extra binary packages.

   http://strawberryperl.com/

2. **DWIM Perl**

   100% Open Source Perl for Windows, based on above **Strawberry Perl**.

   It aims to include as many useful CPAN modules as possible.

   It even comes with Padre, the Perl IDE.

   http://dwimperl.com/windows.html

3. **ActiveState Perl**

   Two versions: Community (free) and Commercial.

   http://www.activestate.com/activeperl/downloads


Java Developement Kit
=====================

Download **Java SE Development Kit** without Demos and Samples:

http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

Java Cryptography Extension
---------------------------

Vanilla Java is limited on security strength (e.g. password length) to comply with potential country cryptographic restrictions.

For strong security keys, use the [Java Cryptography Extension](https://en.wikipedia.org/wiki/Java_Cryptography_Extension) (JCE).

1. Download the JCE Unlimited Strength Jurisdiction Policy archive (zip).

   http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html

2. Copy the two JAR files from the above archive to the Java installation (`JRE/lib/security`).

   Overwrite the local `local_policy.jar` and `US_export_policy.jar` files.


Apache Ant
==========

Installation steps: http://ant.apache.org/manual/install.html

1. Download Zip file:

   http://ant.apache.org/bindownload.cgi?Preferred=http%3A%2F%2Fapache.crihan.fr%2Fdist%2F#Current%20Release%20of%20Ant

   The archive contains shell scripts that executes the JVM (java).  
   The parameters from scripts are provided to the `ant.jar` bytecode.

2. Define two environment variables:

    * **`JAVA_HOME`**
    * `**ANT_HOME**`

3. Append **`;%JAVA_HOME%\bin;%ANT_HOME%\bin`** to the environment variables `**%Path%**`.

   Ant uses the environment variable **`%JAVA_HOME%`** and does search `**java**` within the `**%Path%**`.
   The **`%JAVA_HOME%\bin`** in `**%Path%**` is not for Ant but mau be required for other tools.


Eclipse
=======

Eclipse is not required to build java application but an IDE is useful for edition and for debugging the application.

If you have installed the JDK 32 bits, you have to install Eclipse 32 bits.

Choose "Eclipse IDE for Java Developers" from download page:  
http://www.eclipse.org/downloads/eclipse-packages/


Visual Studio Express
=====================

This chapter is written for the version 2012.

Download the file `wdexpress_full.exe`  
https://www.microsoft.com/download/details.aspx?id=34673

The other file `VS2012_WDX_ENU.iso` may be required (to be verified...)

Visual Studio requires at least 5GB free space on local storage.

On first run, Visual Studio requests a product key.  
Use the provided link to create an account on Microsoft website.
