FROM python:3.10.6
RUN mkdir /app
WORKDIR /app
RUN python -m venv venv
COPY . /app
RUN . /app/venv/bin/activate && pip install --upgrade pip
RUN . /app/venv/bin/activate && pip install -r requirements.txt
RUN . /app/venv/bin/python -m pip install --upgrade pip \
                import nltk \
                nltk.download('punkt')\
                exit
RUN . /app/venv/bin/activate && python train.py
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
