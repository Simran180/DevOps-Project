# Flipr Drive - Containerized Full-Stack Application

This repository contains a containerized full-stack application with React frontend, Express backend, and MongoDB database.

## Prerequisites

- Docker and Docker Compose installed
- Docker Hub account
- Git

## Project Structure

```
.
├── frontend/
│   ├── Dockerfile
│   └── nginx.conf
├── backend/
│   └── Dockerfile
├── docker-compose.yml
├── deploy.sh
└── README.md
```

## Quick Start

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. Update Docker Hub username:
   - Open `deploy.sh`
   - Replace `your-dockerhub-username` with your Docker Hub username

3. Make the deploy script executable:
   ```bash
   chmod +x deploy.sh
   ```

4. Run the deployment script:
   ```bash
   ./deploy.sh
   ```

## Manual Deployment

If you prefer to deploy manually:

1. Build and start the containers:
   ```bash
   docker-compose up --build -d
   ```

2. Stop the application:
   ```bash
   docker-compose down
   ```

## Accessing the Application

- Frontend: http://localhost
- Backend API: http://localhost:5000
- MongoDB: localhost:27017 (accessible to the application internally)

## Container Details

### Frontend Container
- Base image: Node.js (build) + Nginx (serve)
- Port: 80
- Features:
  - Multi-stage build for optimized image size
  - Nginx configuration for SPA routing
  - API proxy configuration

### Backend Container
- Base image: Node.js
- Port: 5000
- Environment variables:
  - MONGODB_URI
  - PORT

### MongoDB Container
- Base image: Latest MongoDB
- Port: 27017
- Persistent volume for data storage

## Architecture

The application uses a three-tier architecture:
1. Frontend (React) served by Nginx
2. Backend API (Express.js)
3. Database (MongoDB)

All services are connected through a Docker network, allowing for isolated and secure communication.

## Development

To modify the application:

1. Frontend changes:
   - Make changes in the frontend directory
   - Rebuild using `docker-compose up --build frontend`

2. Backend changes:
   - Make changes in the backend directory
   - Rebuild using `docker-compose up --build backend`

## Troubleshooting

1. If containers fail to start:
   ```bash
   docker-compose logs
   ```

2. To reset the environment:
   ```bash
   docker-compose down -v
   ```

3. To check container status:
   ```bash
   docker-compose ps
   ```

## Security Considerations

- MongoDB is not exposed to the host by default
- Environment variables should be properly configured in production
- NGINX is configured to proxy API requests securely
- Container images are based on Alpine for minimal attack surface