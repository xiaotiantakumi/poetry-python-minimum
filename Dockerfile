FROM python:3.10-slim AS builder
LABEL version="0.1"
LABEL description="api server"

ENV POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_CREATE=false \
    \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    \
    PYSETUP_PATH="/opt/pysetup"

ENV PATH="$POETRY_HOME/bin:$PATH"

RUN apt update && \
    apt install --no-install-recommends -y curl && \
    apt clean

RUN curl --ssl https://install.python-poetry.org | python3

# packages install
RUN mkdir -p /app/src
WORKDIR /app
COPY pyproject.toml /app/pyproject.toml
RUN poetry install --only main

WORKDIR /app/src

EXPOSE 80
CMD ["poetry", "run", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80","--reload"]