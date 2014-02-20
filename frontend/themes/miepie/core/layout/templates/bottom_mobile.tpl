</div>
</div>

<div id="bottomWrapper" class="foot">
    <img id="plus" onclick="$('#plus,#nav2').toggleClass('expanded')"  src="{$THEME_URL}/core/layout/images/plus.png"/>

    <div id="nav2">
        <div id="goHome">
            <a href="/"><img src="{$THEME_URL}/core/layout/images/mob_home.png"/><span>主页</span></a>
        </div>
        <div id="call">
            <a href="tel:+862422511365/"><img src="{$THEME_URL}/core/layout/images/mob_phone.png"/><span>联系电话</span></a>
        </div>
        <div id="wechat">
            <a href="weixin://profile/miesoft_service"><img src="{$THEME_URL}/core/layout/images/mob_wechat.png"/><span>关注微信</span></a>
        </div>
        <div id="mail">
            <a href="mailto:miesoft@126.com"><img src="{$THEME_URL}/core/layout/images/mob_mail.png"/><span>电子邮件</span></a></div>
        <div id="talk">
            <a href="/"><img src="{$THEME_URL}/core/layout/images/mob_talk.png"/><span>在线客服</span></a></div>
        <div id="find">
            <a href="/zh/contact"><img src="{$THEME_URL}/core/layout/images/mob_pin_map.png"/><span>地址</span></a></div>
    </div>
    {*<div class="footer">*}
        {*{include:core/layout/templates/footer.tpl}*}

    {*</div>*}
    {*站长统计*}
    <div id="statistic">

        <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
            document.write(unescape("%3Cspan id='cnzz_stat_icon_1000272647'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "v1.cnzz.com/z_stat.php%3Fid%3D1000272647%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
    </div>
</div>

{* General Javascript *}
{iteration:jsFiles}
<script src="{$jsFiles.file}"></script>
{/iteration:jsFiles}




{* Site wide HTML *}
{$siteHTMLFooter}
{* baidu bridge *}
{*<script src='http://hm.baidu.com/h.js?ae909aeae8a4eef49abaf631f1ae8caf' type='text/javascript'></script>*}


{* floating buttons *}
{*
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
                $('#goTop')[window.pageYOffset == 0? 'fadeOut': 'fadeIn']('slow');
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
            window.onscroll = checkGoTop;
            checkGoTop();
        })()
    </script>
</div>

*}
<script type="text/javascript">
    $('#tagCloudWidget').click(function(){
        $(this).toggleClass('expanded');
    });
    $('div#main h1').click(function(){
        $('.sideNavigation').toggleClass('expanded');
    })
</script>