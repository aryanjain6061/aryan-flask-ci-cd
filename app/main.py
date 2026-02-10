from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({
        "service": "aryan-flask-ci-cd",
        "status": "running",
        "env": os.getenv("ENVIRONMENT", "dev")
    })

@app.route("/health")
def health():
    return jsonify({"status": "UP"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
