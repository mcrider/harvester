{**
 * templates/browse/index.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Browse page.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="navigation.browse"}
{assign var="helpTopicId" value="index.browse"}
{include file="common/header.tpl"}
{/strip}

<br />

<div id="archives">
{iterate from=archives item=archive}
	<div class="archive">
		{if !$notFirstArchive}
			{assign var=notFirstArchive value=1}
			&#187; <a href="{url path="all"}">{translate key="browse.browseAll"}</a><br/><br/>
		{/if}

		<span class="archiveTitle"><a href="{url path=$archive->getArchiveId()}">{$archive->getTitle()|escape}</a></span>
		<span class="archiveCount">{translate key="browse.recordCount" count=$archive->getRecordCount()}</span>

		{assign var="archiveImage" value=$archive->getSetting('archiveImage')}
		{if $archiveImage}
			<div class="archiveImage">
				<a href="{url path=$archive->getArchiveId()}" class="action"><img src="{$publicFilesDir}/{$archiveImage.uploadName|escape:"url"}" {if $archiveImage.altText != ''}alt="{$archiveImage.altText|escape}"{else}alt="{translate key="archive.image"}"{/if} /></a>
			</div>
		{/if}

		<p class="archiveDescription">
			{$archive->getSetting('description')|strip_unsafe_html|nl2br}<br />
		</p>
	</div>
{/iterate}
</div>

<div style="clear:left;"></div>

{if $archives->wasEmpty()}
	<p>{translate key="admin.archives.noneCreated"}</p>
{else}
	{page_info iterator=$archives}&nbsp;&nbsp;&nbsp;&nbsp;{page_links anchor="archives" name="archives" iterator=$archives}
{/if}

{include file="common/footer.tpl"}

