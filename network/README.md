Tools and tricks about network
==============================

Overview of a PCAP file
-----------------------

    tshark -r /tmp/full-solar-filtred.pcap -q -z conv,tcp

Filter port range
-----------------

`tcpdump` is oversseded by newcommer `tshark` for some tasks:

    sudo tcpdump -Z "$USER" -r my-big.pcap -w only-ports-1100x.pcap portrange 11000 11009
    
    tshark -r my-big.pcap -w only-ports-1100x.pcap -Y '((tcp.srcport>=11000 && tcp.srcport<=11009) || (tcp.dstport>=11000 && tcp.dstport<=11009))'

`man pcap-filter` documents `tcpdump` filtering.




