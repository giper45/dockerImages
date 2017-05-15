# Docker container with metasploit.
#
# Use Kali Linux base image (2.0)
FROM linuxkonsult/kali-metasploit
RUN apt-get update && apt-get install -y libssl-dev 
RUN sudo apt-get install -y vim nano \ 
net-tools iputils-ping telnet tcpdump nmap  ssh fping dsniff ftp \ 
gcc make build-essential bsdmainutils hydra john sqlmap

ENV DEBIAN_FRONTEND noninteractive

# Attach this container to stdin when running, like this:
# docker run -t -i linux/kali/metasploit
ADD files/shellinabox.tar.gz /tmp/
ADD files/entrypoint.sh /usr/local/sbin/
COPY files/addroute.sh  /addroute.sh
# RUN './init.sh'

ENV SIAB_VERSION=2.19 \
  SIAB_USERCSS="Normal:+/etc/shellinabox/options-enabled/00+Black-on-White.css,Reverse:-/etc/shellinabox/options-enabled/00_White-On-Black.css;Colors:+/etc/shellinabox/options-enabled/01+Color-Terminal.css,Monochrome:-/etc/shellinabox/options-enabled/01_Monochrome.css" \
  SIAB_PORT=4200 \
  SIAB_ADDUSER=true \
  SIAB_USER=kali \
  SIAB_USERID=1000 \
  SIAB_GROUP=kali \
  SIAB_GROUPID=1000 \
  SIAB_PASSWORD=kali \
  SIAB_SHELL=/bin/bash \
  SIAB_HOME=/home/guest \
  SIAB_SUDO=true \
  SIAB_SSL=false \
  SIAB_SERVICE=/:LOGIN \
  SIAB_PKGS=none \
  SIAB_SCRIPT=none

LABEL ports="4200" \
      type="entry_point" \
      caps_add="NET_ADMIN" \
      actions.addroute.command="/addroute.sh" \ 
      actions.addroute.description="Add a new route for the subnet : set router ip and subnet " \ 
      actions.addroute.args.subnet.val="192.168.1.0/24" \
      actions.addroute.args.subnet.rule.name="subnet" \
      actions.addroute.args.subnet.type="text" \
      actions.addroute.args.router_ip.val="" \
      actions.addroute.args.router_ip.rule.name="ip" \
      actions.addroute.args.router_ip.type="text" 
# Install metasploit and shellinabox
#  RUN apt-get clean && \
  #rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  #ln -sf '/etc/shellinabox/options-enabled/00+Black on White.css' \
  #  /etc/shellinabox/options-enabled/00+Black-on-White.css && \
  #ln -sf '/etc/shellinabox/options-enabled/00_White On Black.css' \
  #  /etc/shellinabox/options-enabled/00_White-On-Black.css && \
  #ln -sf '/etc/shellinabox/options-enabled/01+Color Terminal.css' \
  #  /etc/shellinabox/options-enabled/01+Color-Terminal.css 
  #&& \
 # apt-get install --force-yes install ruby metasploit-framework \


VOLUME /etc/shellinabox /var/log/supervisor /home
ENTRYPOINT ["entrypoint.sh"]
CMD ["shellinabox"]
