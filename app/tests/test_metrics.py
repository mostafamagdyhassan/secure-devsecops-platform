from fastapi.testclient import TestClient

from backend.main import app

client = TestClient(app)


def test_metrics_endpoint_is_available():
    response = client.get("/metrics")

    assert response.status_code == 200
    assert "text/plain" in response.headers["content-type"]


def test_metrics_endpoint_returns_prometheus_data():
    response = client.get("/metrics")

    assert response.status_code == 200
    assert "python_info" in response.text or "process_" in response.text
