declare option saxon:output "method=text";
declare variable $tab := "&#9;";
declare variable $linefeed := "&#10;";  (: global variable: now we can call for it without using the escape character :)
declare variable $doubleLine := concat($linefeed,$linefeed);

let $personQuotes := //quote/@spokeBy => distinct-values()
    let $perRef := //person/@perName => distinct-values()
    
    (: Combine both character lists into a master list :)
    let $finalList := ($perRef, $personQuotes)
    
    for $per in distinct-values($finalList)
    
    order by $per
    
    return ($per, $linefeed)