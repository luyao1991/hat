FROM python:3.7

COPY sources.list  /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nginx \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/hat
COPY requirements.txt ./
RUN pip install -r requirements.txt -i https://pypi.douban.com/simple/
COPY . .
COPY default  /etc/nginx/sites-enabled
CMD sh start.sh
