# TP Docker Compose GLPI

Déploiement d'une stack GLPI avec Docker Compose comprenant :
- un conteneur GLPI personnalisé,
- un conteneur MySQL,
- un conteneur Redis.

Le projet a été réalisé dans le cadre d'un TP Docker sur une VM Debian 12.

## Architecture

- **glpi** : application web GLPI exposée sur le port `8080`
- **db** : base de données MySQL 8.0
- **redis** : service Redis pour les sessions

Le tout fonctionne sur un réseau Docker privé `glpi_net` avec des volumes nommés pour la persistance des données.

## Prérequis

- Docker installé
- Docker Compose installé
- Un compte GitHub
- Un navigateur web
- Une VM Debian 12 ou un environnement Linux équivalent

## Fichiers du projet

```text
lab-docker-glpi/
├── docker-compose.yml
├── .env
├── .env.example
├── .gitignore
└── docker/
    └── glpi/
        ├── Dockerfile
        ├── entrypoint.sh
        └── glpi-apache.conf
