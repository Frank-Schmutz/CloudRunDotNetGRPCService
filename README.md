This repo serves as a minimal examples to reproduce a bug when deploy on GCP Cloud Run

To build the image:

`docker build -f Dockerfile . -t gcr.io/$PROJECT_ID/dotnetgrpctest:latest`

To upload the image to gcr:

`docker push gcr.io/$PROJECT_ID/dotnetgrpctest:latest`

Then deploy on Cloud Run (fully managed) with 'Allow unauthenticated invocations' ticked (Step 3 in the Authentication section)

The bug can be observed by simply entering the service's URL in a web browser. Excepted behaviour should be to have the message "Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909" printed when accessing that address.
