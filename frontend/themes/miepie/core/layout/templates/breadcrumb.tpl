<p itemprop="breadcrumb">
    {*{$lblYouAreHere|ucfirst}:*}
    {iteration:breadcrumb}
    {option:breadcrumb.url}
        <a href="{$breadcrumb.url}" title="{$breadcrumb.title}">
    {/option:breadcrumb.url}
        {option:breadcrumb.first}<img id="homeIcon" src="{$THEME_URL}/core/layout/images/home.png" alt="home"/>{/option:breadcrumb.first}
    {option:!breadcrumb.first}{$breadcrumb.title}{/option:!breadcrumb.first}
    {option:breadcrumb.url}</a>{/option:breadcrumb.url}
    {option:!breadcrumb.last} › {/option:!breadcrumb.last}
    {/iteration:breadcrumb}
</p>