<html>
<head><title>Kate</title></head>
<body>
<h1> Sherlock Holmes- Scarlet</h1>


<h2>Chapters</h2>


<table>
{let $chapters :=//book//chapter
for $chapter in $chapters 
let $chapterNum :=$chapter/data(@num)
let $chapterTitle :=//$chapter/chapterTitle/text()
let $heading := concat ($chapterNum, ": ", $chapterTitle)


return ( <tr><td>{$chapterNum}</td><td>{$chapterTitle}</td></tr>)}
</table>

<h2>Characters in each chapter</h2>

<table>
{let $chapters := //book//chapter
for $chapter in $chapters
let $chars := $chapter/p/person
let $charCount := $chars=>count()

return( <tr><td>{$chars}</td><td>{$charCount}</td></tr>)}
</table>


</body>
</html>
