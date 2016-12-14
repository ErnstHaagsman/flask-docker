FROM python:3.5

WORKDIR /app

ENTRYPOINT ["python"]

EXPOSE 5000

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app

CMD  ["flask-docker.py"]