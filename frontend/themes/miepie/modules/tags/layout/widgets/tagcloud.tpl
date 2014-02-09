{*
	variables that are available:
	- {$widgetTagsTagCloud}: contains an array with the most popular tags
*}

{option:widgetTagsTagCloud}
    <section id="tagCloudWidget" class="mod">

        <header class="hd">
            <h3>{$lblTags|ucfirst}</h3>
        </header>
        <div class="bd content">
            <div class="tagCloud" id="tagCloud">
                <ul>
                    {iteration:widgetTagsTagCloud}
                        <li>
                            <a href="{$widgetTagsTagCloud.url}"
                               rel="{$widgetTagsTagCloud.number}"
                                    {*style="font-size: {$widgetTagsTagCloud.number}0ex"*}
                                    >
                                {$widgetTagsTagCloud.name}
                            </a>
                        </li>
                    {/iteration:widgetTagsTagCloud}
                </ul>
            </div>
        </div>


    </section>
{/option:widgetTagsTagCloud}