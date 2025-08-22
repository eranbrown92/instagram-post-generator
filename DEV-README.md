# Local Development Setup

Quick setup for testing your Instagram Post Generator locally without deploying to Cloudflare Pages.

## 🚀 Quick Start

### Option 1: Auto-Setup Script (Recommended)
```bash
./dev-start.sh
```

### Option 2: Manual Commands

**With Node.js (auto-reload):**
```bash
npm install
npm run dev
```

**With Node.js (simple server):**
```bash
npm install  
npm run serve
```

**With Python (no dependencies):**
```bash
python3 -m http.server 3000
```

## 🌐 Access Your App

After starting any server, open: **http://localhost:3000**

## ✨ Features

- **Live Reload**: Changes refresh browser automatically (with `npm run dev`)
- **Same n8n Backend**: Uses your existing webhook URLs
- **No Deploy Wait**: Test UI changes instantly
- **Multiple Options**: Choose Node.js or Python based on what you have

## 🔄 Development Workflow

1. Start local server: `./dev-start.sh`
2. Edit `index.html` in your editor
3. Save changes
4. Browser auto-refreshes (with live-server)
5. Test with your n8n backend

## 📝 Notes

- Your n8n webhooks stay the same
- All backend functionality works as normal
- Only frontend is served locally
- Perfect for UI/UX testing without deployment delays

## 🛠 Troubleshooting

**Port 3000 busy?** Edit `package.json` scripts to use different port:
```json
"dev": "live-server --port=8080 --open=index.html"
```

**CORS issues?** Your n8n server might need CORS headers if browser blocks requests.