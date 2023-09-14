## Initium Sample Project

A simple Django app that only provides user registraton and login.

### Run via Docker

Start containers: `docker-compose up -d --build`

Migrate database: `docker-compose exec web python manage.py migrate`

Collect static files: `docker-compose exec web python manage.py collectstatic`

(Optional) create super user: `docker-compose exec web python manage.py createsuperuser`

Check logs: `docker-compose logs`

Access website at http://localhost:1337/

### Run without Docker

Create a virtual environment: `python -m venv env`

Activate environment: `source env/bin/activate`

Install dependencies: `pip install -r requirements.txt`

Run development server: `DEBUG=1 ./manage.py runserver`

Access website at http://localhost:8000/

### Predefined user accounts (in local database)

- admin / admin (is an employee)
- mike / marabella (is not an employee)
