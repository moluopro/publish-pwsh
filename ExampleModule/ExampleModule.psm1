Set-Alias print Write-Host

function test {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromRemainingArguments=$true)]
        [string[]]$args
    )
    
    process {
        $length = $args.Length

        for ($i = 0; $i -lt $length; $i++) {
            Write-Output "Argument $i  $($args[$i])"
        }
    }
}