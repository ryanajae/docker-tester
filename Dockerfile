FROM ubuntu:20.04
RUN apt-get update && apt-get install -y git sudo gnupg \
    vim nano tmux screen less python3 zip wget curl && \
    groupadd rvm && groupadd docker && \
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | \
    sudo apt-key add - && \
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu" \
        "focal/mongodb-org/4.4 multiverse" | \
        sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
    sudo apt-get update && \
    sudo apt-get install mongodb-org-shell && \
    useradd ryanjae && sudo usermod -aG rvm,docker ryanjae && \
    chsh ryanjae -s /bin/bash && \
    echo ryanjae ALL=NOPASSWD:ALL | sudo tee -a /etc/sudoers && \
    mkdir /home/ryanjae && chown ryanjae /home/ryanjae && \
    ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && \
    echo America/Los_Angeles > /etc/timezone
USER ryanjae
RUN cd /home/ryanjae; git clone https://github.com/ryanajae/docker-tester
WORKDIR /home/ryanjae/docker-tester/
RUN mkdir -p ~/.travis && \
    git clone -q https://github.com/travis-ci/travis-build.git ~/.travis/travis-build && \
    cd ~/.travis/travis-build && sed -i 's/4.0/5.0/g' Gemfile && \
    sed -i "s/'travis'/'travis', '1.11.0'/g" Gemfile && \
    rm Gemfile.lock && \
    cd ~/docker-tester && \
    sudo su ryanjae -c ./provision.sh && \
    echo "source /etc/profile.d/rvm.sh" >> /home/ryanjae/.bashrc && \
    echo "source ~/.bashrc" >> /home/ryanjae/.bash_profile
RUN git clone https://github.com/ikasanEIP/ikasan
RUN git clone https://github.com/SonarSource/sonarqube
RUN git clone https://github.com/square/moshi
RUN git clone https://github.com/apache/zookeeper
