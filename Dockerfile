FROM ubuntu:20.04

RUN apt-get update -y

# Copy application code
COPY . /app
WORKDIR /app

# Install Python, pip, and mysql-client
RUN set -xe \
    && apt-get update -y \
    && apt-get install -y python3 python3-pip mysql-client

# Install Python dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Expose Flask app port
EXPOSE 81

# Start the Flask app
ENTRYPOINT ["python3"]
CMD ["app.py"]
