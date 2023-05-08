declare option saxon:output "method=html";
declare variable $linefeed := "&#10;";
declare variable $people := ('Alexander_Holder', 'Alice_Turner', 'Bradstreet', 'Breckinridge', 'Francis_Moulton', 'Grimesby_Roylott', 'Helen_Stoner', 'Henry_Baker', 'Irene_Adler', 'Isa_Whitney', 'Jabez_Wilson', 'James_Ryder', 'James_Windibank', 'John_Clay', 'John_Openshaw', 'John_Turner', 'John_Watson', 'Jones', 'Kate_Whitney', 'Lestrade', 'Mary_Holder', 'Mary_Sutherland', 'Mary_Watson', 'Merryweather', 'Mrs_Moulton', 'Mrs_St_Clair', 'Mrs_Toller', 'Neville_St_Clair', 'Peterson', 'Robert_St_Simon', 'Sherlock_Holmes', 'Unknown', 'Victor_Hatherley', 'Violet_Hunter', 'Wilhelm_Ormstein');
declare variable $colors := ('56, 252, 154', '196, 192, 255',   '252, 252, 93', '115, 0, 255', '255, 168, 168',  '185, 252, 104',     '156, 100, 3','21, 128, 3',  '255, 165, 0',  '250, 57, 134','255, 212, 128','112, 91, 42','65, 108, 120',   '0, 45, 128',  '0, 255, 98','107, 140, 129','69, 69, 69','75, 72, 122','173, 49, 0','158, 157, 157','255, 189, 227','76, 175, 80','245, 83, 83', '149, 186, 0', '255, 0, 238',  '219, 176, 149','94, 65, 46', '108, 89, 128',  '133, 165, 255','110, 106, 0', '0, 255, 255',       '13, 0, 255','79, 160, 255',      '166, 0, 255',  '171, 135, 255' );

let $chapters := //story

return(
<details>
    <summary>All Characters</summary>
    <div class="nav-detail">
        {
        for $per at $i in $people
        
        order by $per
    
        return(<div class="char-name"><div class="char-select"><input class="check" type="checkbox" value="{$per}" onclick="highlight(this)"/>
        <label for="{$per}">{replace($per,"_"," ")}</label></div><svg width="25" height="25"><rect width="20" height="20" style="stroke-width:.5px;stroke:rgba(37,37,37,.8);fill:rgba({$colors[$i]}, .3)"/></svg></div>)}
        <div class="buttons"><input type="button" onclick="checkAll(this)" value="Select All"/>
        <input type="button" onclick="unCheckAll()" value="Clear All"/></div>
     </div>
</details>,
for $chapter at $cIndex in $chapters

let $title := $chapter//storyTitle/tokenize(string())


return (
<details>
    <summary>{for $word at $i in $title
        
        return(concat(substring($word,1,1),lower-case(substring($word,2))))}</summary>
    <div class="nav-detail">
    <a href="#{$cIndex}">Go To Story</a>
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