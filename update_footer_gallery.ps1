$files = @("d:\wedding opera\index.html", "d:\wedding opera\gallery.html", "d:\wedding opera\booking.html", "d:\wedding opera\admin.html")
$oldFooter = 'विलासिता, परंपरा और Extraordinary सेवा के साथ Unforgettable यादें बनाना।'
$newFooter = 'Blending luxury, tradition, and exceptional service to craft truly unforgettable memories.'

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw -Encoding UTF8
        $content = $content.Replace($oldFooter, $newFooter)
        if ($f -match "gallery.html") {
            $content = $content -replace "OUR VISUAL STORY", "A ROYAL EXPERIENCE"
            $content = $content -replace "(?s)हमारे Campus का Virtual Tour.*?WEDDING OPERA</span>\.", "Witness the charm of our expansive venue designed for unforgettable weddings."
        }
        [System.IO.File]::WriteAllText($f, $content, (New-Object System.Text.UTF8Encoding($False)))
        Write-Host "Updated $f"
    }
}
