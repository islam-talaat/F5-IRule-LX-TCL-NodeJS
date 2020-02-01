# F5-IRule-LX

I developed this rule to use it as a workaround to change the DNS RD (recursive desired) bit to be '1' but the traditional IRule wasn't working 

the irule LX is an impressive feature that we can use to redirect the payload of the DNS request to the NodeJs module in the big-ip

using NodeJS we can change the RD bit to be One and redirect the packet again to the IRule

Note: the F5 support Created an Engineering Hotfix to fix the bug in the traditional IRule but i enjoyed the journey and discovered a new Feature in my beloved BIG-IP :)
