# Use the official .NET 9 SDK image as the build environment
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# Set the working directory
WORKDIR /app

# Copy the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application code
COPY . ./

# Build the application
RUN dotnet build -c Release -o /out

# Publish the application
RUN dotnet publish -c Release -o /out

# Use the official .NET runtime image as the runtime environment
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime

# Set the working directory
WORKDIR /app

# Copy the published application from the build environment
COPY --from=build /out .

# Expose the port the application runs on
EXPOSE 80

# Set the entry point for the application
ENTRYPOINT ["dotnet", "SI514.dll"]
