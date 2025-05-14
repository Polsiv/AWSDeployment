# building
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app

COPY MoneyBankService.Api/MoneyBankService.Api.csproj MoneyBankService.Api/
COPY MoneyBankService.Application/MoneyBankService.Application.csproj MoneyBankService.Application/
COPY MoneyBankService.Domain/MoneyBankService.Domain.csproj MoneyBankService.Domain/
COPY MoneyBankService.Infrastructure/MoneyBankService.Infrastructure.csproj MoneyBankService.Infrastructure/
RUN dotnet restore MoneyBankService.Api/MoneyBankService.Api.csproj

COPY . .

RUN dotnet public MoneyBankService.Api/MoneyBankService.Api.csproj -c Release -o /app/publish

# runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 80
ENTRYPOINT ["dotnet", "MoneyBankService.Api.dll"]