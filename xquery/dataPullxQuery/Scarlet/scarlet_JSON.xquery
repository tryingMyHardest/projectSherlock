declare option saxon:output "method=text";
declare variable $linefeed := "&#10;&#10;";

(: Get a collection of stories :)
let $chapters := //chapter

return('{',$linefeed,'"elements": [',$linefeed,

    for $chapter in $chapters
    
    let $title := $chapter//chapterTitle
    
    let $numQuotes := $chapter//quote => count()
    let $numRefs := $chapter//person => count()
    let $size := sum($numRefs, $numQuotes)

    return('{',$linefeed,'"label": ','"',$title,'",',$linefeed,
    '"type": "chapter",',$linefeed,
    '"size": ',$size,$linefeed,'},',$linefeed),

        let $qPeople := //quote/@spokeBy => distinct-values()
        let $rPeople := //person/@perName => distinct-values()
        let $fPeople := ($qPeople, $rPeople) => distinct-values()

        for $per at $index in $fPeople
        
            let $perQuotes := //quote[@spokeBy=$per] => count()
            let $perRef := //person[@perName=$per] => count()
            let $perSize := sum($perQuotes,$perRef)

        return ('{',$linefeed,'"label": ','"',replace($per,"_"," "),'",',$linefeed,
        '"type": "character",',$linefeed,
        '"size": ',$perSize,$linefeed,
        if($index eq count($fPeople))
                then('}')
                else('},')
        ,$linefeed)),$linefeed,'],',$linefeed,

let $chapters := //chapter

return($linefeed,'"connections": [',$linefeed,
(: Step through the list of stories :)


    let $numQuotes := //quote => count()
    let $numRefs := //person => count()
    
for $chapter at $chapterIndex in $chapters

    (: Get story title :)
    let $title := $chapter//chapterTitle
        
    (: Get a character list for speakers & referenced people :)
    let $personQuotes := $chapter//quote/@spokeBy => distinct-values()
    let $perRef := $chapter//person/@perName => distinct-values()
    
    (: Combine both character lists into a master list :)
    let $finalList := ($perRef, $personQuotes)
    
    (: Get count variable for total characters in a given story :)
    let $charCount := count(distinct-values($finalList))
        
        (: Step through each person in list :)
        for $person at $perIndex in distinct-values($finalList)
    
        (: Get specific count variables for quotes/references :)
        let $quoteCount := $chapter//quote[@spokeBy=$person] => count()
        let $refCount := $chapter//person[@perName=$person] => count()
        
        (: Calculate char length of all quotes :)
        let $quoteLength := sum($chapter//quote[@spokeBy=$person]/string-length(string()))
    
        (: Return & format data :)
        return (
        
        if(($chapterIndex*$perIndex) eq 1)
        then
        (
            if($quoteCount eq 0)
            then()
            else
            (
                '{',$linefeed,'"from": ','"',$title,'",',$linefeed,
                '"to": ','"',replace($person,'_',' '),'",',$linefeed,
                '"type": "quote",',$linefeed,
                '"direction": "undirected",',$linefeed,
                '"size":',$quoteCount,$linefeed,'},',$linefeed
            ),
            if($refCount eq 0)
            then()
            else
                (
                '{',$linefeed,'"from": ','"',$title,'",',$linefeed,
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
                ',',$linefeed,'{',$linefeed,'"from": ','"',$title,'",',$linefeed,
                '"to": ','"',replace($person,'_',' '),'",',$linefeed,
                '"type": "quote",',$linefeed,
                '"direction": "undirected",',$linefeed,
                '"size":',$quoteCount,$linefeed,'}'
            ),
            if($refCount eq 0)
            then()
            else
            (
                ',',$linefeed,'{',$linefeed,'"from": ','"',$title,'",',$linefeed,
                '"to": ','"',replace($person,'_',' '),'",',$linefeed,
                '"type": "reference",',$linefeed,
                '"direction": "undirected",',$linefeed,
                '"size":',$refCount,$linefeed,'}'
            )
        ),
            $linefeed),']',$linefeed,'}'
        
        )
        
        
        