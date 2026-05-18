# Mucahubv3

This repository contains the Mucahubv3 PHP application.

Deployment

- Docker (recommended): Railway or any container host. A `Dockerfile` and `docker-entrypoint.sh` are included to adapt Apache to the platform `PORT`.

  Build and run locally:

  ```bash
  docker build -t mucahub .
  docker run --rm -p 8080:8080 -e PORT=8080 mucahub
  ```

- PHP buildpack (Railway): Use the repo with Railway's PHP buildpack; `composer.json` is present and `Procfile` specifies the start command.

Upload to GitHub (local steps)

1. If you already have `git` credentials configured, run the PowerShell script `upload-to-github.ps1` included here, or use commands below.

2. Manual commands:

```powershell
cd path\to\mucahubv3
git init
git add .
git commit -m "Initial import"
# add remote and push (replace URL with your repo)
git remote add origin https://github.com/kanekirinookami159-coder/Mucahubv2.git
git branch -M main
git push -u origin main
```

Notes

- The repository `.gitignore` excludes `vendor/`, `uploads/`, and `.env` files. Add any secrets via Railway environment variables.
- If push fails due to authentication, set up SSH keys or use a personal access token for HTTPS pushes.
