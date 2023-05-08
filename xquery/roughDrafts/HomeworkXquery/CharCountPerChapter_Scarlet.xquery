declare option saxon:output "method=text"; (:will create a text output stripping out XML element tags etc. :)
declare variable $linefeed := "&#10;";  (: global variable: now we can call for it without using the escape character :)
declare variable $tab := "&#9;";     (: note global variables come at top of doc and line ends with semicolon :)
declare variable $doubleLine := concat($linefeed,$linefeed);

(:DAR Created chapters variable and then started for loop to loop to loop through each individual chapter:)
let $chapters := //book/part/chapter
let $chars := $chapters//person/@perName => distinct-values()

for $chapter in $chapters
    (:Initialized chapTitle, chars, char count variables:)
    let $chapTitle := $chapter/chapterTitle
    
    return ($chapTitle, $linefeed,
    
    for $char in $chars
        let $charCount := $chapter//person[@perName=$char]=>count()
        (:Ordering the output by character count:)
        order by $charCount descending
        
        where $charCount > 0
    
        return (replace($char, "_", " "), $charCount, $linefeed)
        
        ,$doubleLine)