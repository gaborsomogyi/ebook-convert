FROM ubuntu:16.04

MAINTAINER Gábor Somogyi

RUN apt-get update
RUN apt-get install -y wget python xz-utils xdg-utils
RUN apt-get clean

RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.py | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

WORKDIR /home

ENTRYPOINT ["ebook-convert"]
