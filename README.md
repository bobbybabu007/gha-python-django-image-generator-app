# Image Generator Application
### (Multi-Page Dockerized App using Python-Django & HTML/CSS)

Generate the dependancy requirements.txt
```bash
pip freeze > requirements.txt
```

Command to run this application locally

```bash
python manage.py runserver 8000
# OR
python manage.py runserver 0.0.0.0:8000
```

Build the image using the following command

```bash
$ docker build -t image-generator-app:latest .
```

Run the Docker container using the command shown below.

```bash
$ docker run -d -p 8000:8000 -generator-app
```

The application will be accessible at http://127.0.0.1:8000 or http://localhost:8000



