# Base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip

# Set working directory
WORKDIR /app

# Download PocketBase binary
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.8/pocketbase_0.22.8_linux_amd64.zip \
    && unzip pocketbase_0.22.8_linux_amd64.zip \
    && chmod +x pocketbase

# Create database folder
RUN mkdir -p /app/pb_data

# Expose port
EXPOSE 8090

# Start PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/pb_data"]
