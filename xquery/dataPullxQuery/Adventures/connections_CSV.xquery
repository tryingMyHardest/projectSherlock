declare option saxon:output "method=text";
declare variable $tab := "&#9;";
declare variable $linefeed := "&#10;";  (: global variable: now we can call for it without using the escape character :)
declare variable $doubleLine := concat($linefeed,$linefeed);

(: Get a collection of stories :)
let $stories := //story


return('From,To,Quantity',$linefeed,
(: Step through the list of stories :)
for $story at $index in $stories

    (: Get story title :)
    let $storyName := //$story//storyTitle
    
    (: Get count variables for total story quotes/references :)
    let $numQuotes := //$story//quote => count()
    let $numRefs := //$story//person => count()
    
    (: Get a character list for speakers & referenced people :)
    let $personQuotes := //$story//quote/@spokeBy => distinct-values()
    let $perRef := //$story//person/@perName => distinct-values()
    
    (: Combine both character lists into a master list :)
    let $finalList := ($perRef, $personQuotes)
    
    (: Get count variable for total characters in a given story :)
    let $charCount := count(distinct-values($finalList))

    (: Return & format data :)
    (:return ('From',$storyName, $linefeed, 'Total Characters,', $charCount, ',Total Quotes,',$numQuotes,',Total Refs,', $numRefs, $linefeed,:)
        
        (: Step through each person in list :)
        for $person at $pos in distinct-values($finalList)
    
        (: Get specific count variables for quotes/references :)
        let $quoteCount := //$story//quote[@spokeBy=$person] => count()
        let $refCount := //$story//person[@perName=$person] => count()
        
        (: Calculate char length of all quotes :)
        let $quoteLength := sum(//$story//quote[@spokeBy=$person]/string-length(string()))
        
        order by ($quoteCount + $refCount) descending
    
        (: Return & format data :)
        return ($storyName,',',replace($person,'_',' '),',',$quoteCount,$linefeed))