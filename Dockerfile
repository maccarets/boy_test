FROM python:3.7
LABEL maintainers="maccarets@gmail.com"

ENV PYTHONUNBUFERED 1

WORKDIR echo_bot/

COPY requirements.txt requirements.txt

RUN apt-get update \
    && apt-get -y install libpq-dev gcc

RUN pip install -r requirements.txt
RUN adduser --disabled-password --no-create-home user

# Make port 80 available to the world outside this container
EXPOSE 8000

COPY . .


USER user

