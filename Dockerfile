# Base image
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    git && \
    apt-get clean

# Install Magic (Mojo environment manager)
RUN curl -ssL https://magic.modular.com/ | bash

# Set environment variables for Magic
ENV PATH="/root/.magic/bin:$PATH"

# Create a virtual environment for Mojo
RUN mkdir /workspace && \
    cd /workspace && \
    magic init mojo-dev --format mojoproject && \
    cd mojo-dev && \
    magic shell

# Install Jupyter Notebook
RUN pip3 install notebook
