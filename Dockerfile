# Use an official lightweight Python image
FROM python:3.12-slim

# Set environment variables for cleaner Python output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies for development
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Create a working directory
WORKDIR /app

# Copy dependency file first (if you have one)
# This allows Docker to cache installs
COPY requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the rest of your project
COPY . /app

# Default command: start a shell for development
CMD ["/bin/bash"]

