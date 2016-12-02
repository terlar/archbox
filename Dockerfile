FROM finalduty/archlinux:weekly
MAINTAINER Terje Larsen

ENV USER=r

RUN useradd -m -G wheel -s /bin/bash $USER \
    && echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /install
COPY Makefile Puppetfile Puppetfile.lock /install/
COPY tools /install/tools/
COPY packages /install/packages/

RUN pacman --noconfirm -Syu make
RUN make bootstrap

COPY lib /install/lib/
COPY manifests /install/manifests/
COPY modules /install/modules/
