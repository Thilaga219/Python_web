# First stage: build stage
FROM python:3.9-alpine AS builder
 
# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
 
# Set the working directory
WORKDIR /app
 
# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt
 
# Copy the application files
COPY . /app
 
# Second stage: production stage
FROM python:3.9-alpine
 
# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
 
# Set the working directory
WORKDIR /app
 
# Copy only the necessary files from the builder stage
COPY --from=builder /app /app
 
# Install Gunicorn
RUN pip install -r requirements.txt
 
# Expose port 5000
EXPOSE 5000
 
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# Run the application with Gunicorn
#CMD ["gunicorn", "-b", "0.0.0.0:5001", "app:app"]
ENTRYPOINT [ "/entrypoint.sh" ]