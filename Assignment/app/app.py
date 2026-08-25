from flask import Flask, jsonify, request
import os
import time

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({
        "status": "online",
        "service": "DevOps Assignment Microservice",
        "version": "1.0.0",
        "timestamp": time.time()
    })

@app.route("/health")
def health():
    return jsonify({"status": "healthy"}), 200

@app.route("/api/metrics")
def metrics():
    return jsonify({
        "cpu_usage": "12%",
        "memory_usage": "145MB",
        "uptime": "99.99%"
    })

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
