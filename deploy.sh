#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Starting deployment..."

cd /root/pythonbackend

# 1. Pull latest code
echo "📥 Pulling latest code..."
git pull origin main

# 2. Permissions
chmod +x run_app.sh

# 3. Update dependencies using the specific venv python
echo "📦 Updating dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# 4. Handle PM2 (Start or Restart)
# We use 'pm2 startOrRestart' to handle both new and existing processes
echo "♻️ Restarting application..."
pm2 start run_app.sh

pm2 restart run_app.sh

# 5. Save PM2 state to persist after server reboots
pm2 save

echo "✅ Deployment completed successfully"