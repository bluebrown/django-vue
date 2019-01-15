FROM python
COPY . /backend/
WORKDIR /backend/
RUN pip install -r requirements.txt
CMD ["python",  "manage.py", "runserver", "0:8000"]

