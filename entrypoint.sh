#!/bin/sh

echo "Starting .NET"
dotnet CloudRunDotNetGRPCService.dll &

echo "Starting Envoy"
/envoy -c /etc/envoy/envoy.yaml

