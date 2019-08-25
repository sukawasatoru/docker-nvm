FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  curl \
  ca-certificates

ENV NVM_DIR=/opt/nvm
RUN mkdir "$NVM_DIR" && \
  curl -sSf https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash && \
  . $NVM_DIR/nvm.sh && \
  nvm install node

ENV ENV=/root/.shinit
RUN echo '. $NVM_DIR/nvm.sh' > /root/.shinit
RUN echo '. $NVM_DIR/nvm.sh' >> /root/.profile
ENTRYPOINT ["/bin/bash", "-lc"]
CMD ["bash"]
