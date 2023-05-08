declare namespace math = "http://www.w3.org/2005/xpath-functions/math";
declare option saxon:output "method=html";

declare variable $ad:= doc('../xml/The_Adventures_of_Sherlock_Holmes.xml');
declare variable $sc:= doc('../xml/The_Study_in_Scarlet.xml');

declare variable $lengthFactor := 3;
declare variable $countFactor := .5;
declare variable $buffer := 75;

let $adTitle := $ad//title/string()
let $scTitle := $sc//title/string()

let $length:= $sc=>string-join()=>string-length()
let $center := math:sqrt($length) div $lengthFactor + 25

return(

<svg width="{$center*2}" height="{$center*2}">
    <g transform="translate(0,0)">
    
    <circle stroke="rgba(37,37,37,.8)" stroke-width=".5" fill="rgba(95, 146, 222, .8)"
    cx="{$center}"
    cy="{$center}"
    r="{$center - 25}"/>
   
    <circle stroke="rgba(37,37,37,.8)" stroke-width=".5" fill="rgba(67, 240, 73, .8)"
    cx="{$center}"
    cy="{$center}" 
    r="{
          let $quote_length:= $sc//Q{}quote=>string-join()=>string-length()
          return math:sqrt($quote_length ) div $lengthFactor}"/>
          
    <circle stroke="rgba(37,37,37,.8)" stroke-width=".5" fill="rgba(242, 123, 31, .8)"
    cx="{$center}" 
    cy="{$center}"
    r="{
          let $ref_count:= $sc//Q{}person=>count()
          return math:sqrt($ref_count) div $countFactor}"/>
          
    <circle stroke="rgba(37,37,37,.8)" stroke-width=".5" fill="rgba(37,37,37, .8)"
    cx="{$center}"
    cy="{$center}"
    r="{
        let $qPeople := $sc//Q{}quote/@spokeBy => distinct-values()
        let $rPeople := $sc//Q{}person/@perName => distinct-values()
        let $fPeople := ($qPeople, $rPeople) => distinct-values()
          
          return math:sqrt(count($fPeople)) div $countFactor}"/>
        </g>
</svg>)