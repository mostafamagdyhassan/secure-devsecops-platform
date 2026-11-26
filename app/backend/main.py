from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI(
    title="Secure DevSecOps Platform API",
    version="1.0.0",
    docs_url="/docs",
    redoc_url=None,
)

# No wildcard CORS policy. Add trusted frontend origins here if required.
app.add_middleware(
    CORSMiddleware,
    allow_origins=[],
    allow_credentials=False,
    allow_methods=["GET"],
    allow_headers=["*"],
)


@app.middleware("http")
async def add_security_headers(request, call_next):
    response = await call_next(request)

    response.headers["X-Content-Type-Options"] = "nosniff"
    response.headers["X-Frame-Options"] = "DENY"
    response.headers["Referrer-Policy"] = "strict-origin-when-cross-origin"
    response.headers["Cache-Control"] = "no-store"
    response.headers["Content-Security-Policy"] = "default-src 'none'; frame-ancestors 'none'"

    return response


@app.get("/")
async def root():
    return {
        "application": "Secure DevSecOps Platform",
        "status": "running",
    }


@app.get("/health")
async def health():
    return {"status": "healthy"}


@app.get("/ready")
async def ready():
    return {"status": "ready"}


# Expose Prometheus metrics at /metrics.
Instrumentator().instrument(app).expose(
    app,
    endpoint="/metrics",
    include_in_schema=False,
)
