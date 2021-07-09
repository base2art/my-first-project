$packageName = "Base2art.Bob.CommandLine"

$url = "https://www.nuget.org/api/v2/package/$( $packageName )"

if (-Not(Test-Path ".bob/app.zip"))
{
    Invoke-WebRequest -Uri $url -OutFile ".bob/app.zip"
}

if (-Not(Test-Path ".bob/app"))
{
    Expand-Archive -LiteralPath ".bob/app.zip" -DestinationPath ".bob/app"
}

dotnet  ".bob/app/netcoreapp2.1/Base2art.Bob.Runner.dll" $args

exit $LASTEXITCODE 
