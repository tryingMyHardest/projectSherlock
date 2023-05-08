declare option saxon:output "method=html";
declare variable $quotes := //Q{}quote;
declare variable $speakers := $quotes/data(@spokeBy) => distinct-values();
declare variable $xspacer := 10;
declare variable $yspacer := 25;

<html>
    <body>
        <svg xmlns="http://www.w3.org/2000/svg" width="1500" height="1000">
            <g transform="translate(150,100)"> 
                <g>
                {
                   for $speaker at $index in $speakers
                        let $spkr-char-count := $quotes[@spokeBy=$speaker]/text() => count()
                        return 
                        <g>
                            <text text-anchor="end" x="25" y="{$index*$yspacer+20}">{$speaker}</text>
                            <rect x="30" y="{$index*$yspacer}" height="20" width="{$spkr-char-count}" fill="blue"/>               
                        </g>
                }
                </g>
           </g>
        </svg>
    </body>
</html>