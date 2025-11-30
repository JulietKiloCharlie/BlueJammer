# Quick Start - Push to GitHub

## Option 1: Use the Script (Easiest)

1. **Create the repository on GitHub first:**
   - Go to: https://github.com/new
   - Repository name: `bluejammer` (or your choice)
   - Make it **Public** (required for free GitHub Pages)
   - **Don't** initialize with README, .gitignore, or license
   - Click "Create repository"

2. **Run the PowerShell script:**
   ```powershell
   .\push-to-github.ps1
   ```
   
   Follow the prompts to enter your GitHub username and repo name.

3. **Enable GitHub Pages:**
   - Go to: `https://github.com/YOUR_USERNAME/bluejammer/settings/pages`
   - Source: **Deploy from a branch**
   - Branch: **main**, Folder: **/ (root)**
   - Click **Save**

4. **Your site will be live in 1-2 minutes at:**
   ```
   https://YOUR_USERNAME.github.io/bluejammer/ESP32_BlueJammer_Visual_Guide.html
   ```

## Option 2: Manual Commands

If you prefer to do it manually:

```bash
# 1. Create repo on GitHub first at https://github.com/new

# 2. Add remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/bluejammer.git

# 3. Push
git push -u origin main

# 4. Enable Pages in GitHub Settings → Pages
```

## What's Already Done ✅

- ✅ Git repository initialized
- ✅ All files committed
- ✅ Branch set to 'main'
- ✅ Ready to push!

You just need to:
1. Create the GitHub repository
2. Run the script or push manually
3. Enable GitHub Pages

That's it! 🚀

