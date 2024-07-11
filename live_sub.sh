#! /bin/bash
red=$`tput setaf 1`
green=$`tput setaf 2`
magenta=$`tput setaf 5`
reset=$`tput sgr0`
greetings(){
echo "Welcome `tput setaf 2` $USER! `tput sgr0`. You are using `tput setaf 7` LIVE SUBDOMAINS FINDER `tput sgr0` coded by `tput setaf 4` Variares `tput sgr0`" 
echo "Please make sure you have `tput setaf 1 `'assetfinder'`tput sgr0` and `tput setaf 6`'httprobe'`tput sgr0` installed in your system"
}
greetings 
echo "                                                    
__   _____ _ __   ___  _ __ ___  
\ \ / / _ \ '_ \ / _ \| '_  ``_   \ 
 \ V /  __/ | | | (_) | | | | | |
  \_/ \___|_| |_|\___/|_| |_| |_|  
  "                                                                       
                                                                               
read -p "`tput setaf 3` Enter the Domain `tput sgr0` : " dom
echo " `tput setaf 6` It may take a while depending on the number of subdomains. Sit back and relax :) `tput sgr0` "
end()
{
echo " `tput sgr0` ==== `tput setaf 3` Process Completed!. Thank you for using `tput sgr0` `tput setaf 5` LIVE SUBDOMAINS FINDER`tput sgr0` ===="
}
step1()
{
assetfinder --subs-only $dom > subs.txt
}
step2()
{
cat subs.txt | httprobe `tput sgr0` > live_subs.txt
}
step3()
{
while read url ; do
	echo ${url#*//} >> urls.txt
done < live_subs.txt
sort -u urls.txt > sorted_subs.txt
echo "++++++++  Live Subdomains of `tput setaf 5 ` $dom `tput sgr0` ++++++++" `tput setaf 4`
cat  sorted_subs.txt 
echo "`tput setaf 2`======================================== `tput sgr0`"
echo "Result saved in `tput setaf 4` live_subs.txt `tput sgr0`"
rm urls.txt
rm live_subs.txt
rm subs.txt
}
step1
step2
step3
end
