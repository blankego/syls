{* don't delete the bannerWidgetURL class, it is used in javascript *}

{option:item}
	<aside id="bannerWidget" class="mod">
		<div class="inner">
			<div class="bd">
				{option:isSWF}
					<script src="/frontend/modules/banners/js/swfobject.js"></script>
					<script type="text/javascript">
						swfobject.embedSWF("/frontend/files/banners/original/{$item.id}_{$item.file}", "bannerWidgetSWFContent-{$item.id}-{$microtime}", "{$item.width}", "{$item.height}", "9.0.0");
					</script>
					<a class="bannerWidgetURL linkedImage" href="{$item.url}" title="{$item.name}" data-id="{$item.id}">
						{* the Flash overlay is a dirty little 'hack' that makes it possible to click on the parent link when the swf contains a click action. *}
						<div class="flashOverlay" style="width: {$item.width}px; height: {$item.height}px; position: absolute;"></div>
						<div id="bannerWidgetSWFContent-{$item.id}-{$microtime}"></div>
					</a>
				{/option:isSWF}

				{option:!isSWF}
					<a class="bannerWidgetURL linkedImage" href="{$item.url}" title="{$item.name}" data-id="{$item.id}">
						<img src="/frontend/files/banners/resized/{$item.id}_{$item.file}" alt="{$item.name}" width="{$item.width}" height="{$item.height}" />
					</a>
				{/option:!isSWF}
			</div>
		</div>
	</aside>
{/option:item}