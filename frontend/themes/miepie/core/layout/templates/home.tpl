{option:isMobile}
    {include:core/layout/templates/head_mobile.tpl}
    <body class="{$LANGUAGE} home mobile" itemscope itemtype="http://schema.org/WebPage">
    {include:core/layout/templates/top_mobile.tpl}
{/option:isMobile}
{option:!isMobile}
    {include:core/layout/templates/head.tpl}
    <body class="{$LANGUAGE} home" itemscope itemtype="http://schema.org/WebPage">
    {include:core/layout/templates/top.tpl}
{/option:!isMobile}
    <div id="main">
        <div class="container">

            {* Main column *}
            <div class="col col-12 lastCol">

                {* Page title *}
                {option:!hideContentTitle}
                    <header class="mainTitle">
                        <h1>{$page.title}</h1>
                    </header>
                {/option:!hideContentTitle}

                {* Main position *}
                {iteration:positionMain}
                {option:positionMain.blockIsHTML}
                    <section class="mod">
                        <div class="inner">
                            <div class="bd content">
                                {$positionMain.blockContent}
                            </div>
                        </div>
                    </section>
                {/option:positionMain.blockIsHTML}
                {option:!positionMain.blockIsHTML}
                {$positionMain.blockContent}
                {/option:!positionMain.blockIsHTML}
                {/iteration:positionMain}

            </div>

            {* Left column *}
            <div class="col col-6">

                {* Left position *}
                {iteration:positionLeft}
                {option:positionLeft.blockIsHTML}
                    <section class="mod">
                        <div class="inner">
                            <div class="bd content">
                                {$positionLeft.blockContent}
                            </div>
                        </div>
                    </section>
                {/option:positionLeft.blockIsHTML}
                {option:!positionLeft.blockIsHTML}
                {$positionLeft.blockContent}
                {/option:!positionLeft.blockIsHTML}
                {/iteration:positionLeft}

            </div>

            {* Right column *}
            <div class="col col-6 lastCol">

                {* Right position *}
                {iteration:positionRight}
                {option:positionRight.blockIsHTML}
                    <section class="mod">
                        <div class="inner">
                            <div class="bd content">
                                {$positionRight.blockContent}
                            </div>
                        </div>
                    </section>
                {/option:positionRight.blockIsHTML}
                {option:!positionRight.blockIsHTML}
                {$positionRight.blockContent}
                {/option:!positionRight.blockIsHTML}
                {/iteration:positionRight}

            </div>
            <div class="clearBoth"></div>
        </div>
    </div>
    <noscript>
        <div class="message notice">
            <h4>{$lblEnableJavascript|ucfirst}</h4>

            <p>{$msgEnableJavascript}</p>
        </div>
    </noscript>

    {option:isMobile}
        {include:core/layout/templates/bottom_mobile.tpl}
    {/option:isMobile}
    {option:!isMobile}
        {include:core/layout/templates/bottom.tpl}
    {/option:!isMobile}
    </body>

</html>
