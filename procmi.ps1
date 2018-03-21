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

$now=$(Get-Date -UFormat "%Y%m%d-%H%M%S")


foreach($i in $args){
  
  $process=$(Get-Process | Where-Object{$_.Id -eq $i})
  $vm=$($process.vm | .\human-readable-bytes.ps1)
  $ws=$($process.ws | .\human-readable-bytes.ps1)
  New-Item ".\$i--$now.meminfo" -ItemType file -Force -Value "******** Minne info om prosess med PID $i ******** `n Total bruk av virtuelt minne: $vm `n St`ørrelse p`å Working Set: $ws"

}