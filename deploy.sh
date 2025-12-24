#!/bin/bash

echo "🚀 Starting deployment..."

cd /root/pythonbackend || exit 1

# Pull latest code
echo "📥 Pulling latest code..."
git pull origin main

# Activate venv
source venv/bin/activate || exit 1

# Upgrade & install deps
echo "📦 Updating dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Restart PM2 safely (NO duplicates)
echo "♻️ Restarting application..."
pm2 restart python-backend || pm2 start run_app.sh --name python-backend --interpreter bash

# Save PM2 state
pm2 save

echo "✅ Deployment completed successfully"
