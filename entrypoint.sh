#!/bin/sh

echo "Starting .NET server ..."
dotnet CloudRunDotNetGRPCService.dll &

echo "Waiting for .NET server to be come up ..."
curl localhost:8081
while [ $? -ne 0 ]
do
  sleep 0.2
  curl localhost:8081
done

echo ".NET server started"


echo "Starting Envoy ..."
/envoy -c /etc/envoy/envoy.yaml

