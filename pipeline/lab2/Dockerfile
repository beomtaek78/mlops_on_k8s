FROM python:3.9-slim

# 필요한 라이브러리 설치
RUN pip install torch torchvision --extra-index-url https://download.pytorch.org/whl/cpu

# 코드 복사
COPY mnist.py /opt/mnist.py

# 실행 명령
ENTRYPOINT ["python", "/opt/mnist.py"]
