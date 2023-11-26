# Use an official Python image as the base image
FROM python:3.10 as builder

# Set the working directory
WORKDIR /app

# Copy only the requirements file to the container
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Use a smaller base image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the installed packages from the builder stage
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages

# Copy the Django project to the container
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=imagegeneratorproject.settings

# Expose the default Django development server port
EXPOSE 8000

# Collect static files
RUN python manage.py collectstatic --noinput

# Apply database migrations
RUN python manage.py migrate

# Start the Django development server on container port 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
