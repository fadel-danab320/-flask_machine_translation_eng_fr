# -------------------------------
# 1️⃣ Base Image
# -------------------------------
# Use the official Python 3.9 image as our base
# This comes with Python pre-installed
FROM python:3.9

# -------------------------------
# 2️⃣ Set Working Directory
# -------------------------------
# Create and set the working directory inside the container
# All paths from now on will be relative to this directory
WORKDIR /english_to_french_machine_translator

# -------------------------------
# 3️⃣ Copy Application Files
# -------------------------------
# Copy the main app file (Flask app) and dependency file into the container
COPY app.py requirements.txt ./

# Copy the 'model' directory (machine translation model) into the container
COPY model ./model

# Copy the HTML templates folder (for Flask) into the container
COPY templates ./templates

# -------------------------------
# 4️⃣ Install Dependencies
# -------------------------------
# Install all Python packages listed in requirements.txt
# The '--no-cache-dir' option avoids keeping cache to reduce image size
RUN pip install --no-cache-dir -r requirements.txt

# -------------------------------
# 5️⃣ Expose Port
# -------------------------------
# Tell Docker this app will use port 5000
# (Note: actual port mapping happens during 'docker run')
EXPOSE 5000

# -------------------------------
# 6️⃣ Run the Application
# -------------------------------
# This is the command Docker will run when the container starts
CMD ["python", "app.py"]

# -------------------------------
# 📌 Helpful Commands
# -------------------------------
# Build the Docker image:
#   docker build -t translation-app .
#
# Run the Docker container (map host port 5000 to container port 5000):
#   docker run -p 5000:5000 translation-app
