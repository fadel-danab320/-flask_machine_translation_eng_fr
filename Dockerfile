# Use Python 3.9 slim (smaller image)
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy dependency list first for caching
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY app.py .
COPY model ./model
COPY templates ./templates

# Expose port 5000
EXPOSE 5000

# Set environment variable so Flask runs in production mode
ENV FLASK_ENV=production

# Run the app
CMD ["python", "app.py"]
