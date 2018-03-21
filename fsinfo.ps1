#* Copyright (c) 2018 Theodor Hoff <theodorhoff@hotmail.com>
#*
#* Permission to use, copy, modify, and/or distribute this software for any
#* purpose with or without fee is hereby granted, provided that the above
#* copyright notice and this permission notice appear in all copies.
#*
#* THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
#* WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#* MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
#* ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#* WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
#* ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
#* OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

$folder=Get-item $args[0]
 
[string]$root=$($folder.Root)

$root = $root.Replace("\","")

$diskObject=$(gwmi win32_logicaldisk | Where-Object {$_.DeviceID -eq "$root"})

[long]$freeSpace=$($diskObject | Format-Table FreeSpace -HideTableHeaders | Out-String)
[long]$totalSpace=$($diskObject | Format-Table Size -HideTableHeaders | Out-String)

$used= 100-(($freeSpace/$totalSpace)*100)

$files=$(Get-ChildItem $folder -Recurse | Where-Object { ! $_.PSIsContainer } | sort -Descending length)
$nr=$($files.count)
$largest=$($files | Select-Object -First 1 | %{$_.FullName} | Out-String)
$largestSize=$($files | Select-Object -first 1 | %{$_.Length} | Out-String | .\human-readable-bytes.ps1 )
$average=$($files | Measure-Object -Average Length | Format-Table Average -HideTableHeaders | Out-String | %{$_.Replace(',',".")} | .\human-readable-bytes.ps1)

Write-Output "Partisjonen $folder befinner seg på er $($used)% full."
Write-Output  "Det finnes $nr filer."
Write-Output "Den største er $largest som er $largestSize stor."
Write-Output "Gjennomsnittlig filstørrelse er $average"