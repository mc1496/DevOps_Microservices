# import json

# # import requests


# def lambda_handler(event, context):
#     """Sample pure Lambda function

#     Parameters
#     ----------
#     event: dict, required
#         API Gateway Lambda Proxy Input Format

#         Event doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html#api-gateway-simple-proxy-for-lambda-input-format

#     context: object, required
#         Lambda Context runtime methods and attributes

#         Context doc: https://docs.aws.amazon.com/lambda/latest/dg/python-context-object.html

#     Returns
#     ------
#     API Gateway Lambda Proxy Output Format: dict

#         Return doc: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html
#     """

#     # try:
#     #     ip = requests.get("http://checkip.amazonaws.com/")
#     # except requests.RequestException as e:
#     #     # Send some context about this error to Lambda Logs
#     #     print(e)

#     #     raise e

#     return {
#         "statusCode": 200,
#         "body": json.dumps({
#             "message": "hello world",
#             # "location": ip.text.replace("\n", "")
#         }),
#     }

import json
import wikipedia

# prints when function loads
print('Loading function')


def lambda_handler(event, context):
    ''' Wikipedia page summarizer.
        :param event: a request with a wikipedia "entity" that has page information
        :return: a response that contains the first sentence of a wikipedia page,
            the response is JSON formatted.'''
    
    # check that the request has some input body
    if 'body' in event:
        event = json.loads(event["body"])
    
    # get the wikipedia "entity" from the body of the request
    entity = event["entity"]
    # res = wikipedia.summary(entity, sentences=1) # first sentence, result
    BAD_REQUEST_STATUS = 400
    ALL_GOOD_STATUS = 200 
    # Exception handling
    try:
        res = wikipedia.summary(entity, sentences=1) # first sentence, result
        statusCode = ALL_GOOD_STATUS
    except wikipedia.exceptions.PageError:
        res= "\nThis word does not exist!\n"
        statusCode = BAD_REQUEST_STATUS
    except wikipedia.exceptions.DisambiguationError: 
        statusCode = BAD_REQUEST_STATUS
        res = "\nThere are multiple references to this word!\n"
    except:
        statusCode = BAD_REQUEST_STATUS
        res = "\nSorry, Cannot Handle this request!\n"

    # print statements
    print(f"context: {context}, event: {event}")
    print(f"Response from wikipedia API: {res}")
    
    # format the response as JSON and return the result
    response = {
        "statusCode": statusCode, 
        "headers": { "Content-type": "application/json" },
        "body": json.dumps({"message": res})
    }
    
    return response
