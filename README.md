# Legendary Minecraft Server on AWS EC2 (t4g.medium)

This repository provides a ready-to-run Minecraft server using the Legendary Geyser + Floodgate container. Deploy seamlessly on an AWS EC2 t4g.medium (ARM) instance for both Java and Bedrock players!

## Prerequisites

- You need **an AWS account**.
- Your AWS credentials and region set in `.env`.

> **Note:** You do NOT need to manually create an EC2 instance or security group—Terraform will provision everything for you.

## Quick Start: Automated AWS Deployment

This repository now supports automated deployment to AWS using Terraform and a deployment script.

### 1. Configure AWS Credentials

Copy `.env.example` to `.env` and fill in your AWS credentials and settings:

```bash
cp .env.example .env
# Edit .env and set AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, etc.
```

### 2. Deploy with Terraform

Run the provided deployment script:

```bash
./deploy.sh
```

This will provision an EC2 instance, configure security groups, and start the Minecraft server automatically.

### 3. Connect to Your Server

- Java Edition: Use `<EC2 Public IP>:25565`
- Bedrock Edition: Use `<EC2 Public IP>:19132`

### 4. Customization

- Edit `docker-compose.yml` to adjust memory, timezone, or Minecraft version.
- Update `user-data.sh` for advanced bootstrapping.

### 5. Manual Steps (if needed)

If you prefer manual setup, see the legacy instructions below.

# Legendary Minecraft Server on AWS EC2 (t4g.medium)

This repository provides a ready-to-run Minecraft server using the Legendary Geyser + Floodgate container. Deploy seamlessly on an AWS EC2 t4g.medium (ARM) instance for both Java and Bedrock players!

## Prerequisites

- You need **an AWS account**.
- EC2 t4g.medium instance (ARM64, 4 vCPU / 4 GB RAM recommended).
- **Ubuntu 20.04+** or **Debian** preferred.
- **Ports 25565 (TCP) and 19132 (UDP)** open in your security group.

## Manual Deployment (Advanced/Legacy)

If you want to set up the server manually (without Terraform), follow these steps:

1. Launch an EC2 instance (t4g.medium, Ubuntu 20.04/22.04 ARM64).
2. Open ports 25565 (TCP) and 19132 (UDP) in your security group.
3. SSH into your instance and install Docker & Docker Compose:

```bash
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
# Log out and log in again to apply docker group changes.
```

4. Clone this repo and start the server:

```bash
git clone https://github.com/13protons/legendary-minecraft-aws.git
cd legendary-minecraft-aws
docker compose up -d
```

5. Stop/Restart the server:

```bash
docker compose down   # Stop server
docker compose up -d  # Restart server
```

6. (Optional) Customize settings in `docker-compose.yml`.

## Data Persistence

World data is stored in the `minecraft_data` docker volume, preserved even if you recreate the container.

## Connect

## Troubleshooting

## Resources
