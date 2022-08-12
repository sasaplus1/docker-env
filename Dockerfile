FROM ubuntu:22.10

RUN groupadd -g 61000 sasaplus1 && \
  useradd -g 61000 -l -m -s /bin/bash -u 61000 sasaplus1 -G sudo,root

RUN apt-get --yes update && \
  apt-get --yes install sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER sasaplus1

WORKDIR /home/sasaplus1

CMD ["bash"]
