FROM microsoft/dotnet:2.1-sdk AS builder
WORKDIR /source
COPY ./PoorMansRateLimiter.sln .

COPY ./PoorMansRateLimiter/*.csproj ./PoorMansRateLimiter/
RUN dotnet restore

COPY ./PoorMansRateLimiter ./PoorMansRateLimiter

RUN dotnet publish "./PoorMansRateLimiter/PoorMansRateLimiter.csproj" --output "../dist" --configuration Release --no-restore

FROM microsoft/dotnet:2.1-aspnetcore-runtime
WORKDIR /app
COPY --from=builder /source/dist .
EXPOSE 5000
ENTRYPOINT ["dotnet", "PoorMansRateLimiter.dll"]