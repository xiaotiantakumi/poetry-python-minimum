import uvicorn
from pydantic import BaseModel
from fastapi import FastAPI

app = FastAPI()


class HelloWorld(BaseModel):
    message: str


@app.get("/hello-world", response_model=HelloWorld)
async def hello_world():
    return HelloWorld(message="Hello world4")

# デバッグするために以下が必要となります。
# 本番環境では、DockerFileより生成されるのでsrc.api.mainが__main__になるため以下は実行されません。
if __name__ == "__main__":
    uvicorn.run("app:app", host="0.0.0.0", port=8000, reload=True, workers=1)
