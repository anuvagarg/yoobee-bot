Make it Work:

```
$ cd 
$ python3 -m venv venv
$ . venv/bin/activate
```
Install dependencies
```
$ (venv) pip install Flask torch torchvision nltk
```
Install nltk package
```
$ (venv) python
>>> import nltk
>>> nltk.download('punkt')
```
Modify `intents.json` with different intents and responses for your Chatbot

Run
```
$ (venv) python train.py
```
This will dump data.pth file. And then run
the following command to test it in the console.
```
$ (venv) python chat.py
```

Now for deployment `app.py` and `app.js`.

```
$ (venv) python app.py

pip freeze > requirements.txt

Containerizing the application

docker build -t python-chatbot .

docker run -p 8000:8000 python-chatbot
```
