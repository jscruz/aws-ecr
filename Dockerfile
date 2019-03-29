FROM python:alpine

ARG CLI_VERSION=1.16.134

RUN apk -uv add --no-cache groff jq less curl && \
    pip install --no-cache-dir awscli==$CLI_VERSION

COPY ecr-repo.sh /opt/ecr-repo
RUN chmod +x /opt/ecr-repo

ENTRYPOINT ["sh", "/opt/ecr-repo"]
