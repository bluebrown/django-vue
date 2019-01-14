FROM python

RUN apt-get update && apt-get install -y --no-install-recommends tree vim-nox zsh && chsh -s /usr/bin/zsh && \
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting && \
    curl https://raw.githubusercontent.com/bluebrown/dotfiles/master/zshrc > ~/.zshrc && \
    git clone --recursive https://github.com/bluebrown/vim-alpine ~/.vim && \
    pip install jedi

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TZ=Europe/Madrid

WORKDIR /application/
COPY django/requirements.txt .
RUN pip install -r requirements.txt

