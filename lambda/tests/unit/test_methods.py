import pytest
from datetime import datetime
from src.utils.time.time import Time

@pytest.fixture
def datetime_obj1():
    return datetime(1997, 2, 8, 10, 30)

def test_custom_datetime1(datetime_obj1):
    year, month, day, hour, minute = Time().get_the_current_time(custom_datetime=datetime_obj1)
    assert year == 1997
    assert month == 2
    assert day == 8
    assert hour == 10
    assert minute == 30