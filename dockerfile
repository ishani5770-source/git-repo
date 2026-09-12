# 1. Base Image
FROM python:3.12-slim

# 2. Set Working Directory inside the container
WORKDIR /app

# 3. Copy only dependency definitions first (optimizes layer caching)
COPY requirements.txt .

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the rest of the application source code
COPY . .

# 6. Document the network port the container listens on
EXPOSE 5000

# 7. Define the default command to run when the container starts
CMD ["python", "app.py"]
