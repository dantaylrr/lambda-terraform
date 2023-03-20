from datetime import datetime

class Date(object):
    
    def __init__(
        self,
        **kwargs
        ):

        super().__init__(**kwargs)

    def get_the_current_date(self, custom_date=None):
        # custom_datetime will never be specified here & is only used for testing purposes.
        if not custom_date:
            # Get current timestamp.
            now = datetime.now()
            # Return year, month, day
            year, month, day = now.year, now.month, now.day

        # Won't be used, only for unit testing purposes.
        else:
            year, month, day = custom_date.year, custom_date.month, custom_date.day
        
        return year, month, day