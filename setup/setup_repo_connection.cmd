gcloud builds connections create github scareflix-cat-github-conn --region=europe-west1

gcloud builds repositories create scareflix-catalog ^
     --remote-uri=https://github.com/spannerk/scareflix-catalog.git ^
     --connection=scareflix-cat-github-conn --region=europe-west1

