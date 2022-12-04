FROM python:3.10.6

COPY . /app

WORKDIR /app

RUN python -m venv venv

RUN . /venv/bin/activate && pip install --upgrade pip

RUN . /venv/bin/activate && pip install -r requirements.txt

RUN . /venv/bin/python -m pip install --upgrade pip \
                import nltk \
                nltk.download('punkt')

RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
