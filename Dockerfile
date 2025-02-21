# Use official Python image as base
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy only the requirements file to leverage Docker cache
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose the port that Django runs on
EXPOSE 8000

# Run database migrations
RUN python manage.py migrate

# Command to run the app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
