<footer id="footer">
	<div class="container">

		<div id="footerLogo">
			<p>&copy; {$now|date:'Y'} {$siteTitle}</p>
		</div>
		<nav id="footerNavigation">
			<h4>{$lblFooterNavigation}</h4>
			<ul>
				{iteration:footerLinks}
					<li{option:footerLinks.selected} class="selected"{/option:footerLinks.selected}>
						<a href="{$footerLinks.url}" title="{$footerLinks.title}"{option:footerLinks.rel} rel="{$footerLinks.rel}"{/option:footerLinks.rel}>
							{$footerLinks.navigation_title}
						</a>
                        {option:!footerLinks.last}|{/option:!footerLinks.last}
					</li>

				{/iteration:footerLinks}

			</ul>
		</nav>
	</div>
</footer>

