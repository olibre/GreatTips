FROM python:3.8-slim

# ARG PIP_SERVER_CREDENTIALS

ENV PATH="/home/myuser/.local/bin:${PATH}"
ENV PYTHONPATH="/home/myuser/myproject/:${PYTHONPATH}"

RUN groupadd --gid 1000       myuser \
  && useradd --uid 1000 --gid myuser --shell /bin/dash --create-home myuser

RUN apt update \
 && apt install -yq redis-server gcc python3-dev \
 && apt-get autoremove -yq \
 && apt-get autoclean  -yq

COPY --chown=myuser:myuser Pipfile      /tmp
COPY --chown=myuser:myuser Pipfile.lock /tmp

USER          myuser
WORKDIR /home/myuser

# RUN echo ${PIP_SERVER_CREDENTIALS} > ~/.netrc

RUN pip3 install --user --upgrade pip pipenv
RUN cd /tmp && pipenv lock --requirements > requirements.txt
RUN pip3 install --user --no-warn-script-location -r /tmp/requirements.txt

ADD entrypoint.sh .

ENTRYPOINT ["/bin/dash", "entrypoint.sh"]
