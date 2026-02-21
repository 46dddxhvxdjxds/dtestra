$files = @('d:\wedding opera\index.html', 'd:\wedding opera\gallery.html', 'd:\wedding opera\booking.html', 'd:\wedding opera\admin.html')
$mapHtml = @"
                <!-- Column 4: Map -->
                <div class=""footer-col"">
                    <h4>Location Map</h4>
                    <div class=""footer-map-container"">
                        <iframe 
                            src=""https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3500.5215758252277!2d77.14441059999999!3d28.6940428!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390d03cdeb3c3167%3A0xc07dbbf83141f9d5!2sWEDDING%20OPERA!5e0!3m2!1sen!2sin!4v1707579178949!5m2!1sen!2sin"" 
                            width=""100%"" 
                            height=""150"" 
                            style=""border:0; border-radius: 8px;"" 
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
