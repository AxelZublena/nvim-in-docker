FROM archlinux:latest

RUN pacman -Syyu --noconfirm
RUN pacman -S --noconfirm \
    neovim git  \
    zsh tmux openssh bash \
    curl less man-db fzf fd \
    unzip wget \
    nodejs npm python3 \
    base base-devel gcc

RUN npm install -g tree-sitter tree-sitter-cli

RUN useradd -G wheel,audio,video -m archlinux -p archlinux
USER archlinux 

RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY --chown=archlinux .zshrc /home/archlinux/.zshrc
COPY --chown=archlinux nvim /home/archlinux/.config/nvim

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

EXPOSE 80
EXPOSE 443
#RUN nvim --headless -c 'TSInstall python typescript javascript svelte c rust html lua quitall'

#ENTRYPOINT ["nvim"]
