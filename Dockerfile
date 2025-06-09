FROM jfhbrook/copr-tools:1.1.0

RUN dnf install -y jq make

VOLUME /root

WORKDIR /workspace
VOLUME /workspace

CMD ["/bin/bash"]
