FROM python:3.9

# Download the model and copy it to the specified directory
RUN mkdir -p /home/.u2net && \
    wget -O /home/.u2net/u2net.onnx https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx

WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 5100

# Command to run the application
CMD ["python", "app.py"]
