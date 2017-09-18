
FROM jenkins:2.60.3
# if we want to install via apt
USER root


RUN apt-get update && apt-get install -y apt-transport-https curl libunwind8 gettext && \
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-$



RUN apt-get update && apt-get install -y dotnet-runtime-2.0.0 dotnet-sdk-2.0.0

USER jenkins
