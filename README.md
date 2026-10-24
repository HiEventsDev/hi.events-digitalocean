# Hi.Events DigitalOcean

Deploy [Hi.Events](https://github.com/HiEventsDev/hi.events) with one click on DigitalOcean.

[![Deploy on DigitalOcean](https://www.deploytodo.com/do-btn-blue.svg)](https://cloud.digitalocean.com/apps/new?repo=https://github.com/HiEventsDev/hi.events-digitalocean/tree/main&refcode=fe6200c866f8)

## 🚀 How to Use

1. Click the DigitalOcean button above.
2. Follow the DigitalOcean instructions until the **"Environment Variables"** step.
3. Click **"Edit"** on the **"Environment Variables"** step.
4. Set the **APP_KEY** and **JWT_SECRET** variables:
    - Generate values using the following CLI command:
      ```bash
      echo "base64:$(openssl rand -base64 32)"
      ```
    - Check the **"Encrypt"** checkbox for these variables.
5. Click **"Save"** and complete the setup.

## 🔄 How to Update

The `Dockerfile` in this repository pins a specific Hi.Events version, and we move it forward when a new version is released. Rebuilding your app installs the version pinned here.

Before you update:

- **Back up your database.** Updates run database migrations, and some can't be undone. Export it with `pg_dump`, using the connection string from your app's database settings:
  ```bash
  pg_dump "<connection string>" -F c -f hievents-backup.dump
  ```
- **Read the [release notes](https://github.com/HiEventsDev/Hi.Events/releases)** for every version between yours and the new one. Updating from v1.x to v2 changes how event dates are stored; see the [v2.0.0 release notes](https://github.com/HiEventsDev/Hi.Events/releases/tag/v2.0.0) first.
- **Uploaded images are lost on every rebuild** unless you use S3 storage (see Production Setup below).

Then:

1. Open the DigitalOcean [dashboard](https://cloud.digitalocean.com/apps) and select the deployed hi.events instance.
2. Click the **"Actions"** drop-down menu.
3. Select **"Force Rebuild & Deploy"**.
4. Wait for the deployment process to complete.

## 🔧 Production Setup

To make the app production-ready:

- Configure a mail service via environment variables.
- Set up Stripe via environment variables.
- It is advisable to set up Amazon S3 for storage, as images will be lost every time you upgrade otherwise.
- It is advisable to [configure up a queue](https://hi.events/docs/getting-started/deploying#queue-configuration) to hanlde background tasks.

Detailed setup instructions are available [here](https://hi.events/docs/getting-started/deploying).

## 📜 Licensing

This project is licensed under the terms specified [here](https://hi.events/licensing). For more information, please refer to the licensing documentation.
