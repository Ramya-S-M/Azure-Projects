from flask import Flask
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import os

app = Flask(__name__)
KV_URI = "https://Your_Keyvault_URL/"
SECRET_NAME = "Your_Secret_name"

@app.route("/")
def index():
    credential = DefaultAzureCredential()
    client = SecretClient(vault_url=KV_URI, credential=credential)
    secret = client.get_secret(SECRET_NAME).value
    masked_secret = secret[:4] + "****" + secret[-1:]
    return f"🔑 Your secure value has been retrieved successfully!<br>(Partial): {masked_secret}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)