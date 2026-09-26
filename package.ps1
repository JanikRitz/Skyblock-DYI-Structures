$ErrorActionPreference = 'Stop'

$source = Join-Path $PSScriptRoot 'skyblock_datapack'
$outputDirectory = Join-Path $PSScriptRoot 'dist'
$archive = Join-Path $outputDirectory 'empty_world_skyblock.zip'

if (-not (Test-Path (Join-Path $source 'pack.mcmeta'))) {
    throw "Datapack metadata not found in '$source'."
}

New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem
if (Test-Path $archive) {
    Remove-Item $archive -Force
}

$zip = [System.IO.Compression.ZipFile]::Open($archive, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    Get-ChildItem -LiteralPath $source -File -Recurse | ForEach-Object {
        $entryName = $_.FullName.Substring($source.Length).TrimStart('\', '/') -replace '\\', '/'
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
            $zip,
            $_.FullName,
            $entryName,
            [System.IO.Compression.CompressionLevel]::Optimal
        ) | Out-Null
    }
}
finally {
    $zip.Dispose()
}

Write-Output "Packaged datapack: $archive"