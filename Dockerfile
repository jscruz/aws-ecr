FROM python:alpine

ARG CLI_VERSION=1.16.134

RUN apk -uv add --no-cache groff jq less && \
    pip install --no-cache-dir awscli==$CLI_VERSION

COPY ecr-repo.sh .

ENTRYPOINT ["./ecr-repo.sh"]
