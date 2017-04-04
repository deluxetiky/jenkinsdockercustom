FROM jenkins
# if we want to install via apt
USER root

RUN apt-get update && apt-get install -y curl libunwind8 gettext
RUN curl -sSL -o dotnet.tar.gz https://go.microsoft.com/fwlink/?linkid=843453 -k && mkdir -p /opt/dotnet && tar zxf dotnet.tar.gz -C /opt/dotnet \
&& ln -s /opt/dotnet/dotnet /usr/local/bin
USER jenkins
