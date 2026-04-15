import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    secret = os.getenv("DB_PASSWORD", "No secret found")
    return f"""
    <h1>Managed Identity + Key Vault</h1>
    <p><b>Secret from Key Vault:</b> {secret}</p>
    """