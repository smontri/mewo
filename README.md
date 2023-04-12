# Cours DevOps

## Todo app

En cours de construction

## Terraform

### Structure du code

Ces blocs permettent de provisionner de l'infrastructure sur vos comptes Azure éducation.

Le dossier Terraform1 contient l'ensemble des fichier TF pour créer :
1. Resource Group
2. Virtual Network
3. Subnet
4. IP publique
5. Network Security Group
6. Virtual Machine

### Exécuter le terraform

Important : lancer la commande az login pour connecter l'environnement du terminal à la souscription Azure.

Commandes à utiliser :

- terraform init => initialisation des providers terraform à utiliser
- terraform plan => dry-run du plan d'exécution de l'infrastructure
- terraform validate => permet de valider la syntaxe
- teraform apply => déploiement de l'infrastructure

Une fois le test ok, ne pas oublier de détruire l'infrastructure crée, pour éviter des coûts et ne pas laisser la VM accessible sur Internet.

- terrform destroy => détruit l'infrastructure