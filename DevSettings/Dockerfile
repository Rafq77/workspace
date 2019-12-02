 
  # build image
  #   docker build --build-arg http_proxy=http://3128 -t focus-dev .
  #  docker run -u `id -u`:`id -g` --net=host -v /home/sosr:/home/sosr -v /etc/passwd:/etc/passwd --rm -it ide_sosr:latest
 
  FROM ubuntu:disco
 
  ARG USER_NAME="sosr"
  ARG PW="sosr"
 
  ENV USER_NAME $USER_NAME
 
  # Install Base system
  RUN \
    apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      cmake \
      git \
      clang \
      vim \
      g++ \
      zsh \
      make \
      python \
      python-jinja2 \
      python-pkg-resources \
      valgrind  \
      exuberant-ctags \
      fonts-powerline \
      locales \
      wget \
      fzf \
      ripgrep \
      graphviz \
      doxygen \
      xvfb \
	  tmux && \
    rm -rf /var/cache/apt/archives && \
    rm -rf /*.deb
 
  # Provide vzug specific font
  COPY ./fonts/* /usr/share/fonts/
 
  RUN \
    chmod a+rx /usr/share/fonts/*.ttf && \
    ln -s /usr/lib/x86_64-linux-gnu/dri /usr/lib/dri && \
    ln -s /lib/x86_64-linux-gnu/ld-2.29.so /lib/ld-linux-x86-64.so.2 && \
    ln -s /lib/x86_64-linux-gnu/libc.so.6 /lib64/libc.so.6 && \
    ln -s /opt /esm && \
    ln -s /esm/poky-focus /esm/poky-focus-1.0 && \
    mkdir -p /opt/poky-focus
 
  RUN \
    locale-gen en_US.UTF-8 && \
    adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME && \
    echo "${USER_NAME}:${PW}" | chpasswd && usermod -aG sudo $USER_NAME
 
  # the user we're applying this too (otherwise it most likely install for root)
  USER $USER_NAME
  ENV TERM screen-256color-bce
  ENV ZSH_THEME agnoster
  ENV LANG "en_US.UTF-8"
  ENV FZF_DEFAULT_COMMAND "rg --files --hidden"
 
 
  WORKDIR /home/$USER_NAME
 
  RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true ; #chmod +x ./install.sh; sh ./install.sh; rm ./install.sh #
 
  ENTRYPOINT ["zsh"]
 
