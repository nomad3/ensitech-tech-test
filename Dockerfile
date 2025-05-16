FROM python:3.9-slim-buster

WORKDIR /app

COPY product_array.py .

CMD ["python", "product_array.py"]
