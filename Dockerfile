FROM ubuntu:20.04
LABEL VERSION=23.02

ARG DEBIAN_FRONTEND=noninteractive
ARG JOBS=4

#
# Install custom Genode toochain
#
ENV GENODE_DEPS="make libncurses5-dev texinfo libexpat-dev gnat wget \
                 libsdl1.2-dev tclsh expect byacc qemu xorriso autoconf2.64 \
                 autogen bison flex g++ git gperf libxml2-utils \
                 subversion xsltproc libssl-dev bc qemu-system-x86"

RUN apt update && \
    apt install -y ${GENODE_DEPS} && \
    apt clean

COPY genode /genode
WORKDIR /genode

RUN tool/tool_chain x86      SUDO= MAKE_JOBS=${JOBS} && \
    tool/tool_chain cleanall SUDO= MAKE_JOBS=${JOBS} && \
    rm -rf /genode

WORKDIR /

#
# Install Goa workflow tool
#
ENV GOA_DIR=/usr/local/goa
ENV GOA_DEPS="libsdl1.2-dev tclsh libxml2-utils gpg"

RUN apt update && \
    apt install -y ${GOA_DEPS} && \
    apt clean

COPY goa ${GOA_DIR}
ENV PATH="$PATH:/usr/local/goa/bin"
