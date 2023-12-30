cd python-docs-samples/functions/helloworld/

gcloud functions deploy python-http-function ^
 --gen2 ^
 --runtime=python312 ^
 --region=europe-west1 ^
 --source=. ^
 --entry-point=hello_get ^
 --trigger-http 

gcloud services enable apigateway.googleapis.com
gcloud services enable servicemanagement.googleapis.com
gcloud services enable servicecontrol.googleapis.com

gcloud api-gateway apis create scareflix-cat --project=scareflix

cd ../../..

gcloud api-gateway api-configs create scareflix-cat-hello-config ^
  --api=scareflix-cat --openapi-spec=openapi2-functions.yaml ^
  --project=scareflix --backend-auth-service-account=50461393030-compute@developer.gserviceaccount.com

gcloud api-gateway gateways create scareflix-cat-gateway ^
  --api=scareflix-cat --api-config=scareflix-cat-hello-config  ^
  --location=europe-west1 --project=scareflix

