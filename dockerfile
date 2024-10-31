FROM alpine:latest

ARG ANSIBLE_VERSION

RUN apk add --no-cache \
    python3 \
    openssh-client \
    sshpass \
    pipx \
    && pipx install ansible-core==${ANSIBLE_VERSION} 

COPY grab_this.txt /home/grab_this.txt

WORKDIR /home

ENTRYPOINT ["/root/.local/bin/ansible-playbook"]

CMD [ "--version" ]