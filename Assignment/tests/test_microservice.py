import pytest
import sys
import os

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../app')))
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_index_route(client):
    """Test root endpoint response."""
    rv = client.get('/')
    assert rv.status_code == 200
    json_data = rv.get_json()
    assert json_data['status'] == 'online'
    assert json_data['service'] == 'DevOps Assignment Microservice'

def test_health_endpoint(client):
    """Test health check route."""
    rv = client.get('/health')
    assert rv.status_code == 200
    json_data = rv.get_json()
    assert json_data['status'] == 'healthy'

def test_metrics_endpoint(client):
    """Test API metrics endpoint."""
    rv = client.get('/api/metrics')
    assert rv.status_code == 200
    json_data = rv.get_json()
    assert 'cpu_usage' in json_data
    assert 'memory_usage' in json_data
