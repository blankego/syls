{*
	variables that are available:
	- {$questions}: contains all questions inside this category
*}

<section id="faqCategory" class="mod">
	<h1>{$category.title}</h1>
	<div class="bd">
		{option:questions}
			<section>
				<div class="bd">
					<ul>
						{iteration:questions}
							<li><a href="{$questions.full_url}">{$questions.question}</a></li>
						{/iteration:questions}
					</ul>
				</div>
			</section>
		{/option:questions}

		{option:!questions}
			<p>{$msgNoQuestionsInCategory|ucfirst}</p>
		{/option:!questions}

		<p><span class="bottomInfo">
			<a href="{$var|geturlforblock:'faq'}" title="{$lblToFaqOverview|ucfirst}">{$lblToFaqOverview|ucfirst}</a></p>
		</span></p>
	</div>
</section>