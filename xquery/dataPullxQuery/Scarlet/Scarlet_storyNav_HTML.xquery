declare option saxon:output "method=html";
declare variable $linefeed := "&#10;";
declare variable $people := ('Brigham_Young', 'Cowper', 'Enoch_J_Drebber', 'Ferrier', 'Jefferson_Hope', 'John_Ferrier', 'John_Rance', 'John_Watson', 'Joseph_Smith', 'Joseph_Stangerson', 'Lestrade', 'Lucy_Ferrier', 'Mrs_Sawyer', 'Sherlock_Holmes', 'Stamford', 'Tobias_Gregson', 'Unknown', 'Wiggins');
declare variable $colors := ('45, 128, 121','255, 0, 247', '255, 255, 255', '133, 182, 255', '94, 73, 117', '138, 131, 72', '229, 255, 0', '69, 69, 69','170, 0, 255','250, 0, 0','158, 157, 157','189, 255, 242','139, 255, 43','0, 255, 255','176, 11, 49','191, 255, 196','13, 0, 255','255, 212, 212');

(: This xQuery provides a character list with count for either Sherlock xml doc :)
(: Just change to the correct XML doc :)


let $chapters := //chapter

return(
<details>
    <summary>All Characters</summary>
    <div class="nav-detail">
        {(:let $people := //quote/@spokeBy => distinct-values():)
        
        for $per at $i in $people
        
        order by $per
    
        return(<div class="char-name"><div class="char-select"><input class="check" type="checkbox" value="{$per}" onclick="highlight(this)"/>
        <label for="{$per}">{replace($per,"_"," ")}</label></div><svg width="25" height="25"><rect width="20" height="20" style="stroke-width:.5px;stroke:rgba(37,37,37,.8);fill:rgba({$colors[$i]}, .3)"/></svg></div>)}
        <div class="buttons"><input type="button" onclick="checkAll(this)" value="Select All"/>
        <input type="button" onclick="unCheckAll()" value="Clear All"/></div>
     </div>
</details>,
for $chapter at $cIndex in $chapters

let $title := $chapter//chapterTitle/tokenize(string())


return (
<details>
    <summary>Chapter {$cIndex}</summary>
    <div class="nav-detail">
    <a href="#{$cIndex}">{
        for $word at $i in $title
        
        return(concat(substring($word,1,1),lower-case(substring($word,2))))
    }</a>
    {   let $persons := $chapter//quote/@spokeBy => distinct-values()

        for $per at $index in $persons
        
            for $per2 at $i in $people
            
            where $per2 eq $per
        
            order by $per
    
            return(
        
        <div class="char-name"><div class="char-select"><input class="check" type="checkbox" id="ch.{$cIndex}" value="{$per}" onclick="highlight(this)"/>
        <label for="{$per}">{replace($per,"_"," ")}</label></div><svg width="25" height="25"><rect width="20" height="20" style="stroke-width:.5px;stroke:rgba(37,37,37,.8);fill:rgba({$colors[$i]}, .3)"/></svg></div>)}
        <div class="buttons"><input type="button" onclick="checkAll(this)" value="Select All"/>
        <input type="button" onclick="unCheckAll()" value="Clear All"/></div>
    </div>
</details>))