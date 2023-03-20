from src.utils.time.time import Time

def lambda_handler(event, context):

    # Get the current year, month, day, hour.
    year, month, day, hour, minute = Time().get_the_current_time()

    # Return the time from lambda.
    return {
        'statusCode': 200
        'body': f"Hello from Lambda! The current year is {year}, the current month is {month}, the current day is {day}, the current hour is {hour} & the current minute is {minute}."
        }