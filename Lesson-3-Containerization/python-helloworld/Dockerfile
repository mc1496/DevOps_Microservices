FROM python:3.8
LABEL maintainer="Udacity"

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

# Expose port 5000
EXPOSE 5000

# command to run on container start
CMD [ "python", "app.py" ]
