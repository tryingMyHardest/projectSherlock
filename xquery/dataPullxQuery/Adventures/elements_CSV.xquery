declare option saxon:output "method=text";
declare variable $tab := "&#9;";
declare variable $linefeed := "&#10;";  (: global variable: now we can call for it without using the escape character :)
declare variable $doubleLine := concat($linefeed,$linefeed);

(: Get a collection of stories :)
let $stories := //story//storyTitle

return('Label,Type',$linefeed,

for $story in $stories

return($story,',Story',$linefeed),

let $qPeople := //quote/@spokeBy => distinct-values()
let $rPeople := //person/@perName => distinct-values()
let $fPeople := ($qPeople, $rPeople) => distinct-values()

for $per at $index in $fPeople

return (replace($per,"_"," "),',Character',$linefeed))
 