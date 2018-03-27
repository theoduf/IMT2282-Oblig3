Function Using-Culture (
[System.Globalization.CultureInfo]$culture,
[ScriptBlock]$script)
{
    $OldCulture = [System.Threading.Thread]::CurrentThread.CurrentCulture
    trap
    {
    [System.Threading.Thread]::CurrentThread.CurrentCulture = $OldCulture
    }
    [System.Threading.Thread]::CurrentThread.CurrentCulture = $culture
    $ExecutionContext.InvokeCommand.InvokeScript($script)
    [System.Threading.Thread]::CurrentThread.CurrentCulture = $OldCulture
} # End Function

Using-Culture en-us { script }
