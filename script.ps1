$Begin = Get-Date -Date '12:00:00'
$End = Get-Date -Date '23:59:59'

$filter = @{
  LogName='Security'
  StartTime=$Begin 
  EndTime=$End
  ID=4624
}

$properties = @(
@{n='User';e={$_.Properties[5].Value}},
@{n='TimeStamp';e={$_.TimeCreated}}
)

Get-WinEvent -FilterHashtable $filter | Select-Object $properties

# Можно добавить вывод в графическом виде - |Out-GridView