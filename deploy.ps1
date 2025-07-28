# AWS S3 Deployment Script for Ayush's Portfolio (PowerShell)
# Make sure to configure AWS CLI first: aws configure

Write-Host "🚀 Deploying Ayush's Portfolio to AWS S3..." -ForegroundColor Cyan

# Configuration (UPDATE THESE VALUES)
$BUCKET_NAME = "ayush-portfolio-website"  # Change this to your bucket name
$REGION = "us-east-1"  # Change to your preferred region
$CLOUDFRONT_DISTRIBUTION_ID = ""  # Add this if you use CloudFront

Write-Host "📋 Configuration:" -ForegroundColor Yellow
Write-Host "   Bucket: $BUCKET_NAME"
Write-Host "   Region: $REGION"
Write-Host "   File: index.html"

# Check if AWS CLI is installed
try {
    aws --version | Out-Null
}
catch {
    Write-Host "❌ AWS CLI is not installed. Please install it first." -ForegroundColor Red
    Write-Host "Visit: https://aws.amazon.com/cli/"
    exit 1
}

# Check if AWS is configured
try {
    aws sts get-caller-identity | Out-Null
}
catch {
    Write-Host "❌ AWS CLI is not configured. Please run 'aws configure' first." -ForegroundColor Red
    exit 1
}

# Upload the main file
Write-Host "`n📤 Uploading index.html..." -ForegroundColor Yellow
try {
    aws s3 cp index.html s3://$BUCKET_NAME/ --content-type "text/html"
    Write-Host "✅ Upload successful!" -ForegroundColor Green
}
catch {
    Write-Host "❌ Upload failed!" -ForegroundColor Red
    exit 1
}

# Set correct permissions
Write-Host "`n🔓 Setting public read permissions..." -ForegroundColor Yellow
aws s3api put-object-acl --bucket $BUCKET_NAME --key index.html --acl public-read

# If CloudFront distribution ID is provided, invalidate cache
if ($CLOUDFRONT_DISTRIBUTION_ID -ne "") {
    Write-Host "`n🔄 Invalidating CloudFront cache..." -ForegroundColor Yellow
    aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID --paths "/*"
}

# Get website URL
$WEBSITE_URL = "http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"

Write-Host "`n🎉 Deployment completed successfully!" -ForegroundColor Green
Write-Host "`n🌐 Your website is available at:" -ForegroundColor Yellow
Write-Host "   $WEBSITE_URL"

Write-Host "`n📝 Next steps:" -ForegroundColor Yellow
Write-Host "   1. Visit your website URL above"
Write-Host "   2. Consider setting up CloudFront for better performance"
Write-Host "   3. Add a custom domain if desired"

Write-Host "`n✨ Happy hosting!" -ForegroundColor Green

# Open website in default browser
$response = Read-Host "`nWould you like to open the website now? (y/n)"
if ($response -eq "y" -or $response -eq "Y") {
    Start-Process $WEBSITE_URL
}
