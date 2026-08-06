from datetime import datetime, timezone

from fastapi import FastAPI

app = FastAPI(
    title="Quantum Catalyst Synthesizer",
    version="0.1.0",
    description="By The New Faith Church and Co-op, Inc."
)


@app.get("/")
def root():
    return {
        "product": "Quantum Catalyst Synthesizer",
        "organization": "The New Faith Church and Co-op, Inc.",
        "version": "0.1.0",
        "status": "online"
    }


@app.get("/health")
def health():
    return {
        "status": "healthy",
        "timestamp": datetime.now(timezone.utc).isoformat()
    }
