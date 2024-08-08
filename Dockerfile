FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    wget \
    curl \
    && apt-get clean

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install PyYAML using pip
RUN pip3 install --verbose PyYAML

# Copy the Python script to the specified directory
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script to the root directory
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint for the container
ENTRYPOINT ["/entrypoint.sh"]
