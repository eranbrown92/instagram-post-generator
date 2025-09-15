# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

```bash
# Local development (recommended - auto-reload)
npm run dev

# Alternative local server options
npm run serve        # Simple HTTP server
npm run python      # Python server (no Node.js required)

# Auto-setup script
./dev-start.sh      # Installs dependencies and starts dev server
```

## Architecture Overview

This is a **single-file Instagram post generator** that integrates with an **n8n workflow backend** for AI-powered content creation and Instagram publishing.

### Frontend Architecture
- **Single HTML file** (`index.html`) with embedded CSS and JavaScript
- **Multi-page SPA**: Form → Loading → Success (no routing library)
- **localStorage integration** for form data persistence across sessions
- **Real-time progress tracking** that waits for actual n8n API responses (not fake timers)

### Backend Integration (n8n)
- **Direct publish workflow**: Form submission → AI caption generation → Instagram upload
- **No preview step**: Streamlined to go straight from form to published post
- **Webhook endpoint**: `https://automate.tech-takeover.net/webhook/8f109fee-9713-4709-8ec2-957935850dc0`
- **Action type**: Always sends `action: 'confirm_publish'`

### n8n Workflow Structure (Expected)
```
Webhook → Social Media Agent → Fetch Image → Process Image → Upload Post → Respond Success
```

### Key Integration Points

**Frontend sends to n8n:**
```javascript
{
  "Product Title": "...",
  "Product Description": "...", 
  "Image URL": "...",
  "Affiliate Link": "...",
  "Aspect Ratio": "square|portrait|landscape",
  "sessionId": "session_123456789_abc",
  "action": "confirm_publish"
}
```

**n8n should return:**
```javascript
{
  "status": "success",
  "message": "Post published to Instagram!"
}
```

### Frontend State Management
- **currentFormData**: Stores form inputs during processing
- **generatedCaption**: Stores AI-generated caption (currently unused in direct-publish mode) 
- **localStorage**: Auto-saves form data as user types, persists across sessions

### Critical Workflow Notes
- **No preview/confirmation loop**: Goes straight from form to published post
- **Progress bar**: Genuinely waits for n8n API response, not fake timers
- **Error handling**: CORS issues and 404s typically indicate n8n workflow problems
- **Image processing**: n8n workflow should handle image fetching and Instagram optimization

### Development Workflow
1. Edit `index.html` in any editor
2. Test locally with `npm run dev` (auto-reload) or `./dev-start.sh`
3. Frontend connects to existing n8n production webhook
4. No build process required - deploy single HTML file

### Common Issues
- **CORS/404 errors**: Check n8n webhook URL and workflow activation
- **Progress stuck**: n8n workflow may not be responding properly
- **Form data loss**: localStorage should persist data, check browser storage
- **Publishing failures**: Usually indicates n8n workflow Upload Post node configuration issues