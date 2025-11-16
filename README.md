# Legendary Minecraft Server on AWS EC2 (t4g.medium)

This repository provides a ready-to-run Minecraft server using the Legendary Geyser + Floodgate container. Deploy seamlessly on an AWS EC2 t4g.medium (ARM) instance for both Java and Bedrock players!

## Prerequisites

- You need **an AWS account**.
- EC2 t4g.medium instance (ARM64, 4 vCPU / 4 GB RAM recommended).
- **Ubuntu 20.04+** or **Debian** preferred.
- **Ports 25565 (TCP) and 19132 (UDP)** open in your security group.

## Step-by-Step Deployment

### 1. Launch EC2 Instance

- Go to AWS Console > EC2 > Launch Instance.
- Pick **Ubuntu 20.04/22.04 (arm64)**.
- Select **t4g.medium** as instance type.
- Configure security group:
  - **Inbound:**
    - TCP 25565 (Minecraft Java)
    - UDP 19132 (Minecraft Bedrock)
    - Optionally, SSH (TCP 22) for admin access.
- Launch and SSH to your server.

### 2. Install Docker & Docker Compose

```bash
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
# Log out and log in again to apply docker group changes.
```

### 3. Download Repository Files

Clone this repo:

```bash
git clone https://github.com/13protons/legendary-minecraft-aws.git
cd legendary-minecraft-aws
```

### 4. Start the Minecraft Server

```bash
docker compose up -d
```

### 5. Stop/Restart the Server

```bash
docker compose down   # Stop server
docker compose up -d  # Restart server
```

### 6. (Optional) Customize Settings

- Edit `docker-compose.yml`:
  - Change `MaxMemory` if using larger EC2 instance.
  - Set timezone in `TZ`.
  - To specify a Minecraft version, add `- Version=1.XX.X` under `environment`.

## Data Persistence

World data is stored in the `minecraft_data` docker volume, preserved even if you recreate the container.

## Connect

- Java Edition: Use `<EC2 Public IP>:25565`
- Bedrock Edition: Use `<EC2 Public IP>:19132`

## Troubleshooting

- Check logs with: `docker compose logs -f`
- Ensure your security group rules are correct.
- For ARM instance, platform is set to `linux/arm64` for compatibility.

## Resources

- [Legendary Minecraft Docker Image](https://hub.docker.com/r/05jchambers/legendary-minecraft-geyser-floodgate)
- [Project Source](https://github.com/TheRemote/Legendary-Java-Minecraft-Geyser-Floodgate)
