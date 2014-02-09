</div>
</div>

<div id="bottomWrapper" class="foot">
    <div class="footer">
        {include:core/layout/templates/footer.tpl}
    </div>
</div>

{* General Javascript *}
{iteration:jsFiles}
    <script src="{$jsFiles.file}"></script>
{/iteration:jsFiles}

{* Theme specific Javascript *}
<script src="{$THEME_URL}/core/js/triton.js"></script>
<script type="text/javascript" src="{$THEME_URL}/core/js/ribbons.js"></script>


{* Site wide HTML *}
{$siteHTMLFooter}

{* baidu bridge *}
{*<script src='http://hm.baidu.com/h.js?ae909aeae8a4eef49abaf631f1ae8caf' type='text/javascript'></script>*}
{*<script>$('</script>*}