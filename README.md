# F-Droid Repository

This repository is initialized and managed using [`fdroidserver`](https://f-droid.org/docs/Setup_an_F-Droid_App_Repo).

## Repository Structure

- [`config.yml`](config.yml): Configuration file for the repository (name, description, base URL, signing keystore, etc.).
- [`repo/`](repo/): Directory containing APKs, icons, metadata, and generated index files (`index-v1.jar`, `index-v2.json`, etc.).
- [`keystore.p12`](keystore.p12): PKCS#12 keystore used to sign repository index files (kept private; ignored in `.gitignore`).
- [`shell.nix`](shell.nix): Nix shell providing `fdroidserver` and `jdk` without manual system installs.

## Repository Signing Key Fingerprint

- **SHA-256 Fingerprint**: `02 34 BA 18 CD 1E 75 21 83 A6 C0 B6 F5 36 2D F8 E5 7C 0D BD 35 59 31 E4 DA 47 7A AB 19 26 74 3C`

## Workflow

### 1. Enter the Nix Shell (Optional)
To enter an interactive shell with `fdroid` available:
```bash
nix-shell
```

### 2. Adding Apps
1. Place APK files directly into the [`repo/`](repo/) directory:
   ```bash
   cp /path/to/app.apk repo/
   ```
2. Update repository indexes and extract APK metadata:
   ```bash
   nix-shell --run "fdroid update -c"
   ```

### 3. Serving Locally for Testing
You can test the repository over your local network:
```bash
python3 -m http.server 8000
```
Then on your Android device (connected to the same Wi-Fi), add the repository in the F-Droid app:
```
http://<YOUR-IP>:8000/repo
```
and verify the fingerprint when prompted.

### 4. Hosting Online
1. Edit [`config.yml`](config.yml) to set your public `repo_url`, `repo_name`, and `repo_description`.
2. Host the contents of this folder (or specifically `repo/`) on GitHub Pages, GitLab Pages, an S3 bucket, or an HTTP server (Nginx/Apache).
