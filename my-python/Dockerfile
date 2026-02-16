FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    curl \
    vim \
    iputils-ping \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    jupyterlab \
    numpy \
    pandas \
    matplotlib \
    kubernetes

WORKDIR /workspace

EXPOSE 8888

# Kubeflow 환경변수를 받아오거나 기본값을 설정합니다.
ENV NB_PREFIX=/

# CMD를 아래와 같이 수정합니다. 
# 핵심은 --ServerApp.base_url 과 --ServerApp.token 입니다.
CMD ["sh", "-c", "jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --ServerApp.token='' --ServerApp.password='' --ServerApp.allow_origin='*' --ServerApp.base_url=${NB_PREFIX}"]
