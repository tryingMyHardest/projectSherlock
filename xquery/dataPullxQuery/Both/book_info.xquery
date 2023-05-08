declare option saxon:output "method=text";
declare variable $linefeed := "&#10;";

(: Get both .xml files :)
let $files := collection('../../../xml/?select=*.xml')

(: Collect the main book from the .xml files :)
let $adventures := $files//collection
let $scarlet := $files//book

(: Calculate the total character length of each book :)
let $advLength := sum($adventures//story/string-length(string()))
let $scarletLength := sum($scarlet//part/string-length(string()))

(: Count the total # of quotes in each book :)
let $advQuoteCount := $adventures//quote => count()
let $scarletQuoteCount := $scarlet//quote => count()

(: Count the total # of char references in each book :)
let $advRefCount := $adventures//person => count()
let $scarletRefCount := $scarlet//person => count()

(: Collect & create a final character list for each book. Then count the # of characters in each book :)
let $advQuotePeople := $adventures//quote/@spokeBy => distinct-values()
let $advRefPeople := $adventures//person/@perName => distinct-values()
let $advFinalPeople := ($advQuotePeople, $advRefPeople) => distinct-values()
let $advPerCount := count($advFinalPeople) - 1 (: Subtract 1 to account for the 'Unknown' char markups :)

let $scarletQuotePeople := $scarlet//quote/@spokeBy => distinct-values()
let $scarletRefPeople := $scarlet//person/@perName => distinct-values()
let $scarletFinalPeople := ($scarletQuotePeople, $scarletRefPeople) => distinct-values()
let $scarletPerCount := count($scarletFinalPeople) - 1 (: Subtract 1 to account for the 'Unknown' char markups :)

(: Display & format data :)
return ($adventures//title,$linefeed,'Total length = ',$advLength,$linefeed,'# of Characters = ',$advPerCount,$linefeed,'# of Quotes = ',$advQuoteCount,$linefeed,
'# of References = ',$advRefCount,$linefeed,$linefeed,
$scarlet//header//title,$linefeed,'Total length = ',$scarletLength, $linefeed,'# of Characters = ',$scarletPerCount,$linefeed,'# of Quotes = ',$scarletQuoteCount,$linefeed,
'# of References = ',$scarletRefCount)

