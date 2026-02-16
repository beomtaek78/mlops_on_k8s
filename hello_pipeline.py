from kfp import dsl

# 1. 컴포넌트 정의 (간단한 더하기 함수)
@dsl.component
def add_op(a: float, b: float) -> float:
    return a + b

# 2. 파이프라인 정의
@dsl.pipeline(
    name='hello-world-pipeline',
    description='A simple intro pipeline'
)
def my_pipeline(val_a: float = 1.0, val_b: float = 2.0):
    # 컴포넌트 호출
    first_add = add_op(a=val_a, b=val_b)
    second_add = add_op(a=first_add.output, b=10.0)

# 3. 컴파일 (YAML 파일 생성)
if __name__ == '__main__':
    from kfp import compiler
    compiler.Compiler().compile(my_pipeline, 'hello_pipeline.yaml')
