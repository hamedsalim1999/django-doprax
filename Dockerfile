# base image
FROM python:3.10.0b4-alpine3.14
# Set working directory
RUN mkdir /app
# set working directory
WORKDIR /app
# coppy commands 
COPY . /app
# Installing requirements
ADD requirements.txt /app
# run commnad  for install 
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# Collect static files
# RUN python core/manage.py collectstatic --no-input
# # migrations command
# RUN python core/manage.py makemigrations
# RUN python core/manage.py migrate
# Run command for start app with gunicorn
# EXPOSEport
EXPOSE 5000
CMD ["gunicorn","--bind", "0.0.0.0:5000", "core.wsgi:application"]
