{assign var="cfgTwCardType" value="{cfg name='meta.twitter.card_type'}"}
{assign var="cfgSiteUrl" value="{cfg name='path.root.web'}"}
{assign var="cfgSiteName" value="{cfg name='view.name'}"}
{assign var="cfgFbAdmins" value="{cfg name='custom.meta.facebook.admins'}"}

{if $oBlog}
  {include file='custom/header.metadata.blog.tpl'}
{elseif $oTopic}
  {include file='custom/header.metadata.topic.tpl'}
{elseif $oUserProfile}
  {include file='custom/header.metadata.profile.tpl'}
{else}
  <meta name="description" content="{$sHtmlDescription}" />
  <meta name="keywords" content="{$sHtmlKeywords}" />
  <meta name="copyright" content="{$cfgSiteName}" />
{/if}
