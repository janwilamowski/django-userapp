FROM python:3.11.5-slim
ENV APP_HOME=/home/app
ENV APP_USER=app
RUN addgroup --system $APP_USER && adduser --system --group $APP_USER

RUN mkdir -p $APP_HOME/web/static && chown -R $APP_USER:$APP_USER $APP_HOME

WORKDIR $APP_HOME

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN apt-get update && apt-get install -y netcat-traditional && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade pip
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

USER $APP_USER
COPY . .

ENTRYPOINT ["/home/app/entrypoint.sh"]
