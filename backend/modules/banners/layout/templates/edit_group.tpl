{include:{$BACKEND_CORE_PATH}/layout/templates/head.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/structure_start_module.tpl}

{form:edit}
	<div class="box">
		<div class="heading">
			<h3>{$lblBanners|ucfirst}: {$lblEditGroup}</h3>
		</div>
		<div class="options horizontal">
			<p>
				<label for="name">{$lblTitle|ucfirst}<abbr title="{$lblRequiredField}">*</abbr></label>
				{$txtName} {$txtNameError}
			</p>
			<p>
				<label>{$lblSize|ucfirst}</label>
				<select disabled="disabled">
					<option value="{$standard.name} - {$standard.width}x{$standard.height}">{$standard.name} - {$standard.width}x{$standard.height}</option>
				</select>
			</p>
		</div>
	</div>

	{option:dgBanners}
		<div class="datagridHolder">
			{$dgBanners}
		</div>
	{/option:dgBanners}

	{option:formErrors}
		<p class="formError"><span>{$formErrors}</span></p>
	{/option:formErrors}

	<div class="fullwidthOptions">
		{option:showBannersDeleteGroup}
		<a href="{$var|geturl:'delete_group'}&amp;id={$item.id}" data-message-id="confirmDelete" class="askConfirmation button linkButton icon iconDelete">
				<span>{$lblDelete|ucfirst}</span>
		</a>
		<div id="confirmDelete" title="{$lblDelete|ucfirst}?" style="display: none;">
			<p>
				{$msgConfirmDeleteGroup|sprintf:{$item.name}}
			</p>
		</div>
		{/option:showBannersDeleteGroup}

		<div class="buttonHolderRight">
			<input id="editButton" class="inputButton button mainButton" type="submit" name="editGroup" value="{$lblSave|ucfirst}" />
		</div>
	</div>
{/form:edit}

{include:{$BACKEND_CORE_PATH}/layout/templates/structure_end_module.tpl}
{include:{$BACKEND_CORE_PATH}/layout/templates/footer.tpl}