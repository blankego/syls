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
<script src='http://hm.baidu.com/h.js?ae909aeae8a4eef49abaf631f1ae8caf' type='text/javascript'></script>


{* floating buttons *}
<div id="floatBtns">
    <div id="goTop" class="fBtn" title="页顶"></div>
    <div id="followUs" class="fBtn" title="关注" onclick="$('#social').toggle()"></div>
    <div id="leaveMessage" class="fBtn" title="咨询" onclick="$('#BDBridgeWrap').toggle()"></div>
    <div id="social">
        <div id="weChat" class="fBtn" title="微信" onclick="$('#qr').toggle()"></div>
        <div id="weibo" class="fBtn" title="新浪微博"></div>
        <div id="rssBtn" class="fBtn" title="RSS"><a href="/zh/blog/rss"></a></div>
        <div id="qr"></div>
    </div>

    <script>
        (function () {
            function checkGoTop() {
                if (window.pageYOffset == 0){$('#goTop').fadeOut('slow');}
                else
                {$('#goTop').fadeIn('slow');}
            }

            $("#goTop").click(function () {
                $('html, body').animate({scrollTop:0}, 'slow', checkGoTop);

                return false;
            });

            if (document.onmousewheel) {
                document.onmousewheel = checkGoTop;
            } else {
                document.addEventListener('DOMMouseScroll', checkGoTop);
            }
            window.onscroll = function () {
                console.log('scroll');
            };
            checkGoTop();
        })()
    </script>
</div>
