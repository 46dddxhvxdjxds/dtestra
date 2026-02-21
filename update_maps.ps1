$files = @('d:\wedding opera\admin.html', 'd:\wedding opera\booking.html', 'd:\wedding opera\gallery.html')
$mapHtml = @"
                <!-- Column 4: Map -->
                <div class=""footer-col"" style=""min-width: 300px;"">
                    <h4>Location Map</h4>
                    <div class=""footer-map-container"" style=""border-radius: 8px; overflow: hidden; box-shadow: 0 4px 10px rgba(0,0,0,0.1);"">
                        <iframe 
                            src=""https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1544.1566371764373!2d77.14728514930821!3d28.694675971485645!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390d03cdeb3c3167%3A0xc07dbbf83141f9d5!2sWedding%20Opera!5e0!3m2!1sen!2sin!4v1700000000000!5m2!1sen!2sin"" 
                            width=""100%"" 
                            height=""180"" 
                            style=""border:0;"" 
                            allowfullscreen="""" 
                            loading=""lazy"" 
                            referrerpolicy=""no-referrer-when-downgrade"">
                        </iframe>
                    </div>
                </div>
            </div>
""@

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = Get-Content $f -Raw
        $pattern = '(?s)weddingopera@gmail\.com</p>\s*</div>\s*</div>'
        $replacement = "weddingopera@gmail.com</p>
                </div>
$mapHtml"
        $newContent = [regex]::Replace($content, $pattern, $replacement)
        [System.IO.File]::WriteAllText($f, $newContent, (New-Object System.Text.UTF8Encoding($False)))
        Write-Host "Updated $f"
    }
}
