FROM python:3.10-slim
ENV PYTHONUNBUFFERED True
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app