from kfp import dsl
from kfp import compiler

# 실습 2: 커스텀 이미지를 사용하는 컴포넌트 정의
@dsl.container_component
def mnist_training_op(lr: float, batch_size: int):
    return dsl.ContainerSpec(
        image='172.16.8.202:30000/custom-mnist:v1', # 실습 2에서 만든 이미지
        command=['python', '/opt/mnist.py'],
        args=[
            '--lr', lr,
            '--batch-size', batch_size
        ]
    )

# 파이프라인 정의
@dsl.pipeline(name='mnist-custom-pipeline')
def mnist_pipeline(lr: float = 0.01, batch_size: int = 64):
    mnist_training_op(lr=lr, batch_size=batch_size)

# YAML 컴파일
if __name__ == '__main__':
    compiler.Compiler().compile(mnist_pipeline, 'mnist_pipeline.yaml')
