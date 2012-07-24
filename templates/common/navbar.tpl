{**
 * templates/common/navbar.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}
<div id="navbar">
	<ul class="menu">
		<li id="home"><a href="{url page="index"}">{translate key="navigation.home"}</a></li>
		<li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>

		{if $isUserLoggedIn}
			<li id="userHome"><a href="{url page="user"}">{translate key="navigation.userHome"}</a></li>
		{else}
			<li id="login"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
		{/if}

		{if $enableSubmit}
			<li id="register"><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
		{/if}{* $isUserLoggedIn *}

		<li id="browse"><a href="{url page="browse"}">{translate key="navigation.browse"}</a></li>

		{call_hook name="Templates::Common::Header::Navbar"}

		{foreach from=$navMenuItems item=navItem}
			{if $navItem.url != '' && $navItem.name != ''}
				<li class="navitem"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{url page=""}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			{/if}
		{/foreach}
		<li id="help"><a href="javascript:openHelp('{if $helpTopicId}{get_help_id key="$helpTopicId" url="true"}{else}{url page="help"}{/if}')">{translate key="help.help"}</a></li>

		<li><span class="vSeparator">&nbsp;</span></li>


		<li id="quickSearch">
			<form class="searchform" name="search" action="{url page='misearch' op='results'}">
				<input name="query" class="searchfield" type="text" value="Quick Search..." {literal}onfocus="if (this.value == 'Quick Search...') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Quick Search...';}"{/literal} />
				<input class="searchbutton" type="button" value="Go" />
			</form>
		</li>
	</ul>
</div>

