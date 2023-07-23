FROM debian/bullseye-slim:latest
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
    apt install -y gnupg gnupg-agent && \
    gpg-connect-agent reloadagent /bye && \
    curl -sS http://deb.ocsinventory-ng.org/pubkey.gpg | sudo apt-key add - && \
    echo "deb http://deb.ocsinventory-ng.org/debian/ <distribution_codename> main" | sudo tee /etc/apt/sources.list.d/ocsinventory.list
    apt update && \
    apt install ocsinventory-agent