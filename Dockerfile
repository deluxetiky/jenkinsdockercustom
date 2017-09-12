FROM jenkins
# if we want to install via apt
USER root


RUN apt-get update && apt-get install -y apt-transport-https libssl1.0 && \
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-zesty-prod zesty main" >> /etc/apt/sources.list.d/dotnetdev.list' && \
sh -c 'echo "deb http://security.debian.org/debian-security wheezy/updates main " >> /etc/apt/sources.list.d/dotnetdev.list' 


RUN apt-get update && apt-get install -y dotnet-runtime-2.0.0 dotnet-sdk-2.0.0

USER jenkins
