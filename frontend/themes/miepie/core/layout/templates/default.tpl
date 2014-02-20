{option:isMobile}
{include:core/layout/templates/head_mobile.tpl}

<body class="{$LANGUAGE}" itemscope itemtype="http://schema.org/WebPage">
{include:core/layout/templates/top_mobile.tpl}
{/option:isMobile}
{option:!isMobile}
{include:core/layout/templates/head.tpl}

<body class="{$LANGUAGE}" itemscope itemtype="http://schema.org/WebPage">
{include:core/layout/templates/top.tpl}
{/option:!isMobile}
		<div id="main">
			<div class="container">

				{* Left column *}
				<div class="col col-3 sideCol">

					{* Subnavigation *}
					<nav class="sideNavigation">
						<h4>{$lblSubnavigation|ucfirst}</h4>
						{$var|getsubnavigation:'page':{$page.id}:2}
					</nav>

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

				{* Main column *}
				<div class="col col-9 lastCol mainCol">

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

                    <!-- sharing -->
                    <div class="bshare-custom"><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到人人网" class="bshare-renren"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count">0</span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>

				</div>
			</div>
            <div class="clearBoth"></div>

		</div>
		<noscript>
			<div class="message notice">
				<h4>{$lblEnableJavascript|ucfirst}</h4>
				<p>{$msgEnableJavascript}</p>
			</div>
		</noscript>


{option:!isMobile}
{include:core/layout/templates/bottom.tpl}

{option:widgetTagsTagCloud}
    <!--[if lt IE 9]><script type="text/javascript" src="{$THEME_URL}/core/js/excanvas.js"></script><![endif]-->
    <script src="{$THEME_URL}/core/js/jquery.mousewheel.min.js" type="text/javascript"></script>
    <script src="{$THEME_URL}/core/js/jquery.tagsphere.min.js" type="text/javascript"></script>
    <script>
        $(document).ready(function() {
            if(!$('#tagCloud')
                    .tagcloud({
                        centrex:110,
                        centrey:110,
                        init_motion_x:10,
                        init_motion_y:10,
                        rotate_factor: -3.5
                    })){
                $('#tagCloud').hide();
            }
        });
    </script>
{/option:widgetTagsTagCloud}

{/option:!isMobile}
{option:isMobile}
{include:core/layout/templates/bottom_mobile.tpl}
{/option:isMobile}
</body>
</html>