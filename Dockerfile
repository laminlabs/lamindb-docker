FROM python:3.10

RUN mkdir /lamin
WORKDIR /lamin

ADD requirements.txt /lamin
RUN pip install -r requirements.txt