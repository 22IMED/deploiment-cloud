# Déploiement Cloud / IaC

Ce repository contient les livrables demandés:

1. **Ajout d'un collaborateur GitHub via Terraform**
2. **Déploiement d'une VM GCP (Compute Engine) dans un VPC via Terraform (CloudGuru)**
3. **Déploiement de 2 VMs VirtualBox via Terraform**
4. **Playbook Ansible pour installer WordPress**

## Arborescence

- `terraform/github-collaborator/` : ajout du collaborateur (`theophilegarin`) sur un repository GitHub.
- `terraform/gcp-compute-vpc/` : création d'un VPC + subnet + firewall + VM Compute Engine.
- `terraform/virtualbox-vms/` : création de 2 VMs VirtualBox.
- `ansible/` : inventaire et rôle WordPress.

---

## 1) Terraform - Collaborateur GitHub

```bash
cd terraform/github-collaborator
cp terraform.tfvars.example terraform.tfvars
# éditer terraform.tfvars
terraform init
terraform plan
terraform apply
```

> Le provider GitHub attend un identifiant GitHub (`username`) pour l'ajout collaborateur.

---

## 2) Terraform - GCP Compute Engine dans un VPC (CloudGuru)

```bash
cd terraform/gcp-compute-vpc
cp terraform.tfvars.example terraform.tfvars
# éditer terraform.tfvars (project_id obligatoire)
terraform init
terraform plan
terraform apply
```

Ressources créées:
- VPC custom
- Subnet
- Règle firewall (22/80/443)
- VM Compute Engine Debian

---

## 3) Terraform - 2 VMs VirtualBox

```bash
cd terraform/virtualbox-vms
terraform init
terraform plan
terraform apply
```

> Prérequis local: VirtualBox installé et interface host-only `vboxnet0` existante.

---

## 4) Ansible - Installation WordPress

### Prérequis
- Python + Ansible sur la machine de contrôle
- Accès SSH aux VMs
- Collection Ansible MySQL:

```bash
ansible-galaxy collection install community.mysql
```

### Exécution

```bash
cd ansible
ansible-playbook site.yml
```

Le playbook:
- installe Apache, PHP, MariaDB
- crée la base + utilisateur WordPress
- télécharge et déploie WordPress
- génère `wp-config.php`

---

## Variables sensibles

Les mots de passe de démonstration sont dans `ansible/group_vars/all.yml`.
⚠️ À changer avant usage réel.
