FROM python:3.9

ENV SECRET_KEY=django-insecure-nw^y+m^wmxza1asgk+)!ua2qx9)g+#v=6%76-9i8i(6eqiw94j \
    DEBUG=True \
    ALLOWED_HOSTS=* 

WORKDIR /project

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000

CMD python3 manage.py collectstatic && \
    python3 manage.py makemigrations && \
    python3 manage.py migrate --run-syncdb && \
    gunicorn stocks_products.wsgi -b 0.0.0.0:8000
