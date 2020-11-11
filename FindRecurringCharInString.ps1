function Find-Recurrence {
    <#
        .SYNOPSIS
        Checks the input string of characters for the first character recurrence.

        .DESCRIPTION
        Checks the input string of characters for the first character recurrence.
        Will throw an error if the input string is null or empty.

        .PARAMETER inputString
        String of charcters passed to the function

        .INPUTS
        system.string, input string can be null or empty

        .OUTPUTS
        Char, Returns the first recurring character or null if none found 

        .EXAMPLE
        C:\PS> Find-Recurrence -inputString "abcdfernsdadgdhgryjry"
        d

        .EXAMPLE
        C:\PS> Find-Recurrence ";oiuhbv123"

        .EXAMPLE
        C:\PS> Find-Recurrence "1djkfk+_)(`1ljlajsdklfh"
        k

    #>

    [CmdletBinding()]param (
        [Parameter(Position=0,mandatory=$true, ValuefromPipeline=$true)]
        [AllowNull()]
        [AllowEmptyString()]
        [string] $inputString
    )
    BEGIN
    {
        $AsciiValueRec =  [int[]]::new(256)
    }

    PROCESS
    {
        if([string]::IsNullOrEmpty($inputString))
        {
            Write-Error "Input string can not be null or empty.Try again!" -ErrorAction Stop
        }
        $IteratableString = $inputString.ToCharArray()
        foreach($chr in $IteratableString)
        {
            $AsciiIndex = [byte][char]$chr
            if ($AsciiValueRec[$AsciiIndex] -ge 1)
            {
                return [char]$AsciiIndex
            }
            else
            {
                $AsciiValueRec[$AsciiIndex] += 1
            }
        }
        return $null
    }       
    END {}

}
