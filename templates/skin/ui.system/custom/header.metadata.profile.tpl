{assign var="userUrl" value="{$oUserProfile->getUserWebPath()}"}
{assign var="userLogin" value="{$oUserProfile->getLogin()}"}
{assign var="userImg" value="{$oUserProfile->getProfileFotoPath()}"}
{assign var="userRating" value="{$oUserProfile->getRating()}"}
{assign var="userSkill" value="{$oUserProfile->getSkill()}"}
{assign var="userDateReg" value="{date_format date=$oUserProfile->getDateRegister() format='j F Y'}"}
{assign var="userSex" value="{$oUserProfile->getProfileSex()}"}
{if $userSex == "man"}
  {assign var="userSex" value="male"}
{elseif $userSex == "woman"}
  {assign var="userSex" value="female"}
{else}
  {assign var="userSex" value=""}
{/if}
{if {cfg name='custom.user.vote'}}
  {assign var="userAbout" value="{$userLogin} {$aLang.meta_user_about}. {$aLang.meta_user_about_joined}: {$userDateReg} / {$aLang.meta_user_about_rating}: {$userRating} / {$aLang.meta_user_about_skill}: {$userSkill}"}
{else}
  {assign var="userAbout" value="{$userLogin} {$aLang.meta_user_about}. {$aLang.meta_user_about_joined}: {$userDateReg}"}
{/if}

<meta name="description" content="{$userAbout}" />
<meta name="keywords" content="{$sHtmlKeywords}" />
<meta name="author" content="{$userLogin}" />
<meta name="copyright" content="{$cfgSiteName}" />
<!-- Schema.org for Google Plus -->
<!-- <meta itemprop="name" content="{$userLogin}" /> -->
<!-- <meta itemprop="description" content="{$userAbout}" /> -->
<!-- <meta itemprop="image" content="{$userImg}" /> -->
<!-- / Schema.org for Google Plus -->
<!-- Twitter Card -->
<meta name="twitter:card" content="{$cfgTwCardType}" />
<meta name="twitter:domain" content="{$cfgSiteUrl}" />
<meta name="twitter:title" content="{$userLogin}" />
<meta name="twitter:description" content="{$userAbout}" />
<meta name="twitter:creator" content="@{$userLogin}" />
<meta name="twitter:image" content="{$userImg}" />
<!-- / Twitter Card -->
<!-- Open Graph -->
<meta property="og:title" content="{$userLogin}" />
<meta property="og:type" content="profile" />
<meta property="og:url" content="{$userUrl}" />
<meta property="og:image" content="{$userImg}" />
<meta property="og:description" content="{$userAbout}" />
<meta property="og:site_name" content="{$cfgSiteName}" />
<meta property="og:see_also" content="{$cfgSiteUrl}" />
<meta property="profile:username" content="{$userLogin}" />
{if $userSex}
  <meta property="profile:gender" content="{$userSex}" />
{/if}
<meta property="fb:admins" content="{$cfgFbAdmins}" />
<!-- / Open Graph -->
