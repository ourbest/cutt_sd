FROM python:3


RUN mkdir -p /code/
WORKDIR /code/
ADD requirements.txt .

RUN pip install -r requirements.txt

ADD cutt_sd .

EXPOSE 4367

ENTRYPOINT ["gunicorn", "-k", "gevent", "-t", "30", "-b", "0.0.0.0:4367", "cutt_sd.server:app"]