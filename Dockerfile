FROM python:3.8-alpine

RUN pip install pipenv

RUN mkdir /workdir
WORKDIR /workdir

COPY Pipfile Pipfile.lock /workdir/

# Install venv in project dir .venv so that we
# get a predictable path to python
ENV PIPENV_VENV_IN_PROJECT=1
RUN pipenv install

COPY config/ /workdir/

RUN mkdir /workdir/app
WORKDIR /workdir/app

ENTRYPOINT [ "/workdir/.venv/bin/python", "-m" ]
