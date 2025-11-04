#!/bin/bash

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
z="\033[96m"
NC='\e[0m'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`

BURIQ () {
    curl -sS https://raw.githubusercontent.com/nexus-bot-dev/register-with-bot/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/nexus-bot-dev/register-with-bot/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/nexus-bot-dev/register-with-bot/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

x="ok"


PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/nexus-bot-dev/register-with-bot/main/ip | grep $MYIP | awk '{print $3}')
fi
# usage
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/root/t1
bulan=$(date +%b)
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
todayd=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /root/t1)" != '0' ]; then
    bulan=$(date +%b)
    month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
    month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $10}')
    month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
    month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $4}')
    month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
    month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $7}')
else
    bulan=$(date +%Y-%m)
    month=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $8}')
    month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $9}')
    month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $2}')
    month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $3}')
    month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $5}')
    month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /root/t1)" != '0' ]; then
    yesterday=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $8}')
    yesterday_v=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $9}')
    yesterday_rx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $2}')
    yesterday_rxv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $3}')
    yesterday_tx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $5}')
    yesterday_txv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $6}')
else
    yesterday=NULL
    yesterday_v=NULL
    yesterday_rx=NULL
    yesterday_rxv=NULL
    yesterday_tx=NULL
    yesterday_txv=NULL
fi
# // Clear
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel5 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi

purple="\033[1;95m"
r="\033[1;31m"  #REDTERANG
Blue="\033[0;34m"
y='\033[1;33m' #yellow
g="\033[1;92m"
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$(curl -s ipinfo.io/org )
#######################
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let trb=$trx/2
ssx=$(grep -c -E "^#ss# " "/etc/xray/config.json")
let ssa=$ssx/2
########################
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
clear
echo -e " ${BIBlue}           ┌───────────────────────────────┐$NC"
echo -e " ${BIBlue}           │   ${NC}${BIBlue}.::.${BIYellow}NEXUS TUNNEL${BIBlue}.::.$NC    " ${BIBlue} │
echo -e " ${BIBlue}           └───────────────────────────────┘$NC"
echo -e "${BIBlue} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e " ${BIBlue}│$NC  $y System OS ${NC}        $Blue:$NC  "`hostnamectl | grep "Operating System" | cut -d ' ' -f5-` $NC
echo -e " ${BIBlue}│$NC  $y Server Ram ${NC}       $Blue:$NC  $uram MB/ $tram MB${NC}"
echo -e " ${BIBlue}│$NC  $y CPU Usage ${NC}        $Blue:$NC  $cpu_usage ${NC}"
echo -e " ${BIBlue}│$NC  $y ISP ${NC}              $Blue:$NC  $(curl -s ipinfo.io/org)${NC}"
echo -e " ${BIBlue}│$NC  $y CITY ${NC}             $Blue:$NC  $(curl -s ipinfo.io/timezone )${NC}"
echo -e " ${BIBlue}│$NC  $y Domain ${NC}           $Blue:$NC  $(cat /etc/xray/domain)${NC}"
echo -e " ${BIBlue}│$NC  $y IP-VPS ${NC}           $Blue:$NC  $IPVPS${NC}"
echo -e " ${BIBlue}│$NC  $y Date & Time ${NC}      $Blue:$NC  $( date -d "0 days" +"%d-%m-%Y | %X" ) ${NC}"
echo -e " ${BIBlue}│$NC  $y System Uptime ${NC}    ${Blue}: $NC $uphours $upminutes $uptimecek"
echo -e " ${BIBlue}└─────────────────────────────────────────────────────┘${NC}"
DATE=$(date +'%d %B %Y')
datediff() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    echo -e "${BIYellow}         $NC$y  Expiry In$NC     $Blue:$NC$BIBlue $(( (d1 - d2) / 86400 ))$BIBlue Days "
}
mai="datediff "$Exp" "$DATE""
echo -e "     ${BICyan} SSH ${NC}: $ressh"" ${BICyan} NGINX ${NC}: $resngx"" ${BICyan}  XRAY ${NC}: $resv2r"" ${BICyan} TROJAN ${NC}: $resv2r"
echo -e "   ${BICyan}     STUNNEL ${NC}: $resst" "${BICyan} DROPBEAR ${NC}: $resdbr" "${BICyan} SSH-WS ${NC}: $ressshws"
echo -e "${BIBlue} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "   $r ${BIYellow}Traffic${NC}      ${BIYellow}Today       Yesterday       Month   ${NC}"
echo -e "   $r ${BIBlue}Download${NC}   ${BIBlue}$today_tx $today_txv      $yesterday_tx $yesterday_txv      $month_tx $month_txv   ${NC}"
echo -e "   $r ${BIBlue}Upload${NC}     ${BIBlue}$today_rx $today_rxv      $yesterday_rx $yesterday_rxv      $month_rx $month_rxv   ${NC}"
echo -e "   $r ${BIBlue}Total${NC}    ${BIBlue}  $todayd $today_v     $yesterday $yesterday_v      $month $month_v  ${NC} "
echo -e " ${BIBlue}└─────────────────────────────────────────────────────┘${NC}"
echo -e "${BIBlue}        ┌─────────────────────────────────────┐" 
echo -e "${BIYellow}         $NC$y  User$NC          $Blue:$BIBlue $Name " 
if [ $exp \< 1000 ];
then
echo -e "       $z $NC$y License      : $b $sisa_hari $b Days Tersisa $NC"
else
    datediff "$Exp" "$DATE"
fi;
echo -e "${BIBlue}        └─────────────────────────────────────┘"
echo -e "${BIBlue} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BICyan}    ${BIYellow}SSH         VMESS           VLESS          TROJAN $NC"
echo -e "${BICyan}    ${Blue} $ssh1           $vma               $vla              $trb $NC"
echo -e "${BIBlue} └─────────────────────────────────────────────────────┘${NC}"
echo -e " ${BIBlue}┌─────────────────────────────────────────────────────┐"
echo -e "    $y 1.$NC $BIBlue MENU SSH$NC                $y 6.$NC $BIBlue BACKUP/RESTORE$NC" 
echo -e "    $y 2.$NC $BIBlue MENU VMESS$NC              $y 7.$NC $BIBlue SETTINGS$NC"    
echo -e "    $y 3.$NC $BIBlue MENU VLESS$NC              $y 8.$NC $BIBlue INFO PORT$NC"    
echo -e "    $y 4.$NC $BIBlue MENU TROJAN$NC             $y 9.$NC $BIBlue CEK AKUN$NC" 
echo -e "    $y 5.$NC $BIBlue SHADOWSOCKS$NC             $y x.$NC $BIBlue EXIT SCRIPT$NC"     
echo -e " ${BIBlue}└─────────────────────────────────────────────────────┘"
echo -e "                   Version : 1.4.2 ${NC}" | lolcat
echo -e "                   _______________${NC}" | lolcat
echo
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-ss ;;
6) clear ; menu-backup ;;
7) clear ; menu-set ;;
8) clear ; info ;;
9) clear ; cat /etc/log-create-user.log ;;
99) clear ; update ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; menu ;;
esac
