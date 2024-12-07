FROM python:3.9-slim

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app.py .

# Expose port
EXPOSE 8080

# Ensure gunicorn is executable
RUN chmod +x /usr/local/bin/gunicorn

# Use exec form of CMD to allow graceful shutdown
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
