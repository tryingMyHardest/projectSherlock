
<html>
<head>
    <title>Alex Doran</title>
</head>
<body>
<h1>Character References by Chapter</h1>
{
    let $chapters := //book/part/chapter
    let $chars := $chapters//person/@perName => distinct-values()

    for $chapter in $chapters

        let $chapTitle := $chapter/chapterTitle
    
        return <table>
               <tr><th>{$chapTitle}</th></tr>
                {for $char in $chars
                    let $charCount := $chapter//person[@perName=$char]=>count()
       
                    order by $charCount descending
        
                    where $charCount > 0
    
                    return <tr><td>{replace($char, "_", " ")}</td> <td>{$charCount}</td></tr>
                  } </table>
}
</body>
</html>