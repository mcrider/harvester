{**
 * templates/index/index.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 * $Id$
 *}
{strip}
{assign var=pageTitleTranslated value=$title}
{include file="common/header.tpl"}
{/strip}

<br />

{if $intro}{$intro|nl2br}{/if}

<br /><br />

<h4>{$archiveCount} {translate key="archive.archives"}</h4>
<div class="homeArchivesContainer">
{iterate from=archives item=archive}
	<div class="archive"><a href="{$archive->getUrl()|escape}" target="_new">{$archive->getTitle()|escape}</a> ({$archive->getRecordCount()} {translate key="record.records"})</div>
{/iterate}
</div>

{include file="common/footer.tpl"}

