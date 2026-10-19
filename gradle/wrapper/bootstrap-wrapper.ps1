$ErrorActionPreference = 'Stop'
$wrapperDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$jarPath = Join-Path $wrapperDirectory 'gradle-wrapper.jar'
if (Test-Path -LiteralPath $jarPath) { exit 0 }

$jarUrls = @(
    'https://raw.githubusercontent.com/gradle/gradle/v8.13.0/gradle/wrapper/gradle-wrapper.jar',
    'https://github.com/gradle/gradle/raw/refs/tags/v8.13.0/gradle/wrapper/gradle-wrapper.jar'
)
$expectedChecksum = '81a82aaea5abcc8ff68b3dfcb58b3c3c429378efd98e7433460610fecd7ae45f'
$downloadPath = Join-Path $wrapperDirectory 'gradle-wrapper.jar.download'
try {
    foreach ($jarUrl in $jarUrls) {
        try {
            Invoke-WebRequest -Uri $jarUrl -OutFile $downloadPath -UseBasicParsing
            $actual = (Get-FileHash -LiteralPath $downloadPath -Algorithm SHA256).Hash
            if ($actual -ine $expectedChecksum) { throw 'Gradle Wrapper checksum did not match.' }
            Move-Item -LiteralPath $downloadPath -Destination $jarPath
            exit 0
        } catch {
            if (Test-Path -LiteralPath $downloadPath) { Remove-Item -LiteralPath $downloadPath }
            if ($jarUrl -eq $jarUrls[-1]) { throw }
        }
    }
} finally {
    if (Test-Path -LiteralPath $downloadPath) { Remove-Item -LiteralPath $downloadPath }
}
