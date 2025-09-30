param (
    [string]$ImageUrl1,
    [string]$ImageUrl2,
    [string]$ImageUrl3,
    [string]$VoiceText1,
    [string]$VoiceText2,
    [string]$VoiceText3
)

Write-Host "ImageUrl1: $ImageUrl1"
Write-Host "ImageUrl2: $ImageUrl2"
Write-Host "ImageUrl3: $ImageUrl3"
Write-Host "VoiceText1: $VoiceText1"
Write-Host "VoiceText2: $VoiceText2"
Write-Host "VoiceText3: $VoiceText3"

$headers = @{
    Authorization = "Bearer fc0b8a46fa1b4e98aea39f480aeee9c3db30eebd24db80ed6e3044a8f589821d4637bcafd857fa71ac43b06e6218cec3"
    "Content-Type" = "application/json"
}

$bodyObj = @{
    template_id = "840b786c-df73-4854-ad79-1f06ced1f2b1"
    modifications = @{
        "Image-1.source"     = $ImageUrl1
        "Voiceover-1.text"   = $VoiceText1
        "Image-2.source"     = $ImageUrl2
        "Voiceover-2.text"   = $VoiceText2
        "Image-3.source"     = $ImageUrl3
        "Voiceover-3.text"   = $VoiceText3
    }
}

$body = $bodyObj | ConvertTo-Json -Depth 5  # ❗先不要加 -Compress

Write-Host "`n===== 请求 JSON ====="
Write-Host $body
Write-Host "=====================`n"

Invoke-RestMethod -Uri "https://api.creatomate.com/v1/renders" -Method POST -Headers $headers -Body $body
