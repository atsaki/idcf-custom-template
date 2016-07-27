FROM python:2.7
RUN pip install cs ansible sshpubkeys
RUN curl -s -o /usr/bin/jq http://stedolan.github.io/jq/download/linux64/jq && \
    chmod +x /usr/bin/jq
RUN mkdir -p /etc/ansible ; \
    echo "[defaults]"                                       > /etc/ansible/ansible.cfg; \
    echo "host_key_checking = False"                       >> /etc/ansible/ansible.cfg;
