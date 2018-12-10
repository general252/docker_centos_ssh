# version: 0.0.1

FROM centos:7

MAINTAINER MNicholas "chuanlin252@163.com"

RUN cd /home \
    && echo root:"123456" | chpasswd \
    && yum install -y openssh-server \
    && ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' \
    && ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
    && ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N '' \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && rm -rf ~/.cache/pip/*

WORKDIR /home

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
