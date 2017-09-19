FROM jenkins/jenkins:2.73.1
# if we want to install via apt
USER root


RUN apt-get update && apt-get install -y apt-transport-https curl libunwind8 gettext && \
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'



RUN apt-get update && apt-get install -y dotnet-runtime-2.0.0 dotnet-sdk-2.0.0

RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# Install Docker, partly from https://github.com/docker-library/docker/blob/master/1.12/Dockerfile
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 1.12.0
ENV DOCKER_SHA256 3dd07f65ea4a7b4c8829f311ab0213bca9ac551b5b24706f3e79a97e22097f8b
ENV DOCKER_COMPOSE_VERSION 1.8.0
RUN set -x && \
    curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz && \
    echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - && \
    tar -xzvf docker.tgz && \
    mv docker/* /usr/local/bin/ && \
    rmdir docker && \
    rm docker.tgz && \
    docker -v && \
    curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    docker-compose --version

USER jenkins
