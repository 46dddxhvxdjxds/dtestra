$file = 'd:\wedding opera\gallery.html'
if (Test-Path $file) {
    $content = Get-Content $file -Raw -Encoding UTF8
    $content = $content -replace 'A ROYAL EXPERIENCE', 'MOMENTS CAPTURED'
    $content = $content -replace '(?s)Witness the charm of our expansive venue designed for unforgettable weddings\.', 'Discover timeless celebrations and beautifully curated events held at WEDDING OPERA.'
    [System.IO.File]::WriteAllText($file, $content, (New-Object System.Text.UTF8Encoding($False)))
    Write-Host "Updated $file"
}
