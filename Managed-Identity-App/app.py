from flask import Flask
from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient
import os

app = Flask(__name__)

KEY_VAULT_NAME = os.environ.get("KEY_VAULT_NAME", "kv-mi-5673")
SECRET_NAME = os.environ.get("SECRET_NAME", "MySecret001")
KV_URI = f"https://{KEY_VAULT_NAME}.vault.azure.net/"

@app.route("/")
def index():
    try:
        credential = DefaultAzureCredential()
        client = SecretClient(vault_url=KV_URI, credential=credential)

        secret = client.get_secret(SECRET_NAME).value

        # Mask secret: first 4 chars, ****, last char
        masked_secret = secret[:4] + "****" + secret[-1:]

        return f"""
        <h2>🔑 Your secure value has been retrieved successfully!</h2>
        <p>(Partial): {masked_secret}</p>
        """

    except Exception as e:
        return f"<h2>Error reading secret</h2><pre>{str(e)}</pre>", 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
