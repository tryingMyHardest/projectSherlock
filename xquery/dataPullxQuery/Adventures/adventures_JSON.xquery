declare option saxon:output "method=text";
declare variable $linefeed := "&#10;&#10;";

(: Get a collection of stories :)
let $stories := //story

return('{',$linefeed,'"elements": [',$linefeed,

    for $story in $stories
    
    let $title := $story//storyTitle
    
    let $numQuotes := $story//quote => count()
    let $numRefs := $story//person => count()
    let $size := ($numQuotes,$numRefs)

    return('{',$linefeed,'"label": ','"',$title,'",',$linefeed,
    '"type": "story",',$linefeed,
    '"size": ',sum($size),$linefeed,'},',$linefeed),

        let $qPeople := //quote/@spokeBy => distinct-values()
        let $rPeople := //person/@perName => distinct-values()
        let $fPeople := ($qPeople, $rPeople) => distinct-values()

        for $per at $index in $fPeople
        
            let $perQuotes := //quote[@spokeBy=$per] => count()
            let $perRef := //person[@perName=$per] => count()
            let $perSize := ($perQuotes,$perRef)

        return ('{',$linefeed,'"label": ','"',replace($per,"_"," "),'",',$linefeed,
        '"type": "character",',$linefeed,
        '"size": ',sum($perSize),$linefeed,
        if($index eq count($fPeople))
                then('}')
                else('},')
        ,$linefeed)),$linefeed,'],',$linefeed,

let $stories := //story

return($linefeed,'"connections": [',$linefeed,
(: Step through the list of stories :)

    let $numQuotes := //quote => count()
    let $numRefs := //person => count()
    
for $story at $storyIndex in $stories

    (: Get story title :)
    let $storyName := $story//storyTitle
    
    
    (: Get a character list for speakers & referenced people :)
    let $personQuotes := $story//quote/@spokeBy => distinct-values()
    let $perRef := $story//person/@perName => distinct-values()
    
    (: Combine both character lists into a master list :)
    let $finalList := ($perRef, $personQuotes)
    
    (: Get count variable for total characters in a given story :)
    let $charCount := count(distinct-values($finalList))
        
        (: Step through each person in list :)
        for $person at $perIndex in distinct-values($finalList)
    
        (: Get specific count variables for quotes/references :)
        let $quoteCount := //$story//quote[@spokeBy=$person] => count()
        let $refCount := //$story//person[@perName=$person] => count()
        
        (: Calculate char length of all quotes :)
        let $quoteLength := sum(//$story//quote[@spokeBy=$person]/string-length(string()))
    
        (: Return & format data :)
        return (
        
        if(($storyIndex*$perIndex) eq 1)
        then
        (
            if($quoteCount eq 0)
            then()
            else
            (
                '{',$linefeed,'"from": ','"',$storyName,'",',$linefeed,
                '"to": ','"',replace($person,'_',' '),'",',$linefeed,
                '"type": "quote",',$linefeed,
                '"direction": "undirected",',$linefeed,
                '"size":',$quoteCount,$linefeed,'},',$linefeed
            ),
            if($refCount eq 0)
            then()
            else
                (
                '{',$linefeed,'"from": ','"',$storyName,'",',$linefeed,
                '"to": ','"',replace($person,'_',' '),'",',$linefeed,
                '"type": "reference",',$linefeed,
                '"direction": "undirected",',$linefeed,
                '"size":',$refCount,$linefeed,'}'
            )
        )
        else
        (
            if($quoteCount eq 0)
            then()
            else
            (
                ',',$linefeed,'{',$linefeed,'"from": ','"',$storyName,'",',$linefeed,
                '"to": ','"',replace($person,'_',' '),'",',$linefeed,
                '"type": "quote",',$linefeed,
                '"direction": "undirected",',$linefeed,
                '"size":',$quoteCount,$linefeed,'}'
            ),
            if($refCount eq 0)
            then()
            else
            (
                ',',$linefeed,'{',$linefeed,'"from": ','"',$storyName,'",',$linefeed,
                '"to": ','"',replace($person,'_',' '),'",',$linefeed,
                '"type": "reference",',$linefeed,
                '"direction": "undirected",',$linefeed,
                '"size":',$refCount,$linefeed,'}'
            )
        ),
            $linefeed),']',$linefeed,'}')
        
        
        