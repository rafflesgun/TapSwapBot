
#Build: docker buildx build --platform linux/arm64 --push -t rafflesg/tapswapbot-1:latest .
FROM python:3.11.4-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    libssl-dev \
    wget \
    curl \
    gnupg \
    apt-transport-https \
    ca-certificates \
    chromium \
    chromium-sandbox

RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install --no-warn-script-location --no-cache-dir -r requirements.txt

CMD ["python3", "main.py", "-a", "3"]
