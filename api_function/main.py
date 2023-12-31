import functions_framework
from google.cloud import firestore_v1

@functions_framework.http
def hello_get(request):
    """HTTP Cloud Function.
    Args:
        request (flask.Request): The request object.
        <https://flask.palletsprojects.com/en/1.1.x/api/#incoming-request-data>
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
        <https://flask.palletsprojects.com/en/1.1.x/api/#flask.make_response>.
    Note:
        For more information on how Flask integrates with Cloud
        Functions, see the `Writing HTTP functions` page.
        <https://cloud.google.com/functions/docs/writing/http#http_frameworks>
    """
    return "Hello World!"

@functions_framework.http
def get_videos(request):
    db = firestore_v1.Client(project='scareflix', database='scareflix-db')
    col_ref = db.collection("videos")
    return [doc.to_dict() for doc in col_ref.get()]
