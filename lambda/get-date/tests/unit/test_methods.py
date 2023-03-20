import pytest
from datetime import datetime
from src.utils.date.date import Date

@pytest.fixture
def datetime_obj1():
    return datetime(1997, 2, 8, 10, 30)

def test_custom_datetime1(datetime_obj1):
    year, month, day = Date().get_the_current_date(custom_date=datetime_obj1)
    assert year == 1997
    assert month == 2
    assert day == 8