from datetime import datetime

class Time(object):
    
    def __init__(
        self,
        **kwargs
        ):

        super().__init__(**kwargs)

    def get_the_current_time(self):
        # Get current timestamp.
        now = datetime.now()
        # Return year, month, day, hour.

        return now.year, now.month, now.day, now.hour, now.minute