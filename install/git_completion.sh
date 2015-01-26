#!/bin/bash

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
sudo cp ./git-completion.bash /etc/bash_completion.d/
echo 'if [ -f /etc/bash_completion.d/git-completion.bash ]; then
    . /etc/bash_completion.d/git-completion.bash
fi' >> /etc/profile
