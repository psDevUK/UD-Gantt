Import-Module UniversalDashboard  -Force
Import-Module "C:\UniversalDashboard\UD-Gantt\UniversalDashboard.UDGantt\UniversalDashboard.UDGantt.psd1" -Force

Get-UDDashboard | Stop-UDDashboard

$theme = New-UDTheme -Name 'Basic' -Definition @{
    'main' = @{
        'padding-left'   = '5px'
        'padding-right'  = '5px'
        'padding-top'    = '5px'
        'padding-bottom' = '5px'
    }
} -Parent 'Default'
Start-UDDashboard -Port 10000 -AutoReload -Dashboard (
    New-UDDashboard -Title 'Powershell UniversalDashboard' -Theme $theme -Content {
        New-UDRow -Columns {
            New-UDColumn -Size 12 -Content {
                New-UDHeading -Size 3 -Text "Simple Gantt"
                New-UDGantt -Id "Simple" -Width "85%" -Height "270px" -Data {
                    New-UDGanttData -TaskID "Research" -TaskName "Find Component" -Start (Get-Date) -End (Get-Date).AddDays(5) -PercentComplete 100
                    New-UDGanttData -TaskID "Write" -TaskName "Write Component" -Start (Get-Date).AddDays(5) -End (Get-Date).AddDays(6) -PercentComplete 92 -Dependencies "Research"
                    New-UDGanttData -TaskID "Build" -TaskName "Build Component" -Start (Get-Date).AddDays(6) -End (Get-Date).AddDays(7) -PercentComplete 78 -Dependencies "Write"
                    New-UDGanttData -TaskID "Test" -TaskName "Test Component" -Start (Get-Date).AddDays(7) -End (Get-Date).AddDays(8) -PercentComplete 65 -Dependencies "Build"
                    New-UDGanttData -TaskID "Complete" -TaskName "Submit Component" -Start (Get-Date).AddDays(8) -End (Get-Date).AddDays(9) -PercentComplete 0 -Dependencies "Test,Build"
                }
            }
            <#
            New-UDColumn -Size 12 -Content {
                $today = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).Day)"
                $todayend = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(5).Day)"
                $todayend2 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(6).Day)"
                $todayend3 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(7).Day)"
                $todayend4 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(8).Day)"
                $todayend5 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(9).Day)"
                New-UDHeading -Size 3 -Text "Simple Gantt Critical Path Enabled"
                New-UDGantt -Id "Simple" -Width "85%" -Height "270px" -CriticalPathEnabled $true -CriticalStrokeColor '#e64a19' -GridStrokeWidth 1 -CriticalStrokeWidth 4 -GridStrokeColor "#ccc" -Data {
                    New-UDGanttData -TaskID "Research" -TaskName "Find Component" -Start "Date($($today))" -End "Date($($todayend))" -PercentComplete 100
                    New-UDGanttData -TaskID "Write" -TaskName "Write Component" -Start "Date($($todayend))" -End "Date($($todayend2))"  -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 92 -Dependencies "Research"
                    New-UDGanttData -TaskID "Build" -TaskName "Build Component"  -End "Date($($todayend3))" -Duration (2 * 24 * 60 * 60 * 1000) -PercentComplete 78 -Dependencies "Research"
                    New-UDGanttData -TaskID "Test" -TaskName "Test Component" -Start "Date($($todayend3))" -End "Date($($todayend4))" -Duration (4 * 24 * 60 * 60 * 1000) -PercentComplete 65 -Dependencies "Write,Build"
                    New-UDGanttData -TaskID "Complete" -TaskName "Submit Component" -Start "Date($($todayend4))" -End "Date($($todayend5))" -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 -Dependencies "Test,Build"
                }
            }
            New-UDColumn -Size 12 -Content {
                $today = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).Day)"
                $todayend = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(5).Day)"
                $todayend2 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(6).Day)"
                $todayend3 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(7).Day)"
                $todayend4 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(8).Day)"
                $todayend5 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(9).Day)"
                New-UDHeading -Size 3 -Text "Simple Gantt With Styling Applied"
                New-UDGantt -Id "Simple" -Width "85%" -Height "270px" -CriticalPathEnabled $true -CriticalStrokeColor '#e64a19' -GridStrokeWidth 2 -CriticalStrokeWidth 5 -GridStrokeColor "#000" -InnerGrid '#fff3e0' -InnerGridDark '#ffcc80' -Data {
                    New-UDGanttData -TaskID "Research" -TaskName "Find Component" -Start "Date($($today))" -End "Date($($todayend))" -PercentComplete 100
                    New-UDGanttData -TaskID "Write" -TaskName "Write Component" -Start "Date($($todayend))" -End "Date($($todayend2))"  -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 92 -Dependencies "Research"
                    New-UDGanttData -TaskID "Build" -TaskName "Build Component" -Start "Date($($todayend2))" -End "Date($($todayend3))" -Duration (2 * 24 * 60 * 60 * 1000) -PercentComplete 78 -Dependencies "Write"
                    New-UDGanttData -TaskID "Test" -TaskName "Test Component" -Start "Date($($todayend3))" -End "Date($($todayend4))" -Duration (4 * 24 * 60 * 60 * 1000) -PercentComplete 65 -Dependencies "Build"
                    New-UDGanttData -TaskID "Complete" -TaskName "Submit Component" -Start "Date($($todayend4))" -End "Date($($todayend5))" -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 -Dependencies "Test,Build"
                }
            }
            New-UDColumn -Size 12 -Content {
                $today = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).Day)"
                $todayend = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(5).Day)"
                $todayend2 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(6).Day)"
                $todayend3 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(7).Day)"
                $todayend4 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(8).Day)"
                $todayend5 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(9).Day)"
                New-UDHeading -Size 3 -Text "Simple Gantt With Resource Parameter"
                New-UDGantt -Id "Simple" -CriticalPathEnabled $false -CriticalStrokeColor '#ccc' -GridStrokeWidth 15 -Width "85%" -Height "270px" -Data {
                    New-UDGanttData -TaskID "Research" -TaskName "Find Component" -Start "Date($($today))" -End "Date($($todayend))" -PercentComplete 100
                    New-UDGanttData -TaskID "Write" -TaskName "Write Component" -Resource "research" -Start "Date($($todayend))" -End "Date($($todayend2))"  -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 92 -Dependencies "Research"
                    New-UDGanttData -TaskID "Build" -TaskName "Build Component" -Resource "write" -Start "Date($($todayend2))" -End "Date($($todayend3))" -Duration (2 * 24 * 60 * 60 * 1000) -PercentComplete 78 -Dependencies "Write"
                    New-UDGanttData -TaskID "Test" -TaskName "Test Component" -Resource "build" -Start "Date($($todayend3))" -End "Date($($todayend4))" -Duration (4 * 24 * 60 * 60 * 1000) -PercentComplete 65 -Dependencies "Build"
                    New-UDGanttData -TaskID "Complete" -TaskName "Submit Component" -Resource "test" -Start "Date($($todayend4))" -End "Date($($todayend5))" -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 -Dependencies "Test,Build"
                }


            }
            New-UDColumn -Size 12 -Content {
                $today = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).Day)"
                $todayend = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(5).Day)"
                $todayend2 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(6).Day)"
                $todayend3 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(7).Day)"
                $todayend4 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(8).Day)"
                $todayend5 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(9).Day)"
                New-UDHeading -Size 3 -Text "Simple Gantt Grouping"
                New-UDGantt -Id "Simple" -CriticalPathEnabled $false -CriticalStrokeColor '#ccc' -GridStrokeWidth 15 -Width "85%" -Height "270px" -Data {
                    New-UDGanttData -TaskID "Research" -TaskName "Find Component" -Start "Date($($today))" -End "Date($($todayend))" -PercentComplete 100
                    New-UDGanttData -TaskID "Write" -TaskName "Write Component" -Resource "research" -Start "Date($($todayend))" -End "Date($($todayend2))"  -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 92 -Dependencies "Research"
                    New-UDGanttData -TaskID "Build" -TaskName "Build Component" -Resource "research" -Start "Date($($todayend2))" -End "Date($($todayend3))" -Duration (2 * 24 * 60 * 60 * 1000) -PercentComplete 78 -Dependencies "Write"
                    New-UDGanttData -TaskID "Test" -TaskName "Test Component" -Resource "research" -Start "Date($($todayend3))" -End "Date($($todayend4))" -Duration (4 * 24 * 60 * 60 * 1000) -PercentComplete 65 -Dependencies "Build"
                    New-UDGanttData -TaskID "Complete" -TaskName "Submit Component" -Resource "test" -Start "Date($($todayend4))" -End "Date($($todayend5))" -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 -Dependencies "Test,Build"
                }


            }
            New-UDColumn -Size 12 -Content {
                $today = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).Day)"
                $todayend = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(5).Day)"
                $todayend2 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(6).Day)"
                $todayend3 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(7).Day)"
                $todayend4 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(8).Day)"
                $todayend5 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(9).Day)"
                New-UDHeading -Size 3 -Text "Simple Gantt With Resource Parameter"
                New-UDGantt -Id "Simple" -Width "85%" -Height "270px" -CriticalPathEnabled $true -CriticalStrokeColor '#e64a19' -GridStrokeWidth 2 -CriticalStrokeWidth 4 -GridStrokeColor "#000" -InnerGrid '#9e788f' -InnerGridDark '#474954' -Data {
                    New-UDGanttData -TaskID "Research" -TaskName "Find Component" -Start "Date($($today))" -End "Date($($todayend))" -PercentComplete 100
                    New-UDGanttData -TaskID "Write" -TaskName "Write Component" -Resource "research" -Start "Date($($todayend))" -End "Date($($todayend2))"  -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 92 -Dependencies "Research"
                    New-UDGanttData -TaskID "Build" -TaskName "Build Component" -Resource "write" -Start "Date($($todayend2))" -End "Date($($todayend3))" -Duration (2 * 24 * 60 * 60 * 1000) -PercentComplete 78 -Dependencies "Write"
                    New-UDGanttData -TaskID "Test" -TaskName "Test Component" -Resource "build" -Start "Date($($todayend3))" -End "Date($($todayend4))" -Duration (4 * 24 * 60 * 60 * 1000) -PercentComplete 65 -Dependencies "Build"
                    New-UDGanttData -TaskID "Complete" -TaskName "Submit Component" -Resource "write" -Start "Date($($todayend4))" -End "Date($($todayend5))" -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0 -Dependencies "Test,Build"
                }


            }
            New-UDColumn -Size 12 -Content {
                $today = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).Day)"
                $todayend = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(5).Day)"
                $todayend2 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(6).Day)"
                $todayend3 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(7).Day)"
                $todayend4 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(8).Day)"
                $todayend5 = "$((Get-Date).Year),$((Get-Date).Month -1),$((Get-Date).AddDays(9).Day)"
                New-UDHeading -Size 3 -Text "Simple Gantt With No Dependencies"
                New-UDGantt -Id "Simple" -CriticalPathEnabled $false -CriticalStrokeColor '#ccc' -GridStrokeWidth 15 -Width "85%" -Height "270px" -Data {
                    New-UDGanttData -TaskID "Research" -TaskName "Find Component" -Start "Date($($today))" -End "Date($($todayend))" -PercentComplete 100
                    New-UDGanttData -TaskID "Write" -TaskName "Write Component" -Resource "research" -Start "Date($($todayend))" -End "Date($($todayend2))"  -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 92
                    New-UDGanttData -TaskID "Build" -TaskName "Build Component" -Resource "write" -Start "Date($($todayend2))" -End "Date($($todayend3))" -Duration (2 * 24 * 60 * 60 * 1000) -PercentComplete 78
                    New-UDGanttData -TaskID "Test" -TaskName "Test Component" -Resource "build" -Start "Date($($todayend3))" -End "Date($($todayend4))" -Duration (4 * 24 * 60 * 60 * 1000) -PercentComplete 65
                    New-UDGanttData -TaskID "Complete" -TaskName "Submit Component" -Resource "test" -Start "Date($($todayend4))" -End "Date($($todayend5))" -Duration (1 * 24 * 60 * 60 * 1000) -PercentComplete 0
                }


            }
            New-UDColumn -Size 12 -Content {
                New-UDHeading -Size 3 -Text "Computed Start End From Duration Gantt"
                New-UDGantt -Id "Simple" -Width "85%" -Height "270px" -Data {
                    New-UDGanttData -TaskID "Research" -TaskName "Find Component" -Resource "Brain" -Duration (70 * 60 * 1000) -PercentComplete 100
                    New-UDGanttData -TaskID "Write" -TaskName "Write Component" -Resource "write"  -Duration (10 * 60 * 1000) -PercentComplete 100
                    New-UDGanttData -TaskID "Build" -TaskName "Build Component" -Resource "build" -Duration (20 * 60 * 1000) -PercentComplete 100 -Dependencies "Write"
                    New-UDGanttData -TaskID "Test" -TaskName "Test Component" -Resource "testing" -Duration (35 * 60 * 1000) -PercentComplete 50 -Dependencies "Build"
                    New-UDGanttData -TaskID "Complete" -TaskName "Submit Component" -Resource "publish" -Duration (5 * 60 * 1000) -PercentComplete 0 -Dependencies "Test"
                }
            }
            #>
        }
    }
)