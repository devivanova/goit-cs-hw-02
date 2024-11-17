FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    curl \
    bash

COPY website_checker.sh /usr/local/bin/website_checker.sh

RUN chmod +x /usr/local/bin/website_checker.sh

WORKDIR /usr/local/bin

CMD ["bash", "/usr/local/bin/website_checker.sh"]
