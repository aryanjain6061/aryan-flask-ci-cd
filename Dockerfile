FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/ app/

# Security: run as non-root user
RUN useradd -m appuser
USER appuser

# Expose port
EXPOSE 5000

# Start application (production server)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app.main:app"]
