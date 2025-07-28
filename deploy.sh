#!/bin/bash

# AWS S3 Deployment Script for Ayush's Portfolio
# Make sure to configure AWS CLI first: aws configure

echo "🚀 Deploying Ayush's Portfolio to AWS S3..."

# Configuration (UPDATE THESE VALUES)
BUCKET_NAME="ayush-portfolio-website"  # Change this to your bucket name
REGION="us-east-1"  # Change to your preferred region
CLOUDFRONT_DISTRIBUTION_ID=""  # Add this if you use CloudFront

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo -e "${RED}❌ AWS CLI is not installed. Please install it first.${NC}"
    echo "Visit: https://aws.amazon.com/cli/"
    exit 1
fi

# Check if AWS is configured
if ! aws sts get-caller-identity &> /dev/null; then
    echo -e "${RED}❌ AWS CLI is not configured. Please run 'aws configure' first.${NC}"
    exit 1
fi

echo -e "${YELLOW}📋 Configuration:${NC}"
echo "   Bucket: $BUCKET_NAME"
echo "   Region: $REGION"
echo "   File: index.html"

# Upload the main file
echo -e "\n${YELLOW}📤 Uploading index.html...${NC}"
if aws s3 cp index.html s3://$BUCKET_NAME/ --content-type "text/html"; then
    echo -e "${GREEN}✅ Upload successful!${NC}"
else
    echo -e "${RED}❌ Upload failed!${NC}"
    exit 1
fi

# Set correct permissions
echo -e "\n${YELLOW}🔓 Setting public read permissions...${NC}"
aws s3api put-object-acl --bucket $BUCKET_NAME --key index.html --acl public-read

# If CloudFront distribution ID is provided, invalidate cache
if [ ! -z "$CLOUDFRONT_DISTRIBUTION_ID" ]; then
    echo -e "\n${YELLOW}🔄 Invalidating CloudFront cache...${NC}"
    aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID --paths "/*"
fi

# Get website URL
WEBSITE_URL="http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"

echo -e "\n${GREEN}🎉 Deployment completed successfully!${NC}"
echo -e "\n${YELLOW}🌐 Your website is available at:${NC}"
echo "   $WEBSITE_URL"

echo -e "\n${YELLOW}📝 Next steps:${NC}"
echo "   1. Visit your website URL above"
echo "   2. Consider setting up CloudFront for better performance"
echo "   3. Add a custom domain if desired"

echo -e "\n${GREEN}✨ Happy hosting!${NC}"
