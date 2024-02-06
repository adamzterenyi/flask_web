FROM python:3.9-slim

LABEL maintainer="aterenyi25@lambda.compute.cmc.edu"
RUN apt-get update && apt-get install -y --no-install-recommends apt && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
