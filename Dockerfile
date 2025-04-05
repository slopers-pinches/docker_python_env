# Use Python image as the base
FROM python:3.10-slim-bookworm

# Set the working directory inside the container
WORKDIR /bhsam_env

# Copy the requirements file into the container at $WORKDIR
COPY requirements.txt requirements.txt

# Set up and activate virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Upgrade any default python libraries
RUN pip install --upgrade pip setuptools
RUN pip install wheel

# Install any needed packages from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . . 

# Specify the command to run when the container starts
CMD ["python", "bash"]