function New-UDGanttData {
    param(
        [Parameter(Mandatory = $true)]
        [string]$TaskID,
        [Parameter(Mandatory = $true)]
        [string]$TaskName,
        [Parameter()]
        [string]$Resource,
        [Parameter()]
        [AllowNull()]
        [DateTime]$Start,
        [Parameter()]
        [AllowNull()]
        [DateTime]$End,
        [Parameter()]
        [int]$Duration,
        [Parameter(Mandatory = $true)]
        [int]$PercentComplete,
        [Parameter()]
        [AllowNull()]
        [string[]]$Dependencies
    )
    End {
        $Data = [PSCustomObject]@{
            TaskID          = $TaskID
            TaskName        = $TaskName
            Resource        = $Resource

            Start = $null
            End = $null

            Duration        = $Duration
            PercentComplete = $PercentComplete
            Dependencies    = $Dependencies
        }

        if ($PSBoundParameters.ContainsKey('Start')) { $Data.Start = "Date($($Start.Year), $($Start.Month - 1), $($Start.Day), $($Start.Hour), $($Start.Minute), $($Start.Second), $($Start.Millisecond))" }
        if ($PSBoundParameters.ContainsKey('End')) { $Data.End = "Date($($End.Year), $($End.Month - 1), $($End.Day), $($End.Hour), $($End.Minute), $($End.Second), $($End.Millisecond))"}
        
        $Data
    }
}