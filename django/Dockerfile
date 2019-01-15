FROM python
COPY . /django/
WORKDIR /django/
RUN pip install -r requirements.txt
CMD ["python",  "manage.py", "runserver", "0:8000"]

