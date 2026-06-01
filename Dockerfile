FROM python:3.11-slim

WORKDIR /app

# System dependencies for OpenCV, PaddleOCR, Tesseract, EasyOCR
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    libgomp1 \
    tesseract-ocr \
    tesseract-ocr-ara \
    tesseract-ocr-eng \
    && rm -rf /var/lib/apt/lists/*

# Install CPU-only PyTorch first (smaller, ~200MB vs ~2GB GPU version)
RUN pip install --no-cache-dir torch --index-url https://download.pytorch.org/whl/cpu

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all source files
COPY . .

# Persistent storage (survives app restarts on HF Spaces)
RUN mkdir -p /data/uploads /data/crops /data/exports

EXPOSE 7860

ENV STREAMLIT_SERVER_HEADLESS=true
ENV STREAMLIT_BROWSER_GATHER_USAGE_STATS=false

CMD ["streamlit", "run", "app.py", \
     "--server.port=7860", \
     "--server.address=0.0.0.0", \
     "--server.headless=true", \
     "--browser.gatherUsageStats=false"]
