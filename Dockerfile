FROM ubuntu:22.04

RUN apt-get update -y

# Copy application code
COPY . /app
WORKDIR /app

# Install Python, pip, and mysql-client
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    default-mysql-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Install Python dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Expose Flask app port
EXPOSE 81

# Start the Flask app
ENTRYPOINT ["python3"]
CMD ["app.py"]