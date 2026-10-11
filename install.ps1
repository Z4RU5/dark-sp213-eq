# Dark SP-213 EQ installer - https://github.com/Z4RU5/dark-sp213-eq
# Right-click > Run with PowerShell  /  Sağ tık > PowerShell ile Çalıştır
#
# Puts the chosen preset into Equalizer APO as dark-sp213.txt and makes config.txt use it.
# The old config.txt is kept as config.before-dark-sp213.txt.

param(
    [string]$ConfigDir  # only for testing; normally read from the registry
)

$ErrorActionPreference = 'Stop'
$tr = [Globalization.CultureInfo]::CurrentUICulture.TwoLetterISOLanguageName -eq 'tr' -or (Get-Culture).TwoLetterISOLanguageName -eq 'tr'
function Say([string]$en, [string]$trText) { if ($tr) { $trText } else { $en } }
function Write-Lines([string]$path, [string[]]$text) { [IO.File]::WriteAllLines($path, $text, (New-Object Text.UTF8Encoding $false)) }
function Finish([int]$code) { Read-Host (Say 'Press Enter to close' 'Kapatmak için Enter''a basın') | Out-Null; exit $code }

if (-not $ConfigDir) {
    $ConfigDir = (Get-ItemProperty 'HKLM:\SOFTWARE\EqualizerAPO' -ErrorAction SilentlyContinue).ConfigPath
}
if (-not $ConfigDir -or -not (Test-Path $ConfigDir)) {
    Write-Host (Say 'Equalizer APO is not installed. Install it first (see TUTORIAL.md), restart, then run this again.' `
                    'Equalizer APO kurulu değil. Önce onu kurun (REHBER.md''ye bakın), bilgisayarı yeniden başlatın, sonra bunu tekrar çalıştırın.') -ForegroundColor Red
    Finish 1
}

# Program Files needs admin rights; ask for them only if we can't write there.
$probe = Join-Path $ConfigDir '.write-test'
try { [IO.File]::WriteAllText($probe, ''); Remove-Item $probe } catch {
    $psArgs = "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    if ($PSBoundParameters.ContainsKey('ConfigDir')) { $psArgs += " -ConfigDir `"$ConfigDir`"" }
    try { Start-Process powershell -Verb RunAs -ArgumentList $psArgs } catch {
        Write-Host (Say 'Admin permission is needed to change Equalizer APO settings.' `
                        'Equalizer APO ayarlarını değiştirmek için yönetici izni gerekiyor.') -ForegroundColor Red
        Finish 1
    }
    exit
}

$presets = @(
    @{ File = 'balanced.txt';   EnName = 'Balanced';  TrName = 'Dengeli';         En = 'Balanced (recommended) - no boom, clear voices'; Tr = 'Dengeli (önerilen) - uğultu yok, sesler net' },
    @{ File = 'more-bass.txt';  EnName = 'More bass'; TrName = 'Biraz daha bas';  En = 'More bass - a bit more bass, still clear';       Tr = 'Biraz daha bas - bas biraz daha dolgun, ses yine net' },
    @{ File = 'bass-heavy.txt'; EnName = 'Bass heavy'; TrName = 'Bol bas';        En = 'Bass heavy - boomy, can distort at high volume'; Tr = 'Bol bas - gümbür gümbür, yüksek seste bozulabilir' }
)

Write-Host ''
Write-Host 'Dark SP-213 EQ' -ForegroundColor Cyan
Write-Host ''
for ($i = 0; $i -lt $presets.Count; $i++) {
    Write-Host ("  {0}) {1}" -f ($i + 1), (Say $presets[$i].En $presets[$i].Tr))
}
Write-Host ("  4) {0}" -f (Say 'Remove (back to the original sound)' 'Kaldır (orijinal sese dön)'))
Write-Host ''
$choice = Read-Host (Say 'Choose 1-4 (Enter = 1)' '1-4 arası seçin (Enter = 1)')
if ([string]::IsNullOrWhiteSpace($choice)) { $choice = '1' }

$config = Join-Path $ConfigDir 'config.txt'
$includeLine = 'Include: dark-sp213.txt'
$lines = @()
if (Test-Path $config) { $lines = @(Get-Content $config) }

if ($choice -eq '4') {
    $kept = @($lines | Where-Object { $_ -notmatch '^\s*#?\s*Include:\s*dark-sp213\.txt\s*$' })
    Write-Lines $config $kept
    Write-Host (Say 'Removed. The speakers are back to their original sound.' 'Kaldırıldı. Hoparlörler orijinal sesine döndü.') -ForegroundColor Green
    Finish 0
}

$index = 0
if (-not [int]::TryParse($choice, [ref]$index) -or $index -lt 1 -or $index -gt $presets.Count) {
    Write-Host (Say 'Invalid choice. Nothing was changed.' 'Geçersiz seçim. Hiçbir şey değiştirilmedi.') -ForegroundColor Red
    Finish 1
}
$preset = $presets[$index - 1]

Copy-Item (Join-Path $PSScriptRoot "presets\$($preset.File)") (Join-Path $ConfigDir 'dark-sp213.txt') -Force

# Fresh Equalizer APO installs ship a demo config with its own bass boost, which would stack
# with ours. Keep a backup, then use a clean config. Keep Peace's line if the user has Peace.
$backup = Join-Path $ConfigDir 'config.before-dark-sp213.txt'
if ((Test-Path $config) -and -not (Test-Path $backup)) { Copy-Item $config $backup }
$newConfig = @($lines | Where-Object { $_ -match '^\s*Include:\s*peace\.txt\s*$' }) + $includeLine
Write-Lines $config $newConfig

Write-Host ''
Write-Host (Say "Done: $($preset.EnName). It's on now, no restart needed." `
                "Tamam: $($preset.TrName). Ayar şu an açık, yeniden başlatmaya gerek yok.") -ForegroundColor Green
Write-Host (Say 'Everything is a bit quieter now so nothing distorts; turn the speaker knob up a little.' `
                'Bozulma olmasın diye ses biraz kısıldı; hoparlörün düğmesinden biraz açın.')
Finish 0
