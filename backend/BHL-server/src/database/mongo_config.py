import motor.motor_asyncio

# MONGO_DETAILS = "mongodb://mongodb:27017"
MONGO_DETAILS = "mongodb://localhost:27017"
client = motor.motor_asyncio.AsyncIOMotorClient(MONGO_DETAILS)
db = client.get_database("bhl-BackBuddy")