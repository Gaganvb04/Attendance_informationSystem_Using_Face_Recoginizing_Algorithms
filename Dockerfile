FROM python:3.10

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libgl1-mesa-dev \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

COPY app/requirements.txt .
RUN pip install --default-timeout=1000 --no-cache-dir -r requirements.txt


COPY app/ .

CMD ["python", "main.py"]
