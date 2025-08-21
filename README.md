# Instagram Post Generator

A beautiful, responsive web application that automatically generates and publishes Instagram posts based on product information. This tool streamlines the content creation process by accepting product details and images, then automatically creating engaging Instagram posts.

## Features

- 🎨 **Beautiful UI**: Modern, gradient-based design with smooth animations
- 📱 **Responsive**: Works perfectly on all devices and screen sizes
- ⚡ **Fast**: Lightweight and optimized for quick loading
- 🔄 **Real-time Processing**: Live feedback with loading states
- ✨ **User-friendly**: Intuitive form interface with clear validation

## What This Tool Does

This Instagram Post Generator allows you to:
1. Enter product title and description
2. Provide an image URL for your product
3. Automatically generate and publish Instagram posts with the provided content
4. Get instant confirmation when your post is successfully created

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

### Setting Up the Webhook URL

Before the form will work, you need to update the webhook URL in the code:

1. **Edit the JavaScript**:
   - Open `index.html` in your code editor
   - Find this line (around line 204):
   ```javascript
   const WEBHOOK_URL = 'YOUR_WEBHOOK_URL_HERE';
   ```
   
2. **Replace with your actual webhook URL**:
   ```javascript
   const WEBHOOK_URL = 'https://your-actual-webhook-url.com/webhook';
   ```

3. **Commit and push your changes**:
   ```bash
   git add index.html
   git commit -m "Update webhook URL"
   git push origin main
   ```

Cloudflare Pages will automatically redeploy your site with the new webhook URL.

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