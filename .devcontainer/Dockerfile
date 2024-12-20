# Utilise une image Ubuntu de base
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Configure le répertoire de travail
WORKDIR /workspace

# Définir des variables d'environnement
ENV TERRAFORM_VERSION=1.10.2 \
    AZ_CLI_VERSION=latest

# Installer les prérequis
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    direnv \
    gnupg \
    lsb-release \
    apt-transport-https \
    wget
    ##&& curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    #&& echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    ##&& terraform=${TERRAFORM_VERSION}

# Install HashiCorp's GPG key and add repository
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
RUN apt-get update && apt-get install -y terraform

# Installer Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Nettoyer le cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Configurer l'utilisateur
USER vscode