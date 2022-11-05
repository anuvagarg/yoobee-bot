FROM python:3.10.6

COPY . /app

WORKDIR /app

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

RUN python -m nltk.downloader punkt

ADD intents.json nltk_utils.py model.py train.py chat.py app.py ./app/

RUN python ./train.py

EXPOSE $PORT

CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app