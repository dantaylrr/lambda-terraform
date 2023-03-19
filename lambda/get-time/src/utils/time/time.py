from datetime import datetime

class Time(object):
    
    def __init__(
        self,
        **kwargs
        ):

        super().__init__(**kwargs)

    def get_the_current_time(self, custom_datetime=None):
        # custom_datetime will never be specified here & is only used for testing purposes.
        if not custom_datetime:
            # Get current timestamp.
            now = datetime.now()
            # Return year, month, day, hour.
            year, month, day, hour, minute = now.year, now.month, now.day, now.hour, now.minute

        # Won't be used, only for unit testing purposes.
        else:
            year, month, day, hour, minute = custom_datetime.year, custom_datetime.month, custom_datetime.day, custom_datetime.hour, custom_datetime.minute
        
        return year, month, day, hour, minute