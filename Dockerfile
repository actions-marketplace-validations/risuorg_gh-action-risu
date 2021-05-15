FROM python:3.7

LABEL "com.github.actions.name"="Risu GitHub Action"
LABEL "com.github.actions.description"="Runs Risu"
LABEL "com.github.actions.icon"="home"
LABEL "com.github.actions.color"="blue"

LABEL "Name"="Risu for GHA"
LABEL "Version"="0.0.1"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
