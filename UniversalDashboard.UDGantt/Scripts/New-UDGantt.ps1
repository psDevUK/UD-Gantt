<#
.SYNOPSIS
    Sample control for UniversalDashboard.
.DESCRIPTION
    Sample control function for UniversalDashboard. This function must have an ID and return a hash table.
.PARAMETER Id
    An id for the component default value will be generated by new-guid.
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
function New-UDGantt {
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter()]
        [scriptblock]$Data,
        [Parameter()]
        [string]$Width,
        [Parameter()]
        [string]$Height,
        [Parameter()]
        [bool]$CriticalPathEnabled, # = $false,
        [Parameter()]
        [string]$CriticalStrokeColor, # = '#e64a19',
        [Parameter()]
        [int]$CriticalStrokeWidth, # = 5,
        [Parameter()]
        [string]$GridStrokeColor, # = '#ffe0b2',
        [Parameter()]
        [int]$GridStrokeWidth, # = 2,
        [Parameter()]
        [string]$InnerGrid, # = '#fff3e0',
        [Parameter()]
        [string]$InnerGridDark # = '#ffcc80'
    )

    End {
        [System.Collections.ArrayList]$MainData = @()
        foreach ($Item in [array]$Data.Invoke()) {
            [System.Collections.ArrayList]$ItemData = @(
                $Item.TaskID
                $Item.TaskName
                $Item.Resource
                #https://developers.google.com/chart/interactive/docs/datesandtimes#dates-and-times-using-the-date-string-representation
                #Important: When using this Date String Representation, as when using the new Date() constructor, months are indexed starting at zero (January is month 0, December is month 11).
                $Item.Start
                $Item.End
                $Item.Duration
                $Item.PercentComplete
                $Item.Dependencies
            )
            $MainData.Add($ItemData) | Out-Null
        }
        @{
            # The AssetID of the main JS File
            assetId             = $AssetId
            # Tell UD this is a plugin
            isPlugin            = $true
            # This ID must be the same as the one used in the JavaScript to register the control with UD
            type                = "UD-Gantt"
            # An ID is mandatory
            id                  = $Id
            # This is where you can put any other properties. They are passed to the React control's props
            # The keys are case-sensitive in JS.
            rows                = $MainData
            width               = $Width
            height              = $Height
            criticalPathEnabled = $CriticalPathEnabled
            criticalStroke      = $CriticalStrokeColor
            criticalStrokeWidth = $CriticalStrokeWidth
            gridStroke          = $GridStrokeColor
            innerGrid           = $InnerGrid
            innerGridDark       = $InnerGridDark
            gridStrokeWidth     = $GridStrokeWidth
        }

    }
}