FROM alpine:3.23 

RUN apk add --no-cache \
  neovim \
  tmux \
  git \
  ripgrep \
  fzf \
  curl \
  bash \
  stow

RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm


COPY . /root/devenv

RUN cd /root/devenv && stow tmux nvim

WORKDIR /workspace
CMD ["bash"]

