# 1. Use the official Ubuntu LTS base image
FROM ubuntu:24.04

# 2. Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# 3. Update package lists and install Apache2, then clean up to reduce image size
RUN apt-get update && \
    apt-get install -y --no-install-recommends apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 4. (Optional) Set up a custom environment variable for your web directory
WORKDIR /var/www/html

# 5. Expose HTTP port 80 to allow external access
EXPOSE 80

# 6. Start Apache in the foreground so the container stays running
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
