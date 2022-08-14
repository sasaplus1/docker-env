FROM ubuntu:22.10

RUN groupadd -g 61000 sasaplus1 && \
  useradd -g 61000 -l -m -s /bin/bash -u 61000 sasaplus1 -G sudo,root

RUN apt-get --yes update && \
  apt-get --yes install curl file git make sudo

RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER sasaplus1

WORKDIR /home/sasaplus1

RUN rm -f $HOME/.bash_logout $HOME/.bashrc $HOME/.profile

RUN git clone https://github.com/sasaplus1/setup $HOME/.ghq/github.com/sasaplus1/setup && \
  make setup -C $HOME/.ghq/github.com/sasaplus1/setup && \
  make install-apt-packages -C $HOME/.ghq/github.com/sasaplus1/setup

RUN git clone https://github.com/sasaplus1/dotfiles $HOME/.ghq/github.com/sasaplus1/dotfiles && \
  make deploy -C $HOME/.ghq/github.com/sasaplus1/dotfiles

CMD ["bash"]
