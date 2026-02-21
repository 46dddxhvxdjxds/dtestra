$files = @('d:\wedding opera\index.html', 'd:\wedding opera\gallery.html', 'd:\wedding opera\booking.html', 'd:\wedding opera\admin.html')
foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw
        $pattern = '(?s)<div class="nav-pill">(.*?)</div>'
        $replacement = '<div class="nav-pill" id="mobileNavPill">
                <div class="mobile-bottom-brand">
                    <a href="index.html">WEDDING OPERA</a>
                    <button class="hamburger-btn" onclick="toggleMobileMenu()">
                        <span></span><span></span><span></span>
                    </button>
                </div>
                <div class="nav-links">$1</div>
            </div>'
        $newContent = [regex]::Replace($content, $pattern, $replacement)
        [System.IO.File]::WriteAllText($f, $newContent, (New-Object System.Text.UTF8Encoding($False)))
        Write-Host "Updated $f"
    }
}
