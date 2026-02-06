**Used Tools**
- Visual Studio Code
- Chocolatey
  (install via: Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')))
- Git
- OpenTofu (install via winget install --exact --id=OpenTofu.Tofu in Terminal | choco install -y opentofu)
- Proxmox
- Docker
- Packer (install via winget install HashiCorp.Packer | choco install -y packer)

- Future Tools
- Kubernetes
- Ansible voor Containerisatie om on demand servers inclusief services uit te rollen
- Packer om Golden Images te maken waar de templates met OpenTofu op voort bouwt

**Workflow**
Packer (Golden Image) -> OpenTofu (schaalt naar de requirements) -> Ansible (bied resources aan vanuit Docker/Kubernetes)

- Future plans
- 

**Templates per use**
- Linux (Ubuntu 24.04, Ubuntu Server 24.04)
- Windows (Windows 11 22H2, Windows Server 2022)

**(WIP templates)**
- Pfsense
- OPNsense

**Scope**
Het leren van Infrastructure as Code als basis gebruiken om uiteindelijk Security based keuzes te maken voor de implementatiefases.

**Wat toon ik aan binnen deze Repo**
Binnen deze Repo laat word mijn leerpad zien met Terraform (OpenTofu)

**Waarom toon ik dit aan?**
Terraform is een golden standard binnen Infrastructure enginering, dit leek mij een vrij relevante stap voor mijn toekomst vandaar de keuze om mijzelf hier in te verdiepen.

**Wat is mijn uiteindelijke leerdoel**
Het uiteindelijke leerdoel dat hiermee behaald gaat worden is er schaalbare infrastructuur georchastreert kan worden via code en hiermee testomgevingen efficienter uit kan rollen om cruciale keuzes te maken en onderbouwen.

**How to Run**
- tofu init (Hiermee maak je de omgeving klaar voor test)
- tofu plan (Hiermee controleer je de benodigde resources in het geval als je cloud implementeert, maar in de basis toon je hiermee welke basis je legt met je IaC)
- tofu apply (Hiermee bouw je een omgeving en pas je eventuele aanpassingen vanuit de vorige 
- tofu destroy (Hiermee breek je de testomgeving af)





