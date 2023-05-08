xquery version "3.1";
declare namespace math = "http://www.w3.org/2005/xpath-functions/math";
declare option saxon:output "method=html";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";
declare variable $ad:= doc('../xml/The_Study_in_Scarlet.xml');

<html>
<head></head>
<body>
<h1>Relative sizes: Stories, quotes</h1>

<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 1000 700">
    <g transform="translate(0,0)">
    
    <g transform="translate(150,200)">
    <circle stroke="blue" stroke-width="5" fill="blue"
    cx="150" cy="150" r="{
          let $length:= $ad=>string-join()=>string-length()
          return math:sqrt($length) div 2.5
        }"/>
       
        <circle stroke="green" stroke-width="5" fill="yellow"
        cx="150" cy="100" r="{
          let $quote_length:= $ad//Q{}quote=>string-join()=>string-length()
          return math:sqrt($quote_length div 5.5)}"/>
          
         
          
        <circle stroke="red" stroke-width="5" fill="black"
        cx="100" cy="50" r="{
        let $qPeople := $ad//Q{}quote/@spokeBy => distinct-values()
        let $rPeople := $ad//Q{}person/@perName => distinct-values()
        let $fPeople := ($qPeople, $rPeople) => distinct-values()
          
          return math:sqrt(count($fPeople)) div .1}"/>
          
          <circle stroke="pink" stroke-width="5" fill="red"
        cx="200" cy="200" r="{
          let $ref_count:= $ad//Q{}person=>count()
          return math:sqrt($ref_count) div .5}"/>
        
        </g>
    </g>
</svg>
</body>
</html>