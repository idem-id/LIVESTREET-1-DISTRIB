{assign var="blogUrl" value="{$oBlog->getUrlFull()}"}
{assign var="blogAuthor" value="{$oBlog->getOwner()->getLogin()}"}
{assign var="blogAuthorImg" value="{$oBlog->getOwner()->getProfileFotoPath()}"}
{assign var="blogTitle" value="{$oBlog->getTitle()|escape:'html'}"}
{assign var="blogImg" value="{$oBlog->getAvatarPath()}"}
{assign var="blogDateAdd" value="{date_format date=$oBlog->getDateAdd() format='c'}"}
{assign var="blogDateEdit" value="{date_format date=$oBlog->getDateEdit() format='c'}"}
{if !$blogImg}
  {assign var="blogImg" value="{$blogAuthorImg}"}
{/if}

<meta name="description" content="{$sHtmlDescription}" />
<meta name="keywords" content="{$sHtmlKeywords}" />
<meta name="author" content="{$blogAuthor}" />
<meta name="copyright" content="{$cfgSiteName}" />
<!-- Twitter Card -->
<meta name="twitter:card" content="{$cfgTwCardType}" />
<meta name="twitter:domain" content="{$cfgSiteUrl}" />
<meta name="twitter:title" content="{$blogTitle}" />
<meta name="twitter:description" content="{$sHtmlDescription}" />
<meta name="twitter:creator" content="@{$blogAuthor}" />
<meta name="twitter:image" content="{$blogImg}" />
<!-- / Twitter Card -->
<!-- Open Graph -->
<meta property="og:title" content="{$blogTitle}" />
<meta property="og:type" content="article" />
<meta property="og:url" content="{$blogUrl}" />
<meta property="og:image" content="{$blogImg}" />
<meta property="og:description" content="{$sHtmlDescription}" />
<meta property="og:site_name" content="{$cfgSiteName}" />
<meta property="og:see_also" content="{$cfgSiteUrl}" />
<meta property="article:published_time" content="{$blogDateAdd}" />
<!-- <meta property="article:modified_time" content="{$blogDateEdit}" /> -->
<meta property="fb:admins" content="{$cfgFbAdmins}" />
<!-- / Open Graph -->
