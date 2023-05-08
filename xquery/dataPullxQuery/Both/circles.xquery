xquery version "3.1";
declare namespace math = "http://www.w3.org/2005/xpath-functions/math";
declare option saxon:output "method=html";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";
declare variable $ad:= doc('../xml/The_Adventures_of_Sherlock_Holmes.xml');
declare variable $sc:= doc('../xml/The_Study_in_Scarlet.xml');

(:whc: you'll want to declare a similar global variable here for Scarlet:)

<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 5000 5000">
    <g transform="translate(0,0)">
    
    <g transform="translate(150,200)">
    <circle stroke="blue" stroke-width="5" fill="blue"
    cx="500" cy="400" r="{
          let $length:= $ad=>string-join()=>string-length()
          return math:sqrt($length) div 2
        }"/>
        <!--whc: put your other circles for Adventures here, inside this <g> element, like so:-->
        <circle stroke="green" stroke-width="5" fill="yellow"
        cx="150" cy="100" r="{
          let $quote_length:= $ad//Q{}quote=>string-join()=>string-length()
          return math:sqrt($quote_length ) div 5.5}"/>
          
         
          
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
        <!--whc: the circle above assumes that you want to show the proportion of the story that is quotes, 
        which turns out to be a lot. The original plan instead was just to count the number of the quotes, so 
        if you want to do that, change it so it's counting quotes instead of doing string-join and string-length.
        Once you've got that, you can use similar code to count the number of characters and the number of refs.-->
        
        </g>
        
         <g transform="translate(400,600)">
    <circle stroke="blue" stroke-width="5" fill="blue"
    cx="500" cy="800" r="{
          let $length:= $sc=>string-join()=>string-length()
          return math:sqrt($length) div 5.5
        }"/>
       
        <circle stroke="green" stroke-width="5" fill="yellow"
        cx="" cy="800" r="{
          let $quote_length:= $sc//Q{}quote=>string-join()=>string-length()
          return math:sqrt($quote_length )div 5.5}"/>
          
         
          
        <circle stroke="red" stroke-width="5" fill="black"
        cx="100" cy="50" r="{
        let $qPeople := $sc//Q{}quote/@spokeBy => distinct-values()
        let $rPeople := $sc//Q{}person/@perName => distinct-values()
        let $fPeople := ($qPeople, $rPeople) => distinct-values()
          
          return math:sqrt(count($fPeople)) div .1}"/>
          
          <circle stroke="pink" stroke-width="5" fill="red"
        cx="200" cy="200" r="{
          let $ref_count:= $sc//Q{}person=>count()
          return math:sqrt($ref_count) div .5}"/>
        
        </g>
    </g>
</svg>