FROM python:alpine

ARG CLI_VERSION=1.18.32

RUN apk -uv add --no-cache groff jq less curl && \
    pip install --no-cache-dir awscli==$CLI_VERSION && \
    pip install --no-cache-dir urllib3

COPY ecr-repo.sh /opt/ecr-repo
RUN chmod +x /opt/ecr-repo

ENTRYPOINT ["sh", "/opt/ecr-repo"]
