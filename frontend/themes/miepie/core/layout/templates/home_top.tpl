<div class="bodybg">
    <div class="layout">
        <header id="header">
            <div class="container">

                {* Logo *}
                <div id="logo">
                    <h2><a href="/">{$siteTitle}</a></h2>
                </div>

                {* Top Bar *}
                <div class="header">
                    {*Logo Image*}
                    <div class="logo">
                        <a href="/">
                            <img src="{$THEME_URL}/core/layout/images/logo.jpg" alt="{$siteTitle}">
                        </a>
                    </div>
                    <div class="icon">
                        <img src="{$THEME_URL}/core/layout/images/tel.jpg"/>
                    </div>
                    <div class="tel">
                        咨询和服务热线：
                        <span>024 2251 1365</span>
                    </div>
                    <div class="search">
                        <form id="form1" action="news.aspx?ss=1" method="post"></form>
                    </div>
                </div>

                {* Skip link *}
                <div id="skip">
                    <p><a href="#main">{$lblSkipToContent|ucfirst}</a></p>
                </div>

                {* Navigation *}
                <div class="nav">
                    <div class="nav_left"></div>
                    <div class="nav_mid">
                        <nav id="headerNavigation">
                            <h4>{$lblMainNavigation|ucfirst}</h4>
                            {$var|getnavigation:'page':0:2}
                        </nav>

                    </div>
                    <div class="nav_right">
                        {* Language *}
                        <nav id="headerLanguage">
                            <h4>{$lblLanguage|ucfirst}</h4>
                            {include:core/layout/templates/languages.tpl}
                        </nav>
                    </div>
                    <div class="clearfix"></div>
                </div>




                {* Top position *}
                {iteration:positionTop}
                {$positionTop.blockContent}
                {/iteration:positionTop}

                {* Breadcrumb
                <div id="breadcrumb">
                    <h4>{$lblBreadcrumb|ucfirst}</h4>
                    {include:core/layout/templates/breadcrumb.tpl}
                </div>
                *}

                {* Advertisement position *}
                {iteration:positionAdvertisement}
                {option:positionAdvertisement.blockIsHTML}
                    <div id="headerAd">
                        {$positionAdvertisement.blockContent}
                    </div>
                {/option:positionAdvertisement.blockIsHTML}
                {option:!positionAdvertisement.blockIsHTML}
                {$positionAdvertisement.blockContent}
                {/option:!positionAdvertisement.blockIsHTML}
                {/iteration:positionAdvertisement}

            </div>

        </header>