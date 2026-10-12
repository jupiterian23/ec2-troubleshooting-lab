import platform
import socket
import time
from datetime import datetime, timezone
from pathlib import Path

import psutil
from fastapi import FastAPI
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles

BASE_DIR = Path(__file__).resolve().parent
HTML_FILE = BASE_DIR / "application" / "index.html"

app = FastAPI(
    title="CloudOps Troubleshooting API",
    description="Local Linux system monitoring API",
    version="1.0.0",
)

# Measure CPU usage over a short interval.
psutil.cpu_percent(interval=None)


@app.get("/", include_in_schema=False)
def dashboard():
    return FileResponse(HTML_FILE)


@app.get("/api/health")
def health():
    memory = psutil.virtual_memory()
    disk = psutil.disk_usage("/")
    cpu = psutil.cpu_percent(interval=0.2)

    return {
        "hostname": socket.gethostname(),
        "platform": platform.platform(),
        "cpu_percent": cpu,
        "memory_percent": memory.percent,
        "memory_used_mb": round(memory.used / (1024 ** 2), 2),
        "memory_total_mb": round(memory.total / (1024 ** 2), 2),
        "disk_percent": disk.percent,
        "disk_used_gb": round(disk.used / (1024 ** 3), 2),
        "disk_total_gb": round(disk.total / (1024 ** 3), 2),
        "uptime_seconds": int(time.time() - psutil.boot_time()),
        "timestamp": datetime.now(timezone.utc).isoformat(),
    }


@app.get("/api/ready")
def ready():
    return {"status": "ready"}
