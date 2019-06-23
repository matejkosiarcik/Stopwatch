FROM python:3.7

LABEL maintainer="Matej Košiarčik <matej.kosiarcik@gmail.com>"
LABEL name="matejkosiarcik/stopwatch"

COPY stopwatch/stopwatch.py /
ENTRYPOINT ["python", "stopwatch.py"]
CMD []
