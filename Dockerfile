FROM flink:scala_2.12-java11


# use bash(with --login) instead of sh to make ~/.bashrc works
SHELL ["/bin/bash", "--login", "-c"]


RUN apt update \
 && apt install -y git \
 && apt install -y python3-pip python3.10-venv \
 && ln /usr/bin/python3 /usr/bin/python \
 && pip install apache-flink jupyterlab \
 && apt upgrade -y \
 && apt-get clean \
 && echo OK


COPY src/ /
USER flink

EXPOSE 8888
ENTRYPOINT ["/docker-entrypoint.sh"]