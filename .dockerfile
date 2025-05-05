# Use an official base image
FROM ubuntu:20.04

# Set working directory
WORKDIR /app

# Copy all files into the image
COPY . /app

# Make build.sh executable
RUN chmod +x build.sh

# Expose port 80
EXPOSE 80

# Run the build script
CMD ["./build.sh"]

