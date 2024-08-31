function New-Budget {
    [CmdletBinding(SupportsShouldProcess)]
    param
    (
        [Parameter(Position = 0, Mandatory = $true)]
        [Int]$initial_budget,

        [Parameter(Position = 1, Mandatory = $true)]
        [Int]$days,

        [Parameter(Position = 2, Mandatory = $true)]
        [Int]$initial_spent
    )
    if (!$PSCmdlet.ShouldProcess("blah"))
    {
        return
    }
    $data_string =
@"
    Starting,Days,DailyAllotment,Date,CanSpend,Spent,TotalSpent
    $initial_budget,$days,=a2/b2,"=TEXT(TODAY(),""mm/dd/yyyy"")",=c2,$initial_spent,=SUM(f2:f10)
"@
    $i = 1
    while ($i -lt $days) {
        $data_string = $data_string +
@"
        `n,,,"=TEXT(TODAY()+$i,""mm/dd/yyyy"")",=c2+(e$($i+1)-f$($i+1)),0,
"@
        $i = $i + 1
    }
    Write-Host $data_string
    $data = ConvertFrom-Csv $data_string
    $data | Export-Excel -Path './e.xlsx'
}
