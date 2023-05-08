declare option saxon:output "method=text";
declare variable $linefeed := "&#10;";

(: This xQuery provides a character list with count for either Sherlock xml doc :)
(: Just change to the correct XML doc :)
let $qPeople := //quote/@spokeBy => distinct-values()
let $rPeople := //person/@perName => distinct-values()
let $fPeople := ($qPeople, $rPeople) => distinct-values()

for $per at $index in $fPeople

return ($index,$per,$linefeed)