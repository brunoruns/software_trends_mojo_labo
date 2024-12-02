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
RUN curl -sSL https://magic.modular.com/ | bash && \
    echo "source /root/.magic/setup" >> /root/.bashrc

# Add Magic to PATH
ENV PATH="/root/.magic/bin:$PATH"

# Set up a workspace directory
WORKDIR /workspace

# Install Jupyter Notebook
RUN pip3 install --upgrade pip && pip3 install notebook

# Expose Jupyter port
EXPOSE 8888

# Default command
CMD ["bash", "-c", "source /root/.magic/setup && bash"]
