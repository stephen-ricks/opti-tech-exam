FROM debian:jessie-slim
WORKDIR /workspace

ENTRYPOINT ["bash", "run.sh", "init"]
