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

[long]$ns = "$input" #reads from stdin to $ns

# 1000 ns = 1 us
# 1000 us = 1 ms = 1000*1000 ns
# 1000 ms = 1 s = 1000*1000*1000 ns


if ( $ns -lt 1000 ){  # ns < 1000 comes out in ns
	Write-Output "$nsns"
	}
elseif ( $ns -lt 1000000 ){   # ns < (1000*1000) comes out in us
	Write-Output "$(($ns/1000))us"
	}
elseif ( $ns -lt 1000000000 ){  # ns < (1000*1000*1000) comes out in ms
	Write-Output "$(($ns/(1000*1000)))ms"
	}
elseif ( $ns -lt  1000000000000 ){ # ns < (1000*1000*1000*1000) comes out in s
	Write-Output "$(($ns/(1000*1000*1000)))s"
	}