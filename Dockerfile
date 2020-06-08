#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-nanoserver-1909 AS base
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:8080
# ENV ASPNETCORE_URLS=https://+:443
EXPOSE 8080
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-nanoserver-1909 AS build
WORKDIR /src
COPY ["hellomachine.csproj", "./"]
RUN dotnet restore "./hellomachine.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "hellomachine.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "hellomachine.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "hellomachine.dll"]
