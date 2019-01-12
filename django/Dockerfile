FROM python

COPY ./requirements.txt .

RUN pip install -r requirements.txt

RUN apt update && apt install -y --no-install-recommends \
  zsh \
  vim \
  tree

RUN chsh -s /usr/bin/zsh && \
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

RUN git clone https://github.com/bluebrown/dotfiles.git  ~/dotfiles && \
    /bin/bash -c '~/dotfiles/fiddle.sh -zv'

WORKDIR /application
