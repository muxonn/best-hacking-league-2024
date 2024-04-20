from fastapi import FastAPI, Depends

from src.endpoints.measurements import router

from src.security import authenticate
from src.security import security


app = FastAPI()

app.include_router(router, prefix='/measurements', tags=['measurements'])

from src.database.mongo_config import db
users_collection = db.get_collection("users")

@app.get("/name/{name}")
async def search(name: str, Verifcation = Depends(authenticate)):
    #If The Verification Function Successfuylly Authenticates The User Then It Will Run The Below SQLite3 Code
    if Verifcation:
        #Insert Code Here
        print(f"Hello {name}!")
    return {"Hello": name}


