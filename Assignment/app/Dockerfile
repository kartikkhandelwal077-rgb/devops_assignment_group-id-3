# Dockerfile for DevOps Microservice
FROM python:3.11-slim

WORKDIR /app

# Copy dependency definition
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY . .

# Expose microservice port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py
ENV ENVIRONMENT=production

# Healthcheck definition
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:5000/health || exit 1

CMD ["python", "app.py"]
