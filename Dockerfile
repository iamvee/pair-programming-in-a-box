FROM debian:unstable
RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y tmux
RUN apt-get install -y openssh-server
RUN apt-get install -y wget
RUN apt-get install -y emacs24

RUN mkdir -p /var/run/sshd /root/.ssh
RUN chmod 0700 /root/.ssh

COPY ./.ssh $HOME
COPY ./files /root

RUN emacs --batch --script /root/.emacs

RUN apt-get install -y ruby-dev python-dev
RUN apt-get install -y ruby
RUN gem install --verbose puppet-lint


ADD start.sh /start.sh
RUN echo 'source /start.sh' > /root/.profile

EXPOSE 22

CMD bash -c '/usr/bin/emacs --daemon && /etc/init.d/ssh start && tail'
