declare option saxon:output "method=html";

<div class="legend">
{   
    let $characters := ('Sherlock Holmes','John Watson','Lestrade','Tobias Gregson','John Ferrier', 'Lucy Ferrier', 'Jefferson Hope', 'Enoch J Drebber', 'Joseph Strangerson', 'Unknown', 'Other')
    let $colors := ('rgba(0, 255, 255, .7)','rgba(37,37,37,.7)','rgba(255, 255, 255, .7)','rgba(16, 161, 28, .7)','rgba(255, 145, 0,.7)', 'rgba(255, 56, 56,.7)','rgba(255, 235, 56,.8)',
    'rgba(255, 56, 195, .7)','rgba(199, 56, 255,.7)','rgba(179, 255, 56, .7)','rgba(40, 40, 252,.7)')
    
    for $color at $i in $colors
    
    return(<div class="legend-element"><h4>{$characters[$i]}</h4><svg width="25" height="25"><rect width="25" height="25" style="fill:{$color}"></rect></svg></div>)}
    </div>