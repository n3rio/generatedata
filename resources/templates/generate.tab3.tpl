<div id="settingsTabMessage" class="gdMessage {if $success}gdNotify{elseif !$success}gdError{/if} gdMarginTop" {if $message}style="display:block"{/if}>
	<a href="#" class="gdMessageClose">X</a>
	<p>{$message}</p>
</div>

<form action="./#t3" method="post" id="gdSettingsForm">
	<input type="hidden" name="updateSettings" value="1" />

	{if $settings.userAccountSetup != "anonymousAdmin"}
		<h3>{$L.account_settings}</h3>

		<div>
			<div>
				<input type="radio" name="userAccountSetup" id="acs2" value="single" {if $settings.userAccountSetup == "single"}checked="checked"{/if} />
				<label for="acs2">{$L.single_user_account_requires_login}</label>
			</div>
			<div style="margin-bottom: 20px">
				<input type="radio" name="userAccountSetup" id="acs3" value="multiple" {if $settings.userAccountSetup == "multiple"}checked="checked"{/if} />
				<label for="acs3">{$L.multiple_accounts}</label>
			</div>
		</div>
	{/if}

	<h3>{$L.plugins}</h3>

    <button class="gdPrimaryButton" id="gdResetPluginsBtn" style="float: right; margin-top: 0">{$L.reset_plugins}</button>

    <p>
		{$L.plugins_intro}
	</p>

    {if $useMinifiedResources}
        <div class="gdNotify gdMarginTop" style="display:block; margin-bottom: 15px">
            <p>
                {$L.reset_plugins_with_bundling}
            </p>
        </div>
    {/if}

    <div id="gdPlugins">
        <div class="gdPluginSection">
            <div class="gdPluginSectionHeader">
                <input type="checkbox" id="gdDataTypePluginList" class="gdToggleAll" />
                <label for="gdDataTypePluginList">{$L.data_types}</label>
            </div>
            <div id="gdDataTypeResponse">
                <ul>
                    {foreach from=$allDataTypes key=k item=i}
                    <li>
                        <input type="checkbox" id="plugin-dt-{$i->getFolder()}" name="selectedDataTypes[]" value="{$i->getFolder()}" />
                        <label for="plugin-dt-{$i->getFolder()}">{$i->getName()}</label>
                    </li>
                    {/foreach}
                </ul>
            </div>
        </div>
        <div class="gdPluginSection">
            <div class="gdPluginSectionHeader">
                <input type="checkbox" id="gdExportTypePluginList" class="gdToggleAll" />
                <label for="gdExportTypePluginList">{$L.export_types}</label>
            </div>
            <div id="gdExportTypeResponse">
                <ul>
                    {foreach from=$allExportTypes key=k item=i}
                    <li>
                        <input type="checkbox" id="plugin-et-{$i->getFolder()}" name="selectedExportTypes[]" value="{$i->getFolder()}" />
                        <label for="plugin-et-{$i->getFolder()}">{$i->getName()}</label>
                    </li>
                    {/foreach}
                </ul>
            </div>
        </div>
        <div class="gdPluginSection">
            <div class="gdPluginSectionHeader">
                <input type="checkbox" id="gdCountryPluginList" class="gdToggleAll" />
                <label for="gdCountryPluginList">{$L.countries}</label>
            </div>
            <div id="gdCountriesResponse">
                <ul>
                    {foreach from=$allCountryPlugins key=k item=i}
                    <li>
                        <input type="checkbox" id="plugin-c-{$i->getFolder()}" name="selectedCountries[]" value="{$i->getFolder()}" />
                        <label for="plugin-c-{$i->getFolder()}">{$i->getName()}</label>
                    </li>
                    {/foreach}
                </ul>
            </div>
        </div>
	</div>

	<h3>{$L.developer}</h3>

	<p>
		{$L.developer_intro}
	</p>

	<div class="cols2">
		<div class="col">
			<div>
				<input type="checkbox" name="consoleWarnings" id="gdSettingsConsoleWarnings"
					   value="enabled" {if $settings.consoleWarnings == "enabled"}checked="checked"{/if} />
				<label for="gdSettingsConsoleWarnings">{$L.list_console_warn_events}</label>
			</div>
			<div>
				<input type="checkbox" name="consoleEventsPublish" id="gdSettingsConsoleEventsPublish"
					   value="enabled" {if $settings.consoleEventsPublish == "enabled"}checked="checked"{/if} />
				<label for="gdSettingsConsoleEventsPublish">{$L.list_module_publish_events}</label>
			</div>
			<div>
				<input type="checkbox" name="consoleEventsSubscribe" id="gdSettingsConsoleEventsSubscribe"
					   value="enabled" {if $settings.consoleEventsSubscribe == "enabled"}checked="checked"{/if} />
				<label for="gdSettingsConsoleEventsSubscribe">{$L.list_module_subscribe_events}</label>
			</div>
			<div>
				<input type="checkbox" name="consoleCoreEvents" id="gdSettingsConsoleCoreEvents"
					   value="enabled" {if $settings.consoleCoreEvents == "enabled"}checked="checked"{/if} />
				<label for="gdSettingsConsoleCoreEvents">{$L.list_core_events}</label>
			</div>
		</div>
		<div class="col">
			<label for="consoleEventsModuleList">{$L.limit_pub_sub_console_messages}</label>
			{assign var=label1 value="data-placeholder=\"`$L.all_data_type_plugins`\""}
			{data_types_dropdown name="consoleEventsDataTypePlugins" id="consoleEventsDataTypePlugins"
			style="width:500px" multiple=true extras=$label1
			includeDefaultOption=false selected=$settings.consoleEventsDataTypePlugins}

			{assign var=label2 value="data-placeholder=\"`$L.all_export_type_plugins`\""}
			{export_types_dropdown name="consoleEventsExportTypePlugins" id="consoleEventsExportTypePlugins"
			style="width:500px" multiple=true extras=$label2
			includeDefaultOption=false selected=$settings.consoleEventsExportTypePlugins}
		</div>
	</div>

	<div class="gdClear"></div>

	<p>
		<button class="gdPrimaryButton" id="updateSettingsBtn">{$L.update_settings}</button>
	</p>
</form>
