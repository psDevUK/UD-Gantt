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
            Start           = $Start
            End             = $End
            Duration        = $Duration
            PercentComplete = $PercentComplete
            Dependencies    = $Dependencies
        }
    }
}