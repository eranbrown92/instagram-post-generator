# Instagram Post Generator

A beautiful, responsive web application that automatically generates and publishes Instagram posts based on product information. This tool streamlines the content creation process by accepting product details and images, then automatically creating engaging Instagram posts.

## Features

- 🎨 **Beautiful UI**: Modern, gradient-based design with smooth animations
- 📱 **Responsive**: Works perfectly on all devices and screen sizes
- ⚡ **Fast**: Lightweight and optimized for quick loading
- 🔄 **Real-time Processing**: Live feedback with loading states
- ✨ **User-friendly**: Intuitive form interface with clear validation

## What This Tool Does

This Instagram Post Generator provides a complete content creation workflow:

### 🎬 **Generate Phase**
1. Enter product title and description
2. Provide an image URL for your product
3. Watch real-time progress as AI generates your content
4. See step-by-step processing indicators

### 📱 **Preview Phase**
5. View an authentic Instagram post preview
6. See your generated caption and optimized image
7. Review how your post will look on Instagram

### ✅ **Confirmation Phase**
8. Approve or deny the generated post
9. Make adjustments if needed
10. Publish directly to Instagram with one click
11. Get confirmation when your post goes live

### 🔄 **Smart Workflow**
- **Real-time progress tracking** with animated indicators
- **Bidirectional communication** with n8n workflows
- **Session management** for reliable processing
- **Error handling** with graceful fallbacks

## Quick Start

1. Open the website in your browser
2. Fill in the product title and description
3. Add your product image URL
4. Click "Generate Post" and wait for confirmation
5. Check your Instagram account for the new post!

## Deployment to Cloudflare Pages

### Prerequisites
- A Cloudflare account
- This GitHub repository

### Step-by-Step Deployment

1. **Connect to Cloudflare Pages**:
   - Log in to your [Cloudflare Dashboard](https://dash.cloudflare.com/)
   - Go to "Pages" in the sidebar
   - Click "Connect to Git"
   - Select "GitHub" and authorize Cloudflare to access your repositories

2. **Select Repository**:
   - Choose the `instagram-post-generator` repository
   - Click "Begin setup"

3. **Configure Build Settings**:
   ```
   Project name: instagram-post-generator
   Production branch: main
   Build command: (leave empty)
   Build output directory: (leave empty - we're deploying static files)
   Root directory: (leave empty)
   ```

4. **Deploy**:
   - Click "Save and Deploy"
   - Your site will be built and deployed automatically
   - You'll get a `*.pages.dev` URL for your live site

### Custom Domain (Optional)
- In your Cloudflare Pages project settings
- Go to "Custom domains"
- Add your custom domain and follow the DNS setup instructions

## Configuration

### n8n Workflow Integration

This application requires a properly configured n8n workflow to handle the complete process. Here's what you need to set up:

#### Required n8n Workflow Structure

Your n8n workflow should have **three main endpoints**:

1. **🔄 Generation Endpoint** (`/webhook`) - Initial post generation
2. **📊 Status Endpoint** (`/status/{sessionId}`) - Progress polling
3. **✅ Confirmation Endpoint** (`/confirm`) - Final publishing

#### 1. Generation Workflow Setup

**Webhook Node Configuration:**
```json
{
  "httpMethod": "POST",
  "path": "webhook",
  "responseMode": "onReceived"
}
```

**Expected Input Data:**
```json
{
  "Product Title": "Your product name",
  "Product Description": "Detailed description",
  "Image URL": "https://example.com/image.jpg",
  "sessionId": "session_123456789_abc",
  "action": "generate_preview"
}
```

**Required Processing:**
- Generate engaging Instagram caption using AI (ChatGPT/Claude)
- Optimize image if needed
- Store session data for later retrieval
- Return immediately (don't wait for completion)

#### 2. Status Polling Endpoint

**Webhook Node Configuration:**
```json
{
  "httpMethod": "GET",
  "path": "status/{{$node.Webhook.json.sessionId}}",
  "responseMode": "respondToWebhook"
}
```

**Expected Response Format:**
```json
{
  "status": "completed|processing|failed",
  "preview": {
    "imageUrl": "https://example.com/optimized-image.jpg",
    "caption": "Generated Instagram caption with hashtags",
    "username": "your_brand_name"
  }
}
```

#### 3. Confirmation/Publishing Workflow

**Webhook Node Configuration:**
```json
{
  "httpMethod": "POST",
  "path": "confirm",
  "responseMode": "respondToWebhook"
}
```

**Expected Input Data:**
```json
{
  "sessionId": "session_123456789_abc",
  "action": "confirm_publish",
  "Product Title": "Product name",
  "Product Description": "Description", 
  "Image URL": "Image URL"
}
```

**Required Processing:**
- Retrieve generated content using sessionId
- Post to Instagram API
- Return success confirmation

### Frontend Configuration

#### Update Webhook URLs

1. **Edit the JavaScript in `index.html`**:
   ```javascript
   // Line ~537-538
   const WEBHOOK_URL = 'https://your-n8n-instance.com/webhook-test/YOUR_WEBHOOK_ID';
   const CONFIRM_URL = 'https://your-n8n-instance.com/webhook-test/YOUR_WEBHOOK_ID/confirm';
   ```

2. **Commit and deploy**:
   ```bash
   git add index.html
   git commit -m "Update n8n webhook URLs"
   git push origin main
   ```

#### n8n Workflow Best Practices

**Session Management:**
- Store session data in n8n memory/database
- Use unique session IDs for tracking
- Clean up old sessions periodically

**Error Handling:**
- Return proper HTTP status codes
- Include error messages in responses
- Implement retry logic for API calls

**Performance Optimization:**
- Use async processing where possible
- Implement caching for repeated operations
- Add timeout handling for long-running tasks

### Example n8n Workflow Structure

```
┌─ Webhook (Generate) 
├─ Store Session Data
├─ AI Caption Generation
├─ Image Processing
└─ Set Status: "completed"

┌─ Webhook (Status Check)
├─ Retrieve Session Data  
└─ Return Status & Preview

┌─ Webhook (Confirm)
├─ Retrieve Final Data
├─ Instagram API Post
└─ Return Success
```

## Project Structure

```
instagram-post-generator/
├── index.html          # Main application file
├── README.md          # This file
└── .gitignore         # Git ignore file
```

## Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Styling**: Custom CSS with gradients and animations
- **Hosting**: Cloudflare Pages
- **Version Control**: Git + GitHub

## Browser Support

- Chrome 60+
- Firefox 60+
- Safari 12+
- Edge 79+

## Local Development

To run this project locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/instagram-post-generator.git
   cd instagram-post-generator
   ```

2. Open `index.html` in your web browser, or use a local server:
   ```bash
   # Using Python 3
   python -m http.server 8000
   
   # Using Node.js (if you have http-server installed)
   npx http-server
   ```

3. Navigate to `http://localhost:8000` in your browser

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

If you encounter any issues or have questions:
1. Check the [Issues](https://github.com/YOUR_USERNAME/instagram-post-generator/issues) page
2. Create a new issue if your problem isn't already listed
3. Provide as much detail as possible about your issue

---

**Made with ❤️ for easier Instagram content creation**