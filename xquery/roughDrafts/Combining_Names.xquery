declare option saxon:output "method=text";
declare variable $linefeed := "&#10;";
declare variable $tab := "&#9;"; 

let $personQuotes := //quote/@spokeBy => distinct-values()
let $perRef := //person/@perName => distinct-values()

let $finalList := ($perRef, $personQuotes)


for $per in distinct-values($finalList)

order by $per

return ($per,$linefeed)