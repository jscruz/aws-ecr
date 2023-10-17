FROM python:alpine

RUN apk -uv add --no-cache groff jq less curl zip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

COPY ecr-repo.sh /opt/ecr-repo
RUN chmod +x /opt/ecr-repo

ENTRYPOINT ["sh", "/opt/ecr-repo"]
