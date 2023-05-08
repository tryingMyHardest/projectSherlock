declare option saxon:output "method=html";

<div class="legend">
{   
    let $story := ('Total Text','Total Quotes','Total References','Total Characters')
    let $colors := ('95, 146, 222','67, 240, 73','242, 123, 31','37,37,37')
    
    for $color at $i in $colors
    
    return(<div class="legend-element"><h4>{$story[$i]}</h4><svg width="40" height="40"><rect width="40" height="40" style="fill:rgba({$color}, .8)"></rect></svg></div>)}
    </div>
