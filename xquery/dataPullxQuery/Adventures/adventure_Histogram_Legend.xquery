declare option saxon:output "method=html";

<div class="legend">
{   
    let $characters := ('Sherlock Holmes','John Watson','Lestrade','Mary Sutherland','Irene Adler', 'Mary Watson', 'Bradstreet', 'Victor Hatherley', 'Alice Turner', 'James Windibank', 'Hosmer Angel',
    'John Clay','Alexander Holder','Violet Hunter','Unknown','Other')
    let $colors := ('rgba(0, 255, 255, .7)','rgba(37,37,37,.7)','rgba(255, 255, 255, .7)','rgba(16, 161, 28, .7)','rgba(255, 56, 56,.7)','rgba(255, 145, 0,.7)', 'rgba(255, 56, 56,.7)','rgba(255, 56, 195, .7)',
    'rgba(143, 91, 23,.7)','rgba(102, 194, 255, .7)','rgba(255, 235, 56,.9)','rgba(138, 28, 31, .7)','rgba(30, 255, 0, .7)','rgba(183, 0, 255,.9)','rgba(179, 255, 56, .7)','rgba(40, 40, 252,.7)')
    
    for $char at $i in $characters
    
    return(<div class="legend-element"><h4>{$char}</h4><svg width="25" height="25"><rect width="25" height="25" style="fill:{$colors[$i]}"></rect></svg></div>)}
    </div>