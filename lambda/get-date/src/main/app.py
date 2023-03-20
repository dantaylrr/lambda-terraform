import json
from src.utils.date.date import Date

def lambda_handler(event, context):

    # Get the current year, month, day, hour.
    year, month, day = Date().get_the_current_date()

    # Return the time from lambda.
    return {
        'statusCode': 200,
        'body': json.dumps(f"Hello from Lambda! The current date is {year}/{month}/{day}.")
        }