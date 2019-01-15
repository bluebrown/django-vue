
FROM python
COPY . /django-rest-api/
WORKDIR /django-rest-api/
RUN pip install -r requirements.txt
CMD ["python",  "manage.py", "runserver", "0:8000"]

