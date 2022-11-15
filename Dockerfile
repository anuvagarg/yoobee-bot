FROM python:3.10.6

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

RUN python -m nltk.downloader punkt

COPY . .

ADD intents.json nltk_utils.py model.py train.py chat.py app.py ./

RUN python ./train.py

EXPOSE $PORT

CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app

# COPY . /app

# WORKDIR /app

# RUN python3 -m venv venv

# RUN . venv/bin/activate

# RUN pip install --upgrade pip

# RUN pip install -r requirements.txt

# RUN python -m nltk.downloader punkt

# RUN python ./train.py

# EXPOSE $PORT

# CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
