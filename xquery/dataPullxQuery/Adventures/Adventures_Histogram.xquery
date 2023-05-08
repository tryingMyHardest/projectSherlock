declare option saxon:output "method=html";
declare variable $xspacer := 1;
declare variable $yspacer := 25;
declare variable $stories := //Q{}story;

      <svg width="1100" height="400">
            <g transform="translate(350,0)">
                    {
                        for $story at $pos in $stories
                        let $quotes := $stories//Q{}quote
                        let $storyName :=$story/Q{}storyTitle/string()
                        let $barSize := 800
                            
                            let $count := $story//Q{}p/Q{}quote => count()
                            
                            let $SherlockCount := $story//Q{}p/Q{}quote[data(@spokeBy) =  'Sherlock_Holmes'] => count()                                        
                            let $SherlockPercent := $SherlockCount div $count
                            let $SherlockBar := $SherlockPercent * $barSize
                            
                            let $WatsonCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'John_Watson')]  => count()
                            let $WatsonPercent := $WatsonCount div $count
                            let $WatsonBar := $WatsonPercent *$barSize
                            let $WatsonBarStart := $SherlockBar
                            
                            let $LestradeCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Lestrade')] => count()
                            let $LestradePercent := $LestradeCount div $count
                            let $LestradeBar := $LestradePercent *$barSize
                            let $LestradeBarStart := $WatsonBarStart + $WatsonBar
                            
                            let $MarySutherlandCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Mary_Sutherland')] => count()
                            let $MarySutherlandPercent := $MarySutherlandCount div $count
                            let $MarySutherlandBar := $MarySutherlandPercent *$barSize
                            let $MarySutherlandBarStart := $LestradeBarStart + $LestradeBar
                            
                            let $IreneAdlerCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Irene_Adler')] => count()
                            let $IreneAdlerPercent := $IreneAdlerCount div $count
                            let $IreneAdlerBar := $IreneAdlerPercent *$barSize
                            let $IreneAdlerBarStart := $MarySutherlandBarStart + $MarySutherlandBar
                            
                            let $MaryWatsonCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Mary_Watson')] => count()
                            let $MaryWatsonPercent := $MaryWatsonCount div $count
                            let $MaryWatsonBar := $MaryWatsonPercent *$barSize
                            let $MaryWatsonBarStart := $IreneAdlerBarStart + $IreneAdlerBar
                            
                            let $BradstreetCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Bradstreet')] => count()
                            let $BradstreetPercent := $BradstreetCount div $count
                            let $BradstreetBar := $BradstreetPercent *$barSize
                            let $BradstreetBarStart := $MaryWatsonBarStart + $MaryWatsonBar
                            
                            let $VictorHatherleyCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Victor_Hatherley')] => count()
                            let $VictorHatherleyPercent := $VictorHatherleyCount div $count
                            let $VictorHatherleyBar := $VictorHatherleyPercent *$barSize
                            let $VictorHatherleyBarStart := $BradstreetBarStart + $BradstreetBar
                            
                            let $AliceTurnerCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Alice_Turner')] => count()
                            let $AliceTurnerPercent := $AliceTurnerCount div $count
                            let $AliceTurnerBar := $AliceTurnerPercent *$barSize
                            let $AliceTurnerBarStart := $VictorHatherleyBarStart + $VictorHatherleyBar
                            
                            let $JamesWindibankCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'James_Windibank')] => count()
                            let $JamesWindibankPercent := $JamesWindibankCount div $count
                            let $JamesWindibankBar := $JamesWindibankPercent *$barSize
                            let $JamesWindibankBarStart := $AliceTurnerBarStart + $AliceTurnerBar
                            
                            let $HosmerAngelCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Hosmer_Angel')] => count()
                            let $HosmerAngelPercent := $HosmerAngelCount div $count
                            let $HosmerAngelBar := $HosmerAngelPercent *$barSize
                            let $HosmerAngelBarStart := $JamesWindibankBarStart + $JamesWindibankBar
                            
                            let $JohnClayCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'John_Clay')] => count()
                            let $JohnClayPercent := $JohnClayCount div $count
                            let $JohnClayBar := $JohnClayPercent *$barSize
                            let $JohnClayBarStart := $HosmerAngelBarStart + $HosmerAngelBar
                            
                            let $AlexanderHolderCount := $story//Q{}p/Q{}quote[data(@spokeBy = 'Alexander_Holder')] => count()
                            let $AlexanderHolderPercent := $AlexanderHolderCount div $count
                            let $AlexanderHolderBar := $AlexanderHolderPercent *$barSize
                            let $AlexanderHolderBarStart := $JohnClayBarStart + $JohnClayBar
                            
                            let $VioletHunterCount := $story//Q{}p/Q{}quote[@spokeBy = 'Violet_Hunter'] => count()
                            let $VioletHunterPercent := $VioletHunterCount div $count
                            let $VioletHunterBar := $VioletHunterPercent *$barSize
                            let $VioletHunterBarStart := $AlexanderHolderBarStart + $AlexanderHolderBar
                            
                            
                            let $UnknownCount := $story//Q{}p/Q{}quote[@spokeBy = 'Unknown'] => count()
                            let $UnknownPercent := $UnknownCount div $count
                            let $UnknownBar := $UnknownPercent *$barSize
                            let $UnknownBarStart := $VioletHunterBarStart + $VioletHunterBar
                            
                            let $otherCount := $story//Q{}p/Q{}quote[not(contains(@spokeBy, 'Sherlock_Holmes')) and not(contains(@spokeBy, 'John_Watson')) and not(contains(@spokeBy, 'Mary_Sutherland'))
                            and not(contains(@spokeBy, 'Irene_Adler')) and not(contains(@spokeBy, 'Mary_Watson')) and not(contains(@spokeBy, 'Lestrade')) and not(contains(@spokeBy, 'Bradstreet'))
                            and not(contains(@spokeBy, 'Alice_Turner')) and not(contains(@spokeBy, 'Hosmer_Angel')) and not(contains(@spokeBy, 'John_Clay')) and not(contains(@spokeBy, 'Unknown'))
                            and not(contains(@spokeBy, 'Victor_Hatherley')) and not(contains(@spokeBy, 'James_Windibank')) and not(contains(@spokeBy, 'Alexander_Holder')) and not(contains(@spokeBy, 'Violet_Hunter'))] => count()
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
                                    fill="black">{$storyName}</text>,
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
                                            x1="{$MarySutherlandBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$MarySutherlandBar * $xspacer +$MarySutherlandBarStart* $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(16, 161, 28, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$IreneAdlerBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$IreneAdlerBar * $xspacer + $IreneAdlerBarStart* $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 56, 56,.7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$MaryWatsonBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$MaryWatsonBar * $xspacer +$MaryWatsonBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 145, 0,.7)"
                                            stroke-width="15"/>                          
                                        <line 
                                            x1="{$BradstreetBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$BradstreetBar * $xspacer + $BradstreetBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 235, 56,.8)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$AliceTurnerBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$AliceTurnerBar * $xspacer + $AliceTurnerBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 56, 195, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$VictorHatherleyBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$VictorHatherleyBar * $xspacer + $VictorHatherleyBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(143, 91, 23,.7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$JamesWindibankBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JamesWindibankBar * $xspacer + $JamesWindibankBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(102, 194, 255, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$HosmerAngelBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$HosmerAngelBar * $xspacer + $HosmerAngelBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(255, 235, 56,.9)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$JohnClayBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$JohnClayBar * $xspacer + $JohnClayBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(138, 28, 31, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$AlexanderHolderBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$AlexanderHolderBar * $xspacer + $AlexanderHolderBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(30, 255, 0, .7)"
                                            stroke-width="15"/>
                                        <line 
                                            x1="{$VioletHunterBarStart * $xspacer}"
                                            y1="{$pos * $yspacer}"
                                            x2="{$VioletHunterBar * $xspacer + $VioletHunterBarStart * $xspacer}"
                                            y2="{$pos * $yspacer}"
                                            stroke="rgba(183, 0, 255,.9)"
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
                           <!--****************25, 50, 75% lines**************-->
                                            <!--25%-->  <line
                                            x1="187.5"
                                            y1="0"
                                            x2="187.5"
                                            y2="325"
                                            stroke="rgba(37,37,37,.8)"
                                            stroke-width="2"
                                            />
                                            <!--50%-->  <line
                                            x1="375"
                                            y1="0"
                                            x2="375"
                                            y2="325"
                                            stroke="rgba(37,37,37,.8)"
                                            stroke-width="2"
                                            />
                                            <text x="367.5" y="345" font-family="MWLight">50</text>
                                            <!--75%-->  <line
                                            x1="562.5"
                                            y1="0"
                                            x2="562.5"
                                            y2="325"
                                            stroke="rgba(37,37,37,.8)"
                                            stroke-width="2"/>
                                            </g>
                </g>
        </svg>  