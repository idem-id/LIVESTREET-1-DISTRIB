{assign var="topicUrl" value="{$oTopic->getUrl()}"}
{assign var="topicAuthor" value="{$oTopic->getUser()->getLogin()}"}
{assign var="topicAuthorImg" value="{$oTopic->getUser()->getProfileFotoPath()}"}
{assign var="topicTitle" value="{$oTopic->getTitle()|escape:'html'}"}
{assign var="topicImg" value="{$oTopic->getPreviewImageWebPath({cfg name='meta.thumbnail.img_size'})}"}
{assign var="topicDateAdd" value="{date_format date=$oTopic->getDateAdd() format='c'}"}
{assign var="topicDateEdit" value="{date_format date=$oTopic->getDateEdit() format='c'}"}
{if !$oTopic->getPreviewImageWebPath()}
  {assign var="topicImg" value="{$topicAuthorImg}"}
{/if}

<meta name="description" content="{$sHtmlDescription}" />
<meta name="keywords" content="{$sHtmlKeywords}" />
<meta name="author" content="{$topicAuthor}" />
<meta name="copyright" content="{$cfgSiteName}" />
<!-- Twitter Card -->
<meta name="twitter:card" content="{$cfgTwCardType}" />
<meta name="twitter:domain" content="{$cfgSiteUrl}" />
<meta name="twitter:title" content="{$topicTitle}" />
<meta name="twitter:description" content="{$sHtmlDescription}" />
<meta name="twitter:creator" content="@{$topicAuthor}" />
<meta name="twitter:image" content="{$topicImg}" />
<!-- / Twitter Card -->
<!-- Open Graph -->
<meta property="og:title" content="{$topicTitle}" />
<meta property="og:type" content="article" />
<meta property="og:url" content="{$topicUrl}" />
<meta property="og:image" content="{$topicImg}" />
<meta property="og:description" content="{$sHtmlDescription}" />
<meta property="og:site_name" content="{$cfgSiteName}" />
<meta property="og:see_also" content="{$cfgSiteUrl}" />
<meta property="article:published_time" content="{$topicDateAdd}" />
<meta property="article:modified_time" content="{$topicDateEdit}" />
<meta property="article:tag" content="{$sHtmlKeywords}" />
<meta property="fb:admins" content="{$cfgFbAdmins}" />
<!-- / Open Graph -->
