declare option saxon:output "method=text";
declare variable $linefeed := "&#10;";

let $files := collection('../../../xml/?select=*.xml')

let $qPeople := $files//quote/@spokeBy => distinct-values()

let $rPeople := $files//person/@perName => distinct-values()

let $fPeople := ($qPeople, $rPeople)

for $per at $index in distinct-values($fPeople)

order by $per

return (concat("'",$per,"',"))