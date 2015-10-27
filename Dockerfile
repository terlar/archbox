FROM l3iggs/archlinux
MAINTAINER Terje Larsen

WORKDIR /install
COPY Makefile /install/
COPY tools /install/tools/
COPY packages /install/packages/

RUN pacman --noconfirm -S make
RUN make bootstrap

COPY lib /install/lib/
COPY manifests /install/manifests/
COPY modules /install/modules/
