# AWS S3 Deployment Guide for Ayush's Portfolio

## Prerequisites
1. AWS Account (Free Tier)
2. AWS CLI installed
3. Your portfolio files ready

## Step 1: Create S3 Bucket
1. Go to AWS Console → S3
2. Click "Create bucket"
3. Bucket name: `ayush-portfolio-website` (must be globally unique)
4. Region: Choose closest to your target audience
5. Uncheck "Block all public access"
6. Acknowledge the warning
7. Click "Create bucket"

## Step 2: Configure Static Website Hosting
1. Select your bucket
2. Go to "Properties" tab
3. Scroll to "Static website hosting"
4. Click "Edit"
5. Enable static website hosting
6. Index document: `index.html`
7. Error document: `index.html` (for SPA behavior)
8. Save changes

## Step 3: Set Bucket Policy
1. Go to "Permissions" tab
2. Scroll to "Bucket policy"
3. Click "Edit"
4. Add this policy (replace YOUR-BUCKET-NAME):

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::YOUR-BUCKET-NAME/*"
        }
    ]
}
```

## Step 4: Upload Files
1. Go to "Objects" tab
2. Click "Upload"
3. Add your `index.html` file
4. Click "Upload"

## Step 5: Access Your Website
Your website will be available at:
`http://YOUR-BUCKET-NAME.s3-website-REGION.amazonaws.com`

## Optional: Add CloudFront (CDN)
1. Go to CloudFront service
2. Click "Create distribution"
3. Origin domain: Your S3 website endpoint
4. Default root object: `index.html`
5. Create distribution
6. Wait 15-20 minutes for deployment

## Cost Estimation (Free Tier)
- S3 Storage: 5GB free (your site: ~0.4MB)
- S3 Requests: 20,000 GET requests free
- CloudFront: 50GB transfer free
- **Total monthly cost: $0.00** for your portfolio!

## Custom Domain (Optional)
1. Register domain in Route 53 or external provider
2. Create CloudFront distribution
3. Add SSL certificate via AWS Certificate Manager (free)
4. Configure DNS records

## Deployment Commands (if using AWS CLI)
```bash
# Upload file
aws s3 cp index.html s3://your-bucket-name/

# Sync entire folder (if you add more files)
aws s3 sync . s3://your-bucket-name/ --exclude "*.md" --exclude "node_modules/*"

# Invalidate CloudFront cache (if using CloudFront)
aws cloudfront create-invalidation --distribution-id YOUR-DISTRIBUTION-ID --paths "/*"
```
