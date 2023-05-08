declare option saxon:output "method=text";  (:will create a text output stripping out XML element tags etc. :)
declare variable $linefeed := "&#10;"; 
declare variable $tab := "&#9;"; 

let $stories := //story
for $story in $stories
    let $title := $story/storyTitle
    let $p := $story//p
    let $p-count := $p=>count()
    return ($title, $tab, $p-count, $linefeed)
