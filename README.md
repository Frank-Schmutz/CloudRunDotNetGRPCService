This repo serves as a minimal examples to reproduce a bug when deploy on GCP Cloud Run

**Steps to create this service**

If you want to recreate this example from scratch open Visual Studio and create a new project with the "gRPC Service (C#)" template. You need .NET Core 3.1 installed to have access to this template. The only subsequent code modification in the `Program.cs` file where we explicitly listen to the port number provided by the "PORT" environment variable.

**Testing**

To build the image:

`docker build -f Dockerfile . -t gcr.io/$PROJECT_ID/dotnetgrpctest:latest`

To upload the image to gcr:

`docker push gcr.io/$PROJECT_ID/dotnetgrpctest:latest`

Then deploy on Cloud Run (fully managed) with 'Allow unauthenticated invocations' ticked (Step 3 in the Authentication section)

The bug can be observed by simply entering the service's URL in a web browser. Excepted behaviour should be to have the message "Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909" printed when accessing that address.
