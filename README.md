# Ayush N Shetty - Portfolio Website

A clean, minimal, and responsive portfolio website built with Bootstrap 5 and modern web technologies.

## 🎨 Design Philosophy

**"Less is More"** - This portfolio embraces minimalism while maintaining a unique and professional appearance.

### Key Features
- **Clean & Minimal Design**: Focus on content over visual clutter
- **Fully Responsive**: Perfect experience on all devices
- **Fast Loading**: Optimized performance with lightweight code
- **Accessible**: Built with web accessibility standards
- **Modern**: Latest Bootstrap 5.3.0 with custom enhancements

## 🚀 Tech Stack

- **HTML5**: Semantic markup
- **CSS3**: Custom properties, Flexbox, Grid
- **Bootstrap 5.3.0**: Responsive framework
- **JavaScript**: Vanilla JS for interactions
- **AOS Library**: Smooth scroll animations
- **Bootstrap Icons**: Clean iconography
- **Google Fonts**: Inter typography

## 📁 Project Structure

```
ayush-portfolio/
├── index.html              # Main portfolio file (Bootstrap version)
├── index-old-design.html   # Backup of previous design
├── package.json            # Node.js dependencies
├── deploy.md               # AWS deployment guide
├── deploy.ps1              # PowerShell deployment script
├── deploy.sh               # Bash deployment script
└── README.md               # Project documentation
```

## 🛠️ Development

### Prerequisites
- Node.js (for development server)
- Modern web browser

### Setup
```bash
# Install dependencies
npm install

# Start development server
npm start
```

### Available Scripts
- `npm start` - Start local development server
- `npm run dev` - Alternative development command
- `npm run deploy` - Deploy to AWS S3 (PowerShell)
- `npm run deploy-bash` - Deploy to AWS S3 (Bash)

## 🎯 Sections

1. **Hero** - Clean introduction with availability status
2. **About** - Personal journey and key achievements
3. **Skills** - Technical skills with animated progress bars
4. **Projects** - Featured work with impact metrics
5. **Experience** - Professional timeline
6. **Contact** - Clean contact form and information

## 📱 Responsive Breakpoints

- **Mobile**: < 768px
- **Tablet**: 768px - 1024px
- **Desktop**: > 1024px

## 🎨 Color Palette

```css
:root {
    --primary: #0a0a0a;      /* Primary text */
    --accent: #ff6b35;       /* Accent/brand color */
    --light: #f8f9fa;        /* Light backgrounds */
    --gray: #6c757d;         /* Muted text */
    --border: #e9ecef;       /* Borders */
}
```

## 🚀 Deployment

### AWS S3 Hosting
The project includes automated deployment scripts for AWS S3:

1. **Configure AWS CLI** (see `deploy.md`)
2. **Run deployment**:
   ```bash
   npm run deploy
   ```

### Other Hosting Options
- Netlify: Drag and drop `index.html`
- Vercel: Connect GitHub repository
- GitHub Pages: Enable in repository settings

## 📊 Performance

- **Lighthouse Score**: 95+ (Performance, Accessibility, SEO)
- **Load Time**: < 2 seconds
- **File Size**: ~36KB (optimized)
- **Mobile Friendly**: 100%

## 🔧 Customization

### Adding New Sections
1. Add HTML structure following Bootstrap grid
2. Include AOS animation attributes
3. Update navigation links
4. Add custom CSS if needed

### Changing Colors
Update CSS custom properties in the `:root` selector:
```css
:root {
    --accent: #your-color;
}
```

### Modifying Content
All content is in `index.html` - edit the text, links, and information as needed.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

**Ayush N Shetty**
- Email: ayush.avarch@gmail.com
- Phone: +91 9741827140
- LinkedIn: [Connect with me](https://linkedin.com/in/ayush-shetty)

---

*Crafted with ❤️ and simplicity*
