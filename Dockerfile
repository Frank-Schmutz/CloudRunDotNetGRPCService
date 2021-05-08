FROM envoyproxy/envoy:v1.18.2 AS envoy-base

#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["CloudRunDotNetGRPCService.csproj", ""]
RUN dotnet restore "./CloudRunDotNetGRPCService.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "CloudRunDotNetGRPCService.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "CloudRunDotNetGRPCService.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

COPY --from=envoy-base /usr/local/bin/envoy /envoy
COPY envoy.yaml /etc/envoy/envoy.yaml

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]