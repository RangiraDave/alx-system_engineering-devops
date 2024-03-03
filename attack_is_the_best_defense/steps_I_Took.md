## Task0
- downloaded the script
- seen the man for tcpdump
- opened two terminal windows
- On first I started ```sudo tcpdump -i host smtp.sendgrid.net -w logz.pcap``` command
- In another window I ran the script(to sniff the packets from)
- opped logz.pcap in the wireshark
- looked where it is written pass(Or password)
- Took the value and used ```echo 'value(bXlwYXNzd29yZDk4OTgh)' | base64 --decode``` to get the actaul password.
- put the password in the 0-sniffing file.


## Task1
- Installed Docker: ```sudo snap install docker```
- Installed hydra: ```sudo apt install hydra```
- Ran the docker image: ```sudo docker run -p 2222:22 -d -ti sylvainkalache/264-1```
> Corrected dictionaries from github
> Used ```grep -l '(\w{11})' <mix-number-words file> > 11-common_pass.txt```
> Then used hydra command ```sudo hydra -l sylvain -P 11-10k_common.txt 127.0.0.1 ssh```
