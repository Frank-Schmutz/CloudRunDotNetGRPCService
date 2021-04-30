This repo serves as a minimal examples to reproduce a bug when deploy on GCP Cloud Run

**Steps to create this service**

If you want to recreate this example from scratch open Visual Studio and create a new project with the "gRPC Service (C#)" template. You need .NET Core 3.1 installed to have access to this template. The only subsequent code modification in the `Program.cs` file where we explicitly listen to the port number provided by the "PORT" environment variable.

**Testing**

To build the image:

`docker build -f Dockerfile . -t gcr.io/$PROJECT_ID/dotnetgrpctest:latest`

To upload the image to gcr:

`docker push gcr.io/$PROJECT_ID/dotnetgrpctest:latest`

Then deploy on Cloud Run (fully managed) with 'Allow unauthenticated invocations' ticked (Step 3 in the Authentication section)

You can download a client to test this server [here](https://github.com/Frank-Schmutz/CloudRunDotNetGRPCClient).

Or you can create your own client with the [official documentation](https://go.microsoft.com/fwlink/?linkid=2086909").
