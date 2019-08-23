nohup gunicorn hat.wsgi >logs/gunicorn.log 2>&1 &
nohup celery -A  hat  worker --loglevel=info >logs/celery.log 2>&1 &
nohup celery -A  hat  beat  --loglevel=info >logs/celery_beat.log 2>&1 &
nginx -g 'daemon off;'
