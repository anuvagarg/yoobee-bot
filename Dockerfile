FROM python:3.10.6

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

RUN python -m nltk.downloader punkt

EXPOSE $PORT

CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app