# Use Python 3.9 as the base image (comes with Python pre-installed)
FROM python:3.9

# Set the working directory inside the container
# All subsequent commands will be executed relative to this directory
WORKDIR /english_to_french_machine_translator

# Copy the main application file and dependency list into the container
COPY app.py requirements.txt ./

# Copy the 'model' directory into the container
COPY model ./model
# add templates so it can find index.html and run it on port 5000
COPY templates ./templates

# Install required Python packages listed in requirements.txt
# The --no-cache-dir option prevents caching to reduce the image size
RUN pip install --no-cache-dir -r requirements.txt

# Inform Docker that this container listens on port 5000
# This is only for documentation; actual port mapping is done when running the container
EXPOSE 5000

# Define the command to execute when the container starts
# This runs the Flask application
CMD ["python", "app.py"]

# Build the Docker image with the tag 'translation-app':
# docker build -t translation-app .

# Run the container and map port 5000 on the host to port 5000 in the container:
# docker run -p 5000:5000 translation-app
