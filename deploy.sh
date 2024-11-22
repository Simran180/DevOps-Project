#!/bin/bash

# Configuration
DOCKER_USERNAME="your-dockerhub-username"
APP_VERSION=$(date +%Y%m%d_%H%M%S)
FRONTEND_IMAGE="$DOCKER_USERNAME/flipr-drive-frontend:$APP_VERSION"
BACKEND_IMAGE="$DOCKER_USERNAME/flipr-drive-backend:$APP_VERSION"

echo "🚀 Starting deployment process..."

# Build and push frontend image
echo "📦 Building frontend image..."
docker build -t $FRONTEND_IMAGE ./frontend
echo "⬆️ Pushing frontend image to Docker Hub..."
docker push $FRONTEND_IMAGE

# Build and push backend image
echo "📦 Building backend image..."
docker build -t $BACKEND_IMAGE ./backend
echo "⬆️ Pushing backend image to Docker Hub..."
docker push $BACKEND_IMAGE

# Update docker-compose.yml with new image versions
echo "🔄 Updating docker-compose.yml with new image versions..."
sed -i "s|build: ./frontend|image: $FRONTEND_IMAGE|g" docker-compose.yml
sed -i "s|build: ./backend|image: $BACKEND_IMAGE|g" docker-compose.yml

# Start the application
echo "🌟 Starting the application..."
docker-compose up -d

echo "✅ Deployment complete! Application is now running."
echo "📝 Frontend available at: http://localhost"
echo "📝 Backend API available at: http://localhost:5000"