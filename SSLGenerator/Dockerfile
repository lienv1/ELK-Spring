# Use an official image as a parent image
FROM alpine:latest

# Install OpenSSL
RUN apk add --no-cache openssl

# Set the working directory
WORKDIR /app

# Copy the script into the container
COPY generate_cert.sh /app/generate_cert.sh

# Make the script executable
RUN chmod +x /app/generate_cert.sh

# Run the script
CMD ["sh", "/app/generate_cert.sh"]