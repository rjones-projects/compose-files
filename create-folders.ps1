# Creates every volume folder listed in volumes.yaml under ~/docker (or the root given as -Root).
param([string]$Root = (Join-Path $HOME 'docker'))
$ErrorActionPreference = 'Stop'
Select-String -Path (Join-Path $PSScriptRoot 'volumes.yaml') -Pattern '^\s+device: /home/roland/docker/(.+)$' |
    ForEach-Object { (New-Item -ItemType Directory -Force -Path (Join-Path $Root $_.Matches[0].Groups[1].Value.Trim())).FullName }
