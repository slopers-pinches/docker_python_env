# Use Python image as the base
FROM python:3.10-slim-bookworm

# Set the working directory inside the container
WORKDIR /codes

# Set up and activate virtual environment
ENV VIRTUAL_ENV "/venv"
RUN python =m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

# Copy the rest of the application code
COPY . . 

# Specify the commond to run when the contianer starts
CMD ["python"]