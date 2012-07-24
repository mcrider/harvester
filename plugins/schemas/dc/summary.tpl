{**
 * plugins/schemas/dc/summary.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display a summary of a Dublin Core record.
 *
 * $Id$
 *}
<span class="title">{$record->getTitle()|strip_unsafe_html|truncate:90:"...":false:false:false|default:"&mdash"}</span><br />
<div class="recordContents">
	<span class="author">{$record->getAuthorString()|escape|default:"&mdash;"}</span><br />
	{assign var=parsedContents value=$record->getParsedContents()}

	{assign var=archive value=$record->getArchive()}
	<span><a href="{url page='browse' op='index' path=$archive->getArchiveId()}">{$archive->getTitle()}</a></span><br />

	<span class="date">
		{* Just find one date entry *}
		{foreach from=$parsedContents.date item=date}{/foreach}
		{$date|strtotime|date_format:$dateFormatShort}
	</span><br/>
	<a href="{url page="record" op="view" path=$record->getRecordId()}" class="action">{translate key="browse.viewRecord"}</a>{if $record->getUrl()|assign:"recordUrl":true}&nbsp;|&nbsp;<a href="{$recordUrl}" class="action">{translate key="browse.viewOriginal"}</a>{/if}
</div>
