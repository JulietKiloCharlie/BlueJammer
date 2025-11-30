# GitHub Pages Setup Instructions

## Quick Setup (Recommended)

### Method 1: Automatic GitHub Pages (Easiest)

1. **Push this repository to GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit - ESP32-BlueJammer Guide"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/bluejammer.git
   git push -u origin main
   ```

2. **Enable GitHub Pages:**
   - Go to your repository on GitHub
   - Click **Settings** → **Pages**
   - Under "Source", select **"Deploy from a branch"**
   - Select branch: **main** (or master)
   - Select folder: **/ (root)**
   - Click **Save**

3. **Your site will be live at:**
   ```
   https://YOUR_USERNAME.github.io/bluejammer/ESP32_BlueJammer_Visual_Guide.html
   ```

   Or if you use the index.html redirect:
   ```
   https://YOUR_USERNAME.github.io/bluejammer/
   ```

### Method 2: Manual Setup (Alternative)

1. **Create a `docs` folder** (optional, but cleaner):
   ```bash
   mkdir docs
   cp ESP32_BlueJammer_Visual_Guide.html docs/
   cp index.html docs/
   ```

2. **Push to GitHub** (same as above)

3. **Enable GitHub Pages:**
   - Settings → Pages
   - Source: **Deploy from a branch**
   - Branch: **main**, Folder: **/docs** (if you used docs folder)

## Custom Domain (Optional)

If you want a custom domain:

1. Add a `CNAME` file to the root:
   ```
   yourdomain.com
   ```

2. Configure DNS settings with your domain provider

## Files Included

- ✅ `ESP32_BlueJammer_Visual_Guide.html` - Main guide
- ✅ `index.html` - Redirect page (optional)
- ✅ `.nojekyll` - Prevents Jekyll processing
- ✅ `README.md` - Repository description

## Troubleshooting

**Page not loading?**
- Wait 1-2 minutes after enabling Pages
- Check Settings → Pages for any errors
- Ensure files are in the correct branch

**Styles not working?**
- The guide uses external Google Fonts (should work)
- Check browser console for errors

**Want to update the guide?**
- Just edit `ESP32_BlueJammer_Visual_Guide.html`
- Commit and push changes
- GitHub Pages will auto-update

## Your Live URL

Once set up, your guide will be accessible at:
```
https://YOUR_USERNAME.github.io/bluejammer/ESP32_BlueJammer_Visual_Guide.html
```

Replace `YOUR_USERNAME` with your actual GitHub username!

