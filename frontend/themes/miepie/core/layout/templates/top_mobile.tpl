{* Language *}
<nav id="headerLanguage">
    <h4>{$lblLanguage|ucfirst}</h4>
    {include:core/layout/templates/languages.tpl}
</nav>
<div class="bodybg">
    <div class="layout">
        <header id="header">
            <div class="container">



                {* Top Bar *}
                <div class="header">
                    {*Logo Image*}
                    <div class="logo">
                        <a href="/"><img src="{$THEME_URL}/core/layout/images/logo_transparent.png" alt="{$siteTitle}"></a><span class="logoText" title="沈阳朗新天霁软件技术有限公司">沈阳朗新</span>

                    </div>
                    <div id="menuSwitch" onclick="$('#mainNav').toggleClass('expanded')">
                        <img src="{$THEME_URL}/core/layout/images/navicon.png"/>
                    </div>
                    <div id="searchBtn"><img onclick="$('.search').toggleClass('expanded')" src="{$THEME_URL}/core/layout/images/search.png" /></div>
                    <div class="search">

                        <h4>搜索</h4>

                        <form accept-charset="UTF-8" action="/zh/{$lblSearch|ucfirst}" method="get" id="search"
                              class="forkForms submitWithLink">
                            <input type="hidden" value="search" id="formSearch" name="form" />
                            <div class="oneLiner">
                                <input value="" id="qWidget" name="q_widget" maxlength="255" type="text"
                                       class="inputText autoSuggest"/><input id="submit" class="ab inputSubmit" type="submit"
                                                                             name="submit" value="{$lblSearch|ucfirst}"/>

                            </div>
                        </form>

                    </div>
                    {* Navigation *}
                    <div id="mainNav">
                        <nav id="headerNavigation">
                            <h4>{$lblMainNavigation|ucfirst}</h4>
                            {$var|getnavigation:'page':0:1}
                        </nav>
                    </div>



                </div>







                {* Top position *}
                {*{iteration:positionTop}*}
                {*{$positionTop.blockContent}*}
                {*{/iteration:positionTop}*}




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

        {* Breadcrumb*}
        <div id="breadcrumb">
            <h4>{$lblBreadcrumb|ucfirst}</h4>
            {include:core/layout/templates/breadcrumb.tpl}
        </div>