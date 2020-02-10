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
        [object]$Start,
        [Parameter()]
        [AllowNull()]
        [object]$End,
        [Parameter()]
        [int]$Duration,
        [Parameter(Mandatory = $true)]
        [int]$PercentComplete,
        [Parameter()]
        [AllowNull()]
        [string[]]$Dependencies
    )
    End {
        [PSCustomObject]@{
            TaskID          = $TaskID
            TaskName        = $TaskName
            Resource        = $Resource

            Start   = "Date($($Start.Year), $($Start.Month - 1), $($Start.Day), $($Start.Hour), $($Start.Minute), $($Start.Second), $($Start.Millisecond))"
            End   = "Date($($End.Year), $($End.Month - 1), $($End.Day), $($End.Hour), $($End.Minute), $($End.Second), $($End.Millisecond))"
            
            Duration        = $Duration
            PercentComplete = $PercentComplete
            Dependencies    = $Dependencies
        }
    }
}