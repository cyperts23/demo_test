#!/bin/bash

echo "🚀 Starting deployment..."

cd /root/pythonbackend || exit 1

# Pull latest code
git pull origin main || exit 1

# Activate virtual environment
source venv/bin/activate || exit 1

# Install/update dependencies
pip install -r requirements.txt || exit 1

# Restart PM2 app safely
pm2 restart python-backend || pm2 start run_app.sh --name python-backend --interpreter bash

# Save PM2 state
pm2 save

echo "✅ Deployment completed successfully"