declare option saxon:output "method=html";
declare variable $xspacer := 1;
declare variable $yspacer := 25;
declare variable $chapters := //Q{}chapter;

      <svg width="1200" height="400">
            <g transform="translate(350,0)">
                        
                            {
                            for $chapter at $pos in $chapters
                            
                            let $quotes := $chapters//Q{}quote
                            let $chapterTitle := $chapter/Q{}chapterTitle/string()
                            let $barSize := 800
                            
                            let $count := $chapter//Q{}p/Q{}quote => count()
                            
                            let $SherlockCount := $chapter//Q{}p/Q{}quote[@spokeBy =  'Sherlock_Holmes'] => count()                                        
                            let $SherlockPercent := $SherlockCount div $count
                            let $SherlockBar := $SherlockPercent * $barSize
                            
                            let $WatsonCount := $chapter//Q{}p/Q{}quote[@spokeBy = 'John_Watson']  => count()
                            let $WatsonPercent := $WatsonCount div $count
                            let $WatsonBar := $WatsonPercent *$barSize
                            let $WatsonBarStart := $SherlockBar
                            
                            let $LestradeCount := $chapter//Q{}p/Q{}quote[@spokeBy = 'Lestrade'] => count()
                            let $LestradePercent := $LestradeCount div $count
                            let $LestradeBar := $LestradePercent *$barSize
                            let $LestradeBarStart := $WatsonBarStart + $WatsonBar
                            
                            let $TobiasGregsonCount := $chapter//Q{}p/Q{}quote[@spokeBy = 'Tobias_Gregson'] => count()
                            let $TobiasGregsonPercent := $TobiasGregsonCount div $count
                            let $TobiasGregsonBar := $TobiasGregsonPercent *$barSize
                            let $TobiasGregsonBarStart := $LestradeBarStart + $LestradeBar
                            
                            let $JohnFerrierCount := $chapter//Q{}p/Q{}quote[@spokeBy = 'John_Ferrier'] => count()
                            let $JohnFerrierPercent := $JohnFerrierCount div $count
                            let $JohnFerrierBar := $JohnFerrierPercent *$barSize
                            let $JohnFerrierBarStart := $TobiasGregsonBarStart + $TobiasGregsonBar
                            
                            let $LucyFerrierCount := $chapter//Q{}p/Q{}quote[@spokeBy = 'Lucy_Ferrier'] => count()
                            let $LucyFerrierPercent := $LucyFerrierCount div $count
                            let $LucyFerrierBar := $LucyFerrierPercent *$barSize
                            let $LucyFerrierBarStart := $JohnFerrierBarStart + $JohnFerrierBar
                            
                            let $JeffersonHopeCount := $chapter//Q{}p/Q{}quote[@spokeBy = 'Jefferson_Hope'] => count()
                            let $JeffersonHopePercent := $JeffersonHopeCount div $count
                            let $JeffersonHopeBar := $JeffersonHopePercent *$barSize
                            let $JeffersonHopeBarStart := $LucyFerrierBarStart + $LucyFerrierBar
                            
                            let $EnochJDrebberCount := $chapter//Q{}p/Q{}quote[@spokeBy = 'Enoch_J_Drebber'] => count()
                            let $EnochJDrebberPercent := $EnochJDrebberCount div $count
                            let $EnochJDrebberBar := $EnochJDrebberPercent *$barSize
                            let $EnochJDrebberBarStart := $JeffersonHopeBarStart + $JeffersonHopeBar
                            
                            let $JosephStrangersonCount := $chapter//Q{}p/Q{}quote[@spokeBy = 'Joseph_Strangerson'] => count()
                            let $JosephStrangersonPercent := $JosephStrangersonCount div $count
                            let $JosephStrangersonBar := $JosephStrangersonPercent *$barSize
                            let $JosephStrangersonBarStart := $EnochJDrebberBarStart + $EnochJDrebberBar
                            
                            let $UnknownCount := $chapter//Q{}p/Q{}quote[@spokeBy = 'Unknown'] => count()
                            let $UnknownPercent := $UnknownCount div $count
                            let $UnknownBar := $UnknownPercent *$barSize
                            let $UnknownBarStart := $JosephStrangersonBarStart + $JosephStrangersonBar
                            
                            let $otherCount := $chapter//Q{}p/Q{}quote[not(contains(@spokeBy, 'Sherlock_Holmes')) and not(contains(@spokeBy, 'John_Watson')) and not(contains(@spokeBy, 'Mary_Sutherland')) and not(contains(@spokeBy, 'Irene_Adler')) and not(contains(@spokeBy, 'Mary_Watson')) and not(contains(@spokeBy, 'Lestrade')) 
                            and not(contains(@spokeBy, 'Bradstreet')) and not(contains(@spokeBy, 'Alice_Turner')) and not(contains(@spokeBy, 'Joseph_Strangerson')) and not(contains(@spokeBy, 'Unknown')) and not(contains(@spokeBy, 'Tobias_Gregson')) and not(contains(@spokeBy, 'Lucy_Ferrier')) and not(contains(@spokeBy, 'John_Ferrier'))
                            and not(contains(@spokeBy, 'Jefferson_Hope')) and not(contains(@spokeBy, 'Enoch_J_Drebber'))] => count()
                            let $otherPercent := $otherCount div $count
                            let $otherBar := $otherPercent *$barSize
                            let $otherBarStart := $UnknownBarStart + $UnknownBar
                            
                            return(
                                <text
                                    text-anchor="end"
                                    x="75"
                                    y="{$pos * $yspacer + 5}"
                                    font-family="MWLight"
                                    font-size="15px"
                                    fill="rgba(37,37,37,1)">{$chapterTitle}</text>,
                                    <g transform="translate(100,0)">
                                        <line 
                                            x1="0"
                                            y1="{$pos * $yspacer}"
                                            x2="{$SherlockBar * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(0, 255, 255, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$WatsonBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$WatsonBar * $xspacer +$WatsonBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(37,37,37,.7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$LestradeBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$LestradeBar * $xspacer + $LestradeBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 255, 255, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$TobiasGregsonBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$TobiasGregsonBar * $xspacer +$TobiasGregsonBarStart* $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(16, 161, 28, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$LucyFerrierBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$LucyFerrierBar * $xspacer + $LucyFerrierBarStart* $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 145, 0,.7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$JohnFerrierBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JohnFerrierBar * $xspacer +$JohnFerrierBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 56, 56,.7)"
                                            stroke-width="15"/>                          
                                        <line 
                                            x1="{$JeffersonHopeBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JeffersonHopeBar * $xspacer + $JeffersonHopeBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 235, 56,.8)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$EnochJDrebberBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$EnochJDrebberBar * $xspacer + $EnochJDrebberBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 56, 195, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$JosephStrangersonBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JosephStrangersonBar * $xspacer + $JosephStrangersonBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(199, 56, 255,.7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$UnknownBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$UnknownBar * $xspacer + $UnknownBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(179, 255, 56, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$otherBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$otherBar * $xspacer + $otherBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(40, 40, 252,.7)"
                                            stroke-width="15"/>
                                    </g>)}
                                    <g transform="translate(100,0)">
                                    <!--*************25, 50, 75% lines*************-->
                                            <!--25%-->  <line
                                            x1="187.5"
                                            y1="0"
                                            x2="187.5"
                                            y2="370"
                                            stroke="rgba(37,37,37,.8)"
                                            stroke-width="2"
                                            />
                                            <!--50%-->  <line
                                            x1="375"
                                            y1="0"
                                            x2="375"
                                            y2="370"
                                            stroke="rgba(37,37,37,.8)"
                                            stroke-width="2"
                                            />
                                            <text x="367.5" y="390" font-family="MWLight">50</text>
                                            <!--75%-->  <line
                                            x1="562.5"
                                            y1="0"
                                            x2="562.5"
                                            y2="370"
                                            stroke="rgba(37,37,37,.8)"
                                            stroke-width="2"/>
                                            </g>
                                    
                                    
                                        
            </g>
        </svg>  