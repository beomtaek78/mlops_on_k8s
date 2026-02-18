from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Custom Model Server Running"}

@app.post("/predict")
def predict(data: dict):
    value = data.get("value", 0)
    result = value * 2
    return {"result": result}

