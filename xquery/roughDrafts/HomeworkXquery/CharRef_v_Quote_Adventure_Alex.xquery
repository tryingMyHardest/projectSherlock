declare variable $characters := //quote/@spokeBy => distinct-values();
declare variable $people := //person/@perName => distinct-values();
declare variable $quotes := //quote;
declare variable $numChar := $characters => count();

<svg alignment-baseline="baseline" viewport="0 0 1500 {$numChar*30}" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
        <g>
           {
            let $numChar := $characters => count()
            
            return
                (<g>
                <line x1="150" y1="20" x2="150" y2="{$numChar*25 + 25}" stroke-width="3" stroke="black"/>
                </g>,
       
                    for $char at $index in $characters
                    
                    let $quoteCount := //Q{}quote[data(@spokeBy) = $char] => count()
                    let $refCount := //Q{}person[data(@perName)=$char] => count()
                    
                    return
                    <g>
                        <text text-anchor="end" x="143" y="{25 * $index + 14}">{replace($char,"_"," ")}</text>
                        <rect x="151.5" y="{25 * $index}" height="10" width="{$quoteCount}" stroke="red" stroke-width="0" fill="red"/>
                        <text font-size="10px" text-anchor="start" x="{153.5 + $quoteCount}" y="{25 * $index + 8.5}">{$quoteCount}</text>
                        <rect x="151.5" y="{25 * $index+10}" height="10" width="{$refCount}" stroke="green" stroke-width="0" fill="green"/>
                        <text font-size="10px" text-anchor="start" x="{153.5 + $refCount}" y="{25 * $index + 18.5}">{$refCount}</text>
                    </g>,
                    
                    <rect x="150" y="{$numChar*25 + 50}" height="25" width="25" fill="red"/>,
                    <text x="180" y="{$numChar*25 + 67}">= Number of Quotes</text>,
                    <rect x="150" y="{$numChar*25 + 80}" height="25" width="25" fill="green"/>,
                    <text x="180" y="{$numChar*25 + 97}">= Number of References</text>
         )}  
        </g>
    </svg>